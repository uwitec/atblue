package cn.com.atblue.workflow.runtime;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.workflow.bean.*;
import cn.com.atblue.workflow.dao.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Workflow2 {
    private WActivityDAO wActivityDAO;
    private WConnectDAO wConnectDAO;
    private WInstanceDAO wInstanceDAO;
    private WLineDAO wLineDAO;
    private WProcessDAO wProcessDAO;
    private WWorkflowDAO wWorkflowDAO;

    private WDao wDao;

    public String startWorkflow(String flowId, String userId) throws WorkflowException {
        Map paramMap = new HashMap();
        paramMap.put("flowId", flowId);
        WWorkflow wWorkflow = wWorkflowDAO.queryForBean(paramMap);
        if (wWorkflow == null || StringUtil.isBlankOrEmpty(wWorkflow.getFlowId())) {
            throw new WorkflowException("无法查询到该工作流流程定义的信息：" + flowId);
        }
        //创建工作流实例
        WProcess wProcess = new WProcess();
        wProcess.setFlowId(flowId);
        wProcess.setProcessId(StringUtil.getUUID());
        wProcess.setCreatePerson(userId);
        wProcess.setCreateTime(new Date());
        wProcess.setProcessStatus("1");//启动状态
        wProcessDAO.addWProcess(wProcess);
        //创建该工作流所有活动实例，并设置初始状态为1
        List<WActivity> aList = wDao.getAllActivities(flowId);
        if (aList == null || aList.size() == 0) {
            throw new WorkflowException("无法查询到该工作流活动的定义信息：" + flowId);
        }
        WInstance startInstance = null;
        WInstance wInstance = null;
        for (int i = 0; i < aList.size(); i++) {
            WActivity wActivity = aList.get(i);
            wInstance = new WInstance();
            wInstance.setInstanceId(StringUtil.getUUID());
            wInstance.setProcessId(wProcess.getProcessId());
            wInstance.setInstanceStatus("1");//默认状态
            wInstance.setActivityId(wActivity.getActivityId());
            wInstance.setCreatePerson(userId);
            wInstance.setCreateTime(new Date());
            wInstanceDAO.addWInstance(wInstance);
            if ("1".equals(wActivity.getActivityType())) {//活动类型为1是开始活动
                startInstance = wInstance;
            }
        }
        //设置开始活动实例的状态为9
        if (startInstance == null) {
            throw new WorkflowException("无法查询到该工作流开始活动的实例信息：" + flowId);
        }
        startInstance.setInstanceStatus("9");
        wInstanceDAO.modWInstance(startInstance);
        //查找开始活动下一个活动实例编码
        Map nextInstance = wDao.getNextInstanceId(startInstance.getActivityId());
        String nextInstanceId = StringUtil.parseNull(nextInstance.get("INSTANCE_ID"), "");
        String lineId = StringUtil.parseNull(nextInstance.get("LINE_ID"), "");
        if (StringUtil.isBlankOrEmpty(nextInstanceId)) {
            throw new WorkflowException("无法查询到该工作流开始活动后面的业务活动实例信息：" + flowId);
        }
        //创建连接实例，设置开始活动实例编码和结束活动实例编码，设置处理人为流程的创建者
        WConnect wConnect = new WConnect();
        wConnect.setConnectId(StringUtil.getUUID());
        wConnect.setCreateTime(new Date());
        wConnect.setStartInstance(startInstance.getInstanceId());
        wConnect.setEndInstance(nextInstanceId);
        wConnect.setPendingPerson(userId);
        wConnect.setLineId(lineId);
        wConnectDAO.addWConnect(wConnect);
        //设置工作流实例中的当前活动实例字段为开始活动实例
        wProcess.setInstanceId(startInstance.getInstanceId());
        wProcessDAO.modWProcess(wProcess);
        return wProcess.getProcessId();
    }

    public String receiveMission(String processId, String userId) throws WorkflowException {
        //（1）查询工作流实例，如果当前活动实例是开始活动，同时当前用户又是工作流实例的创建用户，则根据开始活动实例编码查找第一个业务活动的编码，并返回。
        // （2）如果当前活动实例不是开始活动，则根据当前用户编码、当前活动实例编码查询连接实例信息，查找下一个活动实例的编码
        Map paramMap = new HashMap();
        paramMap.put("processId", processId);
        WProcess wProcess = wProcessDAO.queryForBean(paramMap);
        if (wProcess == null || StringUtil.isBlankOrEmpty(wProcess.getProcessId())) {
            throw new WorkflowException("无法查询到该工作流实例信息：" + processId);
        }
        String curInstanceId = wProcess.getInstanceId();
        WActivity wActivity = wDao.getActivityByInstanceId(curInstanceId);
        String nextInstanceId = "";
        if (wActivity != null) {
            WConnect wConnect = wDao.getConnectByStartAndUserId(curInstanceId, userId);
            if (wConnect != null) {
                nextInstanceId = wConnect.getEndInstance();
            }
        }
        //设置当前活动实例为新的活动实例
        if (!StringUtil.isBlankOrEmpty(nextInstanceId)) {
            wProcess.setInstanceId(nextInstanceId);
            wProcessDAO.modWProcess(wProcess);
        }
        return nextInstanceId;
    }

    public void completeMission(String instanceId, String userId, String nextUserId, String varValue) {
        //保存当前活动实例的状态信息
        Map paramMap = new HashMap();
        paramMap.put("instanceId", instanceId);
        WInstance wInstance = wInstanceDAO.queryForBean(paramMap);
        wInstance.setInstanceStatus("9");
        wInstance.setDealPerson(userId);
        wInstance.setDealTime(new Date());
        wInstanceDAO.modWInstance(wInstance);
        //根据用户提供的变量值，查询下一个活动实例编码
        paramMap.put("activityId", wInstance.getActivityId());
        WActivity wActivity = wActivityDAO.queryForBean(paramMap);
        if ("9".equals(wActivity.getActivityType())) {//结束节点
            paramMap.put("processId", wInstance.getProcessId());
            WProcess wProcess = wProcessDAO.queryForBean(paramMap);
            wProcess.setProcessStatus("9");
            wProcessDAO.modWProcess(wProcess);
            return ;
        }

        Map iMap = wDao.getEndInstanceIDByStartAndVar(wInstance.getActivityId(), varValue);
        String nextInstanceId = StringUtil.parseNull(iMap.get("INSTANCE_ID"), "");
        String lineId = StringUtil.parseNull(iMap.get("LINE_ID"), "");
        WConnect wConnect = new WConnect();
        wConnect.setConnectId(StringUtil.getUUID());
        wConnect.setStartInstance(instanceId);
        wConnect.setEndInstance(nextInstanceId);
        wConnect.setPendingPerson(nextUserId);
        wConnect.setConnectValue(varValue);
        wConnect.setCreateTime(new Date());
        wConnect.setLineId(lineId);
        wConnectDAO.addWConnect(wConnect);
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
