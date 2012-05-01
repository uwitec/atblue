package cn.com.atblue.workflow.runtime;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.workflow.bean.*;
import cn.com.atblue.workflow.dao.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 流程实例状态：初始化1、运行2、暂停3、完成9
 * 活动实例状态：初始化1、在处理2、处理完成9
 * 活动类型：开始1、业务2、结束9
 */
public class Workflow {
    private WActivityDAO wActivityDAO;
    private WConnectDAO wConnectDAO;
    private WInstanceDAO wInstanceDAO;
    private WLineDAO wLineDAO;
    private WProcessDAO wProcessDAO;
    private WWorkflowDAO wWorkflowDAO;

    private WDao wDao;

    /**
     * 创建流程实例设置状态为9，创建开始活动实例设置状态为9，从开始活动查找连接定义，
     * 并创建连接实例设置待处理人和实际处理人为当前用户，创建下一个活动实例并设置状态1，
     * 返回流程实例、当前活动实例、连接实例编码
     *
     * @param flowId
     * @param userId
     * @return
     * @throws WorkflowException
     */
    public Status startWorkflow(String flowId, String userId) throws WorkflowException {
        WProcess wProcess = new WProcess();
        wProcess.setFlowId("flowId");
        wProcess.setProcessId(StringUtil.getUUID());
        wProcess.setCreateTime(new Date());
        wProcess.setCreatePerson(userId);
        wProcess.setProcessStatus("1");
        wProcessDAO.addWProcess(wProcess);

        //查找开始活动定义信息
        WActivity startActivity = wDao.getStartActivity(flowId);
        if (startActivity == null)
            throw new WorkflowException("无法查询到该工作流流开始活动定义的信息：" + flowId);
        //创建开始活动实例
        WInstance wInstance = new WInstance();
        wInstance.setInstanceId(StringUtil.getUUID());
        wInstance.setActivityId(startActivity.getActivityId());
        wInstance.setInstanceStatus("9");//运行
        wInstance.setProcessId(wProcess.getProcessId());
        wInstance.setCreateTime(new Date());
        wInstance.setCreatePerson(userId);
        wInstanceDAO.addWInstance(wInstance);
        //从开始活动查找连接定义信息
        WLine wLine = wDao.getStartLine(startActivity.getActivityId());
        if (wLine == null)
            throw new WorkflowException("无法查询到该工作流流开始连接定义的信息：" + flowId);
        //创建下一个活动实例
        WInstance nextInstance = new WInstance();
        nextInstance.setInstanceId(StringUtil.getUUID());
        nextInstance.setActivityId(wLine.getEndActivity());
        nextInstance.setInstanceStatus("1");//初始化
        nextInstance.setProcessId(wProcess.getProcessId());
        nextInstance.setCreateTime(new Date());
        nextInstance.setCreatePerson(userId);
        wInstanceDAO.addWInstance(nextInstance);
        //创建连接实例设置待处理人和实际处理人为当前用户
        WConnect wConnect = new WConnect();
        wConnect.setConnectId(StringUtil.getUUID());
        wConnect.setLineId(wLine.getLineId());
        wConnect.setStartInstance(wInstance.getInstanceId());
        wConnect.setEndInstance(nextInstance.getInstanceId());
        wConnect.setCreateTime(new Date());
        wConnect.setPendingPerson(userId);
        wConnect.setProcessId(wProcess.getProcessId());
//        wConnect.setRealPerson(userId);
        wConnectDAO.addWConnect(wConnect);
        wProcess.setInstanceId(wInstance.getInstanceId());
        wProcess.setConnectId(wConnect.getConnectId());
        wProcessDAO.modWProcess(wProcess);
        //返回流程实例、当前活动实例、连接实例编码
        Status status = new Status();
        status.setProcessId(wProcess.getProcessId());
        status.setConnectId(wConnect.getConnectId());
        status.setInstanceId(wInstance.getInstanceId());
        return status;
    }

    /**
     * 根据连接实例编码和当前用户id获取连接实例（流程实例状态为2，在待处理人中有该用户，实际处理人中没有），
     * 如果为null，则当前活动没有该用户的任务，如果有返回连接实例编码
     *
     * @param connectId
     * @param userId
     * @return
     * @throws WorkflowException
     */
    public String claimMission(String processId, String connectId, String userId) throws WorkflowException {
        Map paramMap = new HashMap();
        paramMap.put("connectId", connectId);
        WConnect wConnect = wConnectDAO.queryForBean(paramMap);
        paramMap.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(paramMap);
        //流程结束返回null
        if (wProcess == null || "9".equals(wProcess.getProcessStatus())) return null;
        boolean hasInPendingPerson = false;
        boolean hasInRealPerson = false;
        if (wConnect != null) {
            //查看待处理人里面是否有该用户
            String pendingPerson = wConnect.getPendingPerson();
            if (!StringUtil.isBlankOrEmpty(pendingPerson)) {
                String[] persons = StringUtil.split(pendingPerson, ",");
                if (persons != null) {
                    for (int i = 0; i < persons.length; i++) {
                        if (userId.equals(persons[i])) {
                            hasInPendingPerson = true;
                            break;
                        }
                    }
                }
            }
            //查看实际处理人里面是否有该用户
            String realPerson = wConnect.getRealPerson();
            if (!StringUtil.isBlankOrEmpty(realPerson)) {
                String[] rpersons = StringUtil.split(realPerson, ",");
                if (rpersons != null) {
                    for (int i = 0; i < rpersons.length; i++) {
                        if (userId.equals(rpersons[i])) {
                            hasInRealPerson = true;
                            break;
                        }
                    }
                }
            }
        }
        if (hasInPendingPerson && !hasInRealPerson) {
            return connectId;
        }
        System.out.println("connectId:"+connectId);
        return null;
    }

    /**
     * 如果当前连接实例的待处理人为1个，则4，否则5
     * 4、设置下一个活动实例的状态为9，并设置流程实例中的当前活动实例编码为下一个活动实例的编码，转到6
     * 5、设置下一个活动实例的状态为2，并设置流程实例中的当前活动实例编码为下一个活动实例的编码，
     * 并设置当前用户到连接实例的实际处理人中。查找当前连接的定义，获取会签类型和会签值字段，
     * 如果是全部同意，则根据待处理人=实际处理人信息，则到6，如果是部分同意，则根据会签值百分比，判断是否结束该活动
     * 6、设置当前活动实例状态为9，根据当前活动定义的编码、变量值和当前用户查询下一个的连接定义，并创建该连接实例和结束活动实例，设置待处理人为nextuser（可以多人），结束活动实例状态为1
     * 7、如果结束活动实例是结束活动，则修改当前流程实例的状态为结束，设置结束活动为当前活动
     *
     * @param connectId
     * @param userId
     * @param nextUserIds
     * @param varValue
     */
    public String completeMission(String processId, String connectId, String userId, String[] nextUserIds, String varValue) throws WorkflowException {
        //如果当前连接实例的待处理人为1个，则4，否则5
        Map paramMap = new HashMap();
        paramMap.put("connectId", connectId);
        WConnect wConnect = wConnectDAO.queryForBean(paramMap);
        paramMap.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(paramMap);
        if (wConnect == null)
            throw new WorkflowException("根据连接实例编码无法查询到连接实例信息：" + connectId);
        String pendingPerson = wConnect.getPendingPerson();
        if (!StringUtil.isBlankOrEmpty(pendingPerson)) {
            String curActivityId = "";
            if (pendingPerson.indexOf(",") != -1) {//会签
                //设置下一个活动实例的状态为2，并设置流程实例中的当前活动实例编码为下一个活动实例的编码
                String nextInstanceId = wConnect.getEndInstance();
                paramMap.put("instanceId", nextInstanceId);
                WInstance wInstance = wInstanceDAO.queryForBean(paramMap);
                wInstance.setInstanceStatus("2");//在处理
                wInstanceDAO.modWInstance(wInstance);
                wProcess.setInstanceId(wInstance.getInstanceId());
                wProcessDAO.modWProcess(wProcess);
                curActivityId = wInstance.getActivityId();
                //并设置当前用户到连接实例的实际处理人中
                if (!StringUtil.isBlankOrEmpty(wConnect.getRealPerson())) {
                    wConnect.setRealPerson("," + wConnect.getRealPerson());
                } else {
                    wConnect.setRealPerson(wConnect.getRealPerson());
                }
                wConnectDAO.modWConnect(wConnect);
                //查找当前连接的定义，获取会签类型和会签值字段
                paramMap.put("lineId", wConnect.getLineId());
                WLine cLine = wLineDAO.queryForBean(paramMap);
                boolean agreedFinish = false;
                if ("1".equals(cLine.getCounterType())) {//全部同意
                    if (wConnect.getPendingPerson() != null && wConnect.getRealPerson() != null
                            && wConnect.getPendingPerson().equals(wConnect.getRealPerson())) {
                        agreedFinish = true;
                    }
                } else if ("2".equals(cLine.getCounterType())) {//多数同意
                    double value = cLine.getCounterValue();
                    if (getPercent(wConnect.getPendingPerson(), wConnect.getRealPerson()) >= value)
                        agreedFinish = true;
                } else {
                    agreedFinish = true;
                }
                if (agreedFinish) {
                    //根据当前活动定义的编码、变量值和当前用户查询下一个的连接定义，并创建该连接实例和结束活动实例
                    WLine nextLine = wDao.getLine(curActivityId, varValue);
                    wConnect = new WConnect();
                    wConnect.setConnectId(StringUtil.getUUID());
                    wConnect.setStartInstance(wInstance.getInstanceId());
                    wConnect.setEndInstance(nextInstanceId);
                    wConnect.setPendingPerson(StringUtil.combineStringArray(nextUserIds, ","));
                    wConnect.setConnectValue(varValue);
                    wConnect.setCreateTime(new Date());
                    wConnect.setLineId(nextLine.getLineId());
                    wConnect.setProcessId(wProcess.getProcessId());
                    wConnectDAO.addWConnect(wConnect);

                    WInstance nextInstance = new WInstance();
                    nextInstance.setInstanceId(StringUtil.getUUID());
                    nextInstance.setActivityId(nextLine.getEndActivity());
                    nextInstance.setCreatePerson(userId);
                    nextInstance.setCreateTime(new Date());
                    nextInstance.setInstanceStatus("1");
                    nextInstance.setProcessId(wProcess.getProcessId());
                    paramMap.put("activityId", nextLine.getEndActivity());
                    WActivity endActivity = wActivityDAO.queryForBean(paramMap);
                    if (endActivity != null) {
                        if ("9".equals(endActivity.getActivityType())) {
                            wProcess.setProcessStatus("9");
                            wProcessDAO.modWProcess(wProcess);
                            nextInstance.setInstanceStatus("9");
                        }
                    }
                    nextInstance.setProcessId(wProcess.getProcessId());
                    wInstanceDAO.addWInstance(nextInstance);
                    wConnect.setEndInstance(nextInstance.getInstanceId());
                    wConnectDAO.addWConnect(wConnect);
                }
            } else {
                String nextInstanceId = wConnect.getEndInstance();
                paramMap.put("instanceId", nextInstanceId);
                WInstance wInstance = wInstanceDAO.queryForBean(paramMap);
                wInstance.setInstanceStatus("9");
                wInstanceDAO.modWInstance(wInstance);
                wProcess.setInstanceId(wInstance.getInstanceId());
                wProcessDAO.modWProcess(wProcess);
                curActivityId = wInstance.getActivityId();
                wConnect.setRealPerson(userId);
                wConnectDAO.modWConnect(wConnect);
                //根据当前活动定义的编码、变量值和当前用户查询下一个的连接定义，并创建该连接实例和结束活动实例
                WLine nextLine = wDao.getLine(curActivityId, varValue);
                wConnect = new WConnect();
                wConnect.setConnectId(StringUtil.getUUID());
                wConnect.setStartInstance(nextInstanceId);

                wConnect.setPendingPerson(StringUtil.combineStringArray(nextUserIds, ","));
                wConnect.setConnectValue(varValue);
                wConnect.setCreateTime(new Date());
                wConnect.setLineId(nextLine.getLineId());
                wConnect.setProcessId(wProcess.getProcessId());
                WInstance nextInstance = new WInstance();
                nextInstance.setInstanceId(StringUtil.getUUID());
                nextInstance.setActivityId(nextLine.getEndActivity());
                nextInstance.setCreatePerson(userId);
                nextInstance.setCreateTime(new Date());
                nextInstance.setInstanceStatus("1");
                paramMap.put("activityId", nextLine.getEndActivity());
                WActivity endActivity = wActivityDAO.queryForBean(paramMap);
                if (endActivity != null) {
                    if ("9".equals(endActivity.getActivityType())) {
                        //如果是结束节点
                        wProcess.setProcessStatus("9");
                        wProcessDAO.modWProcess(wProcess);
                        nextInstance.setInstanceStatus("9");
                    }
                }
                nextInstance.setProcessId(wProcess.getProcessId());
                wInstanceDAO.addWInstance(nextInstance);
                wConnect.setEndInstance(nextInstance.getInstanceId());
                wConnectDAO.addWConnect(wConnect);
            }
        }
        System.out.println("wConnect.getConnectId():"+wConnect.getConnectId());
        return wConnect.getConnectId();
    }

    public double getPercent(String v1, String v2) {
        String[] s1 = StringUtil.split(v1, ",");
        String[] s2 = StringUtil.split(v2, ",");
        if (s1 == null || s1.length == 0 || s2 == null || s2.length == 0 ||
                StringUtil.isBlankOrEmpty(v1) || StringUtil.isBlankOrEmpty(v2)) return 0;
        if (v1.equals(v2)) return 100;
        int n = 0;
        if (s1 != null) {
            for (int i = 0; i < s1.length; i++) {
                for (int j = 0; j < s2.length; j++) {
                    if (s1[i].equals(s2[j])) {
                        n++;
                    }
                }
            }
        }
        return n / s1.length;
    }
   public String getNextRoleName(String connectId, String varValue){
       return  wDao.getNextUserRole(connectId,varValue);
   }
    public String getNextUserSelectOptions(String roleName, String orgnaId) {
        StringBuffer s = new StringBuffer("");
        String nextRole = roleName;
        if (!StringUtil.isBlankOrEmpty(nextRole)) {
            String[] roles = StringUtil.split(nextRole, "、"); //多个角色用、分割
            if (roles != null && roles.length > 0) {
                for (int i = 0; i < roles.length; i++) {
                    String role = roles[i];
                    if (role.endsWith("!")) {//角色名称后缀有！的需要限制当前登录用户的组织机构
                        String r = role.substring(0, role.length() - 1);
                        if (!StringUtil.isBlankOrEmpty(r)) {
                            List users = wDao.getUsersByRoleNameAndOrgId(r, orgnaId);
                            if (users != null && users.size() > 0) {
                                for (int j = 0; j < users.size(); j++) {
                                    Map uMap = (Map) users.get(j);
                                    s.append("<option value=\"" + StringUtil.parseNull(uMap.get("USER_ID"), "") + "\">");
                                    s.append(StringUtil.parseNull(uMap.get("REAL_NAME"), ""));
                                    s.append("</option>");
                                }
                            }
                        }
                    } else {
                        List users = wDao.getUsersByRoleName(role);
                        if (users != null && users.size() > 0) {
                            for (int j = 0; j < users.size(); j++) {
                                Map uMap = (Map) users.get(j);
                                s.append("<option value=\"" + StringUtil.parseNull(uMap.get("USER_ID"), "") + "\">");
                                s.append(StringUtil.parseNull(uMap.get("REAL_NAME"), ""));
                                s.append("</option>");
                            }
                        }
                    }
                }
            }
        }
        return s.toString();
    }

    public WActivityDAO getwActivityDAO() {
        return wActivityDAO;
    }

    public void setwActivityDAO(WActivityDAO wActivityDAO) {
        this.wActivityDAO = wActivityDAO;
    }

    public WConnectDAO getwConnectDAO() {
        return wConnectDAO;
    }

    public void setwConnectDAO(WConnectDAO wConnectDAO) {
        this.wConnectDAO = wConnectDAO;
    }

    public WInstanceDAO getwInstanceDAO() {
        return wInstanceDAO;
    }

    public void setwInstanceDAO(WInstanceDAO wInstanceDAO) {
        this.wInstanceDAO = wInstanceDAO;
    }

    public WLineDAO getwLineDAO() {
        return wLineDAO;
    }

    public void setwLineDAO(WLineDAO wLineDAO) {
        this.wLineDAO = wLineDAO;
    }

    public WProcessDAO getwProcessDAO() {
        return wProcessDAO;
    }

    public void setwProcessDAO(WProcessDAO wProcessDAO) {
        this.wProcessDAO = wProcessDAO;
    }

    public WWorkflowDAO getwWorkflowDAO() {
        return wWorkflowDAO;
    }

    public void setwWorkflowDAO(WWorkflowDAO wWorkflowDAO) {
        this.wWorkflowDAO = wWorkflowDAO;
    }

    public WDao getwDao() {
        return wDao;
    }

    public void setwDao(WDao wDao) {
        this.wDao = wDao;
    }
}
