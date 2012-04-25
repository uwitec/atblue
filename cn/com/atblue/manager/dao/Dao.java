package cn.com.atblue.manager.dao;

import cn.com.atblue.manager.bean.CUser;

import java.util.List;
import java.util.Map;

public interface Dao {
    public List getAllUser();

    public List getGsldAllUser();

    public List getJgksAllUser();

    public List getJcdwAllUser();

    public CUser findUserByName(String userName);

    public CUser findUserByRealName(String userName);

    public CUser findUserById(String userId);

    public List findUsersByRole(String roleid);

    public List getUsersByDepId(String depid);

    public List getMenuByParentId(String userid, String parentid);

    public List getMenu(String userid, String type, String root);
    
    public List getAllMenus();
    
    public List getAllUserManagerMenus();
    
    public List getOrgsByParentId(String parentid);
    
    public List getPagedUserList(Map param);

    public int getPagedUserCount(Map param);
    
    public List getAllRolesByUser(String userId);
    
    public void deleteUserRole(String userId);
    
    public List getSelectOrgTrees();
    
    public List getResourcesByRole(String roleId);

    public void deleteRoleRes(String roleId);
    
    public List getResList(String userId, String parentId);

    public boolean isRole(String userId, String roleId);
}
