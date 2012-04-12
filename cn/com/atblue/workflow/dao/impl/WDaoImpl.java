package cn.com.atblue.workflow.dao.impl;

import cn.com.atblue.workflow.bean.WActivity;
import cn.com.atblue.workflow.bean.WConnect;
import cn.com.atblue.workflow.bean.WLine;
import cn.com.atblue.workflow.bean.WProcess;
import cn.com.atblue.workflow.dao.WDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WDaoImpl extends SqlMapClientDaoSupport implements WDao {
    @Override
    public List<WActivity> getAllActivities(String flowId) {
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getAllActivities", flowId);
    }

    @Override
    public String getNextActivityId(String activityId) {
        return (String) this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getNextActivityId", activityId);
    }

    @Override
    public Map getNextInstanceId(String activityId) {
        return (Map) this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getNextInstanceId", activityId);
    }

    @Override
    public WActivity getActivityByInstanceId(String instanceId) {
        return (WActivity) this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getActivityByInstanceId", instanceId);
    }

    @Override
    public WConnect getConnectByStartAndUserId(String startInstanceId, String userId) {
        Map map = new HashMap();
        map.put("startInstanceId", startInstanceId);
        map.put("userId", userId);
        return (WConnect) this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getConnectByStartAndUserId", map);
    }

    @Override
    public Map getEndInstanceIDByStartAndVar(String startActivityId, String varValue) {
        Map map = new HashMap();
        map.put("startActivityId", startActivityId);
        map.put("varValue", varValue);
        return (Map) this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getEndInstanceIDByStartAndVar", map);
    }

    @Override
    public int getPagedWorkflowCount(Map paramMap) {
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getPagedWorkflowCount",paramMap);
    }

    @Override
    public List getPagedWorkflowList(Map paramMap) {
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getPagedWorkflowList", paramMap);
    }
    public void deleteActivitiesByFlowId(String flowId){
        this.getSqlMapClientTemplate().delete("workflow.wdao.deleteActivitiesByFlowId",flowId);
    }

    public void deleteLinesByFlowId(String flowId){
        this.getSqlMapClientTemplate().delete("workflow.wdao.deleteLinesByFlowId",flowId);
    }

    public List getActivitiesByFlowId(String flowId){
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getActivitiesByFlowId", flowId);
    }

    public List getLinesByFlowId(String flowId){
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getLinesByFlowId", flowId);
    }
    public WActivity getStartActivity(String flowId){
        return (WActivity)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getStartActivity",flowId);
    }

    public WLine getStartLine(String startActivityId){
        return (WLine)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getStartLine",startActivityId);
    }

    public WLine getLine(String startActivityId,String varValue){
        Map paramMap = new HashMap();
        paramMap.put("startActivityId",startActivityId);
        paramMap.put("varValue",varValue);
        return (WLine)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getLine",paramMap);
    }

    public List getAllRoles(){
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getAllRoles");
    }

    public String getActivityIdByName(String name){
        return (String)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getActivityIdByName");
    }

    public String getWorkflowIdByName(String name){
        return (String)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getWorkflowIdByName",name);
    }

    public String getDefXmlByName(String name){
        return (String)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getDefXmlByName",name);
    }

    public String getNextUserRole(String connectId){
        return (String)this.getSqlMapClientTemplate().queryForObject("workflow.wdao.getNextUserRole",connectId);
    }

    public List getUsersByRoleName(String roleName){
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getUsersByRoleName",roleName);
    }

    public List getUsersByRoleNameAndOrgId(String roleName,String orgnaId){
        Map map = new HashMap();
        map.put("roleName",roleName);
        map.put("orgnaId",orgnaId);
        return this.getSqlMapClientTemplate().queryForList("workflow.wdao.getUsersByRoleNameAndOrgId",map);
    }
}
