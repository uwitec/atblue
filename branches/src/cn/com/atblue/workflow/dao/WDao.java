package cn.com.atblue.workflow.dao;

import cn.com.atblue.workflow.bean.WActivity;
import cn.com.atblue.workflow.bean.WConnect;
import cn.com.atblue.workflow.bean.WLine;
import cn.com.atblue.workflow.bean.WProcess;

import java.util.List;
import java.util.Map;

public interface WDao {
    public List<WActivity> getAllActivities(String flowId);

    public String getNextActivityId(String activityId);

    public Map getNextInstanceId(String activityId);

    public WActivity getActivityByInstanceId(String instanceId);

    public WConnect getConnectByStartAndUserId(String startInstanceId, String userId);

    public Map getEndInstanceIDByStartAndVar(String startActivityId, String varValue);
    
    public int getPagedWorkflowCount(Map paramMap);
    
    public List getPagedWorkflowList(Map paramMap);
    
    public void deleteActivitiesByFlowId(String flowId);

    public void deleteLinesByFlowId(String flowId);
    
    public List getActivitiesByFlowId(String flowId);

    public List getLinesByFlowId(String flowId);
    
    public WActivity getStartActivity(String flowId);
    
    public WLine getStartLine(String startActivityId);
    
    public WLine getLine(String startActivityId,String varValue);
    
    public List getAllRoles();
    
    public String getActivityIdByName(String name);
    
    public String getWorkflowIdByName(String name);
    
    public String getDefXmlByName(String name);
}
