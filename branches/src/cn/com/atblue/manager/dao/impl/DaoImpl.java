package cn.com.atblue.manager.dao.impl;

import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoImpl extends SqlMapClientDaoSupport implements Dao{

    @Override
    public List getAllUser() {
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getAllUser");
    }

    public List getGsldAllUser(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getGsldAllUser");
    }

    public List getJgksAllUser(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getJgksAllUser");
    }

    public List getJcdwAllUser(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getJcdwAllUser");
    }

    @Override
    public CUser findUserByName(String userName) {
        return (CUser)this.getSqlMapClientTemplate().queryForObject("manager.dao.findUserByName",userName);
    }

    @Override
    public CUser findUserByRealName(String userName) {
        return (CUser)this.getSqlMapClientTemplate().queryForObject("manager.dao.findUserByRealName",userName);
    }

    @Override
    public CUser findUserById(String userId) {
        return (CUser)this.getSqlMapClientTemplate().queryForObject("manager.dao.findUserById",userId);
    }

    @Override
    public List findUsersByRole(String roleid) {
        return this.getSqlMapClientTemplate().queryForList("manager.dao.findUsersByRole", roleid);
    }

    @Override
    public List getUsersByDepId(String depId) {
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getUsersByDepId",depId);
    }

    @Override
    public List getMenuByParentId(String userid, String parentid) {
        Map map = new HashMap();
        map.put("userid",userid);
        map.put("parentid",parentid);
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getMenuByParentId",map);
    }

    @Override
    public List getMenu(String userid, String type, String root) {
        Map map = new HashMap();
        map.put("userid",userid);
        map.put("parentid",root);
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getMenu",map);
    }

    public List getAllMenus(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getAllMenus");
    }
    public List getAllUserManagerMenus(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getAllUserManagerMenus");
    }

    public List getOrgsByParentId(String parentid){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getOrgsByParentId",parentid);
    }

    public List getPagedUserList(Map param){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getPagedUserList",param);
    }

    public int getPagedUserCount(Map param){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.dao.getPagedUserCount",param);
    }

    public List getAllRolesByUser(String userId){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getAllRolesByUser",userId);
    }

    public void deleteUserRole(String userId){
        this.getSqlMapClientTemplate().delete("manager.dao.deleteUserRole",userId);
    }

    public List getSelectOrgTrees(){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getSelectOrgTrees","1");
    }

    public List getSelectOrgTreesByParentId(String parentId){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getSelectOrgTrees",parentId);
    }

    public List getResourcesByRole(String roleId){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getResourcesByRole",roleId);
    }

    public void deleteRoleRes(String roleId){
        this.getSqlMapClientTemplate().delete("manager.dao.deleteRoleRes",roleId);
    }

    public List getResList(String userId, String parentId){
        Map map = new HashMap();
        map.put("userId",userId);
        map.put("parentId",parentId);
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getResList",map);
    }
    public boolean isRole(String userid, String roleid) {
        Map map = new HashMap();
        map.put("userid", userid);
        map.put("roleid", roleid);
        int cn = (Integer)this.getSqlMapClientTemplate().queryForObject("manager.dao.getRoleCount",map);
        if(cn>0){
            return true;
        }
        return false;
    }
    public  List getUsersByOrgId(String orgId){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getUsersByOrgId",orgId);
    }

    public  List getUsersByRoleId(String roleId){
        return this.getSqlMapClientTemplate().queryForList("manager.dao.getUsersByRoleId",roleId);
    }

    public void updateUserPassword(String userId,String password){
        Map map = new HashMap();
        map.put("userid", userId);
        map.put("password", password);
        this.getSqlMapClientTemplate().update("manager.dao.updateUserPassword",map);
    }
}
