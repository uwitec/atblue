package cn.com.atblue.workflow.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.oa.action.BaseAction;
import cn.com.atblue.workflow.bean.WActivity;
import cn.com.atblue.workflow.bean.WDefinition;
import cn.com.atblue.workflow.bean.WLine;
import cn.com.atblue.workflow.bean.WWorkflow;
import cn.com.atblue.workflow.dao.*;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WorkflowAction extends BaseAction {
    private WDao wDao;
    private WWorkflowDAO wWorkflowDAO;
    private WActivityDAO wActivityDAO;
    private WLineDAO wLineDAO;
    private WDefinitionDAO wDefinitionDAO;

    private String flowId;
    private String flowName;
    private String action;
    private String name;
    private String xml;
    private String[] activityId;
    private String[] activityName;
    private String[] activityDesc;
    private String[] activityType;
    private String[] activityOrder;
    private String[] activityRole;
    private String[] activitySfxddw;

    private String[] lineId;
    private String[] lineName;
    private String[] lineVarValue;
    private String[] startActivity;
    private String[] endActivity;

    private WWorkflow bean;
    private List dataList;
    private List activityList;
    private List lineList;
    private List roleList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(flowName))
            map.put("flowName", flowName);
        int cn = wDao.getPagedWorkflowCount(map);
        this.getPagination().setRowCount(cn);
        this.getParams().put("currentPage", this.getPagination().getPage());
        this.getParams().put("pageSize", this.getPagination().getPageSize());
        this.dataList = wDao.getPagedWorkflowList(this.getParams());
        return "list";
    }

    public String add() {
        this.roleList = wDao.getAllRoles();
        return "add";
    }

    public String mod() {
        return "mod";
    }

    public String get() {
        if (!StringUtil.isBlankOrEmpty(name)) {
            this.xml = wDao.getDefXmlByName(name);
        }
        return "get";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(flowId)) {
            Map map = new HashMap();
            map.put("flowId", flowId);
            wWorkflowDAO.delWWorkflow(map);
            wDefinitionDAO.delWDefinition(map);
        }
        return "del";
    }

    public String release() {
        if (!StringUtil.isBlankOrEmpty(flowId)) {
            Map map = new HashMap();

            map.put("flowId", flowId);
            WWorkflow wWorkflow = wWorkflowDAO.queryForBean(map);
            if (wWorkflow != null) {
                wWorkflow.setReleaseStatus("已发布");
                wWorkflowDAO.modWWorkflow(wWorkflow);
                WDefinition wDefinition = wDefinitionDAO.queryForBean(map);
                if (wDefinition != null && !StringUtil.isBlankOrEmpty(wDefinition.getFlowFile())) {
                    Document doc = null;
                    try {
                        doc = StringUtil.str2Doc(xml);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (JDOMException e) {
                        e.printStackTrace();
                    }
                    //保存活动和连接的定义信息
                    Map dataMap = new HashMap();
                    if (doc != null) {
                        Element root = doc.getRootElement();
                        Element activitiesElement = root.getChild("Activities");
                        Element transitionsElement = root.getChild("Transitions");
                        if (activitiesElement != null) {
                            List alist = activitiesElement.getChildren("Activitie");
                            if (alist != null && alist.size() > 0) {
                                for (int i = 0; i < alist.size(); i++) {
                                    Element element = (Element) alist.get(i);
                                    String id = element.getAttributeValue("id");
                                    String type = element.getAttributeValue("type");
                                    String name = element.getAttributeValue("name");
                                    WActivity wActivity = new WActivity();
                                    wActivity.setFlowId(flowId);
                                    wActivity.setActivityId(StringUtil.getUUID());
                                    wActivity.setActivityName(name);
                                    wActivity.setActivityRole(name);
                                    if(name.indexOf("!") != -1){
                                        //该角色需要限定组织
                                        wActivity.setActivitySfxddw("是");
                                    }
                                    if ("START_NODE".equals(type)) {
                                        wActivity.setActivityType("1");
                                    } else if ("EndNode".equals(type)) {
                                        wActivity.setActivityType("9");
                                    } else {
                                        wActivity.setActivityType("2");
                                    }
                                    wActivity.setActivityOrder(Integer.valueOf(id).doubleValue());

                                    wActivityDAO.addWActivity(wActivity);
                                    dataMap.put(id, wActivity.getActivityId());
                                }
                            }
                        }
                        if (transitionsElement != null) {
                            List tlist = transitionsElement.getChildren("Transition");
                            if (tlist != null && tlist.size() > 0) {
                                for (int i = 0; i < tlist.size(); i++) {
                                    Element element = (Element) tlist.get(i);
                                    String id = element.getAttributeValue("id");
                                    String from = element.getAttributeValue("from");
                                    String name = element.getAttributeValue("name");
                                    String to = element.getAttributeValue("to");
                                    WLine wLine = new WLine();
                                    wLine.setLineId(StringUtil.getUUID());
                                    wLine.setFlowId(flowId);
                                    wLine.setLineName(name);
                                    wLine.setStartActivity((String) dataMap.get(from));
                                    wLine.setEndActivity((String) dataMap.get(to));
                                    wLine.setLineVarValue(name);
                                    wLine.setCounterType("1");
                                    wLineDAO.addWLine(wLine);
                                }
                            }
                        }
                    }
                }
            }
        }
        return "release";
    }

    public String save() {
        if (!StringUtil.isBlankOrEmpty(name) &&
                !StringUtil.isBlankOrEmpty(xml)) {
            String flowId = wDao.getWorkflowIdByName(name);
            if (!StringUtil.isBlankOrEmpty(flowId)) {
                //更新
                Map map = new HashMap();
                map.put("flowId", flowId);
                WDefinition wDefinition = wDefinitionDAO.queryForBean(map);
                if (wDefinition != null) {
                    wDefinition.setUpdateTime(new Date());
                    wDefinition.setFlowFile(xml);
                    wDefinitionDAO.modWDefinition(wDefinition);
                    WWorkflow wWorkflow = wWorkflowDAO.queryForBean(map);
                    wWorkflow.setUpdateTime(new Date());
                    wWorkflowDAO.modWWorkflow(wWorkflow);
                }
            } else {
                //添加
                WWorkflow wWorkflow = new WWorkflow();
                wWorkflow.setFlowId(StringUtil.getUUID());
                wWorkflow.setFlowName(name);
                wWorkflow.setCreateTime(new Date());
                wWorkflow.setReleaseStatus("尚未发布");
                wWorkflowDAO.addWWorkflow(wWorkflow);

                WDefinition wDefinition = new WDefinition();
                wDefinition.setFlowId(wWorkflow.getFlowId());
                wDefinition.setCreateTime(new Date());
                wDefinition.setFlowFile(xml);
                wDefinitionDAO.addWDefinition(wDefinition);
            }
        }

        return "save";
    }

    public WDao getwDao() {
        return wDao;
    }

    public void setwDao(WDao wDao) {
        this.wDao = wDao;
    }

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getFlowName() {
        return flowName;
    }

    public void setFlowName(String flowName) {
        this.flowName = flowName;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public WWorkflow getBean() {
        return bean;
    }

    public void setBean(WWorkflow bean) {
        this.bean = bean;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public String[] getActivityId() {
        return activityId;
    }

    public void setActivityId(String[] activityId) {
        this.activityId = activityId;
    }

    public String[] getActivityName() {
        return activityName;
    }

    public void setActivityName(String[] activityName) {
        this.activityName = activityName;
    }

    public String[] getActivityDesc() {
        return activityDesc;
    }

    public void setActivityDesc(String[] activityDesc) {
        this.activityDesc = activityDesc;
    }

    public String[] getActivityType() {
        return activityType;
    }

    public void setActivityType(String[] activityType) {
        this.activityType = activityType;
    }

    public String[] getActivityOrder() {
        return activityOrder;
    }

    public void setActivityOrder(String[] activityOrder) {
        this.activityOrder = activityOrder;
    }

    public String[] getActivityRole() {
        return activityRole;
    }

    public void setActivityRole(String[] activityRole) {
        this.activityRole = activityRole;
    }

    public String[] getActivitySfxddw() {
        return activitySfxddw;
    }

    public void setActivitySfxddw(String[] activitySfxddw) {
        this.activitySfxddw = activitySfxddw;
    }

    public String[] getLineName() {
        return lineName;
    }

    public void setLineName(String[] lineName) {
        this.lineName = lineName;
    }

    public String[] getLineVarValue() {
        return lineVarValue;
    }

    public void setLineVarValue(String[] lineVarValue) {
        this.lineVarValue = lineVarValue;
    }

    public String[] getStartActivity() {
        return startActivity;
    }

    public void setStartActivity(String[] startActivity) {
        this.startActivity = startActivity;
    }

    public String[] getEndActivity() {
        return endActivity;
    }

    public void setEndActivity(String[] endActivity) {
        this.endActivity = endActivity;
    }

    public String[] getLineId() {
        return lineId;
    }

    public void setLineId(String[] lineId) {
        this.lineId = lineId;
    }

    public List getActivityList() {
        return activityList;
    }

    public void setActivityList(List activityList) {
        this.activityList = activityList;
    }

    public List getLineList() {
        return lineList;
    }

    public void setLineList(List lineList) {
        this.lineList = lineList;
    }

    public List getRoleList() {
        return roleList;
    }

    public void setRoleList(List roleList) {
        this.roleList = roleList;
    }

    public WWorkflowDAO getwWorkflowDAO() {
        return wWorkflowDAO;
    }

    public void setwWorkflowDAO(WWorkflowDAO wWorkflowDAO) {
        this.wWorkflowDAO = wWorkflowDAO;
    }

    public WActivityDAO getwActivityDAO() {
        return wActivityDAO;
    }

    public void setwActivityDAO(WActivityDAO wActivityDAO) {
        this.wActivityDAO = wActivityDAO;
    }

    public WLineDAO getwLineDAO() {
        return wLineDAO;
    }

    public void setwLineDAO(WLineDAO wLineDAO) {
        this.wLineDAO = wLineDAO;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getXml() {
        return xml;
    }

    public void setXml(String xml) {
        this.xml = xml;
    }

    public WDefinitionDAO getwDefinitionDAO() {
        return wDefinitionDAO;
    }

    public void setwDefinitionDAO(WDefinitionDAO wDefinitionDAO) {
        this.wDefinitionDAO = wDefinitionDAO;
    }
}
