package cn.com.atblue.manager.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.bean.CUserrole;
import cn.com.atblue.manager.dao.CUserDAO;
import cn.com.atblue.manager.dao.CUserroleDAO;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.action.BaseAction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonAction extends BaseAction {
    private CUserDAO userDAO;
    private CUserroleDAO userroleDAO;
    private Dao dao;

    private String userName;
    private String orgId;
    private String userId;
    private String action;
    private String[] roleIds;
    private CUser user;
    private CUserrole userrole;
    private List dataList;
    private List orgTreeList;

    public String list(){
        Map map = new HashMap();
        if(!StringUtil.isBlankOrEmpty(orgId))
            map.put("orgId",orgId);
        if(!StringUtil.isBlankOrEmpty(userName))
            map.put("userName",userName);
        int cn = dao.getPagedUserCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = dao.getPagedUserList(map);
        this.orgTreeList = dao.getSelectOrgTrees();
        return "list";
    }

    public String add() {
        this.orgTreeList = dao.getSelectOrgTrees();
        return "add";
    }

    public String mod(){
        if (!StringUtil.isBlankOrEmpty(userId)) {
            Map map = new HashMap();
            map.put("userId", userId);
            this.user = userDAO.queryForBean(map);
        }
        this.orgTreeList = dao.getSelectOrgTrees();
        return "mod";
    }

    public String role(){
        if (!StringUtil.isBlankOrEmpty(userId)) {
            this.dataList = dao.getAllRolesByUser(userId);
        }
        return "role";
    }
    public String saveRole(){
        Map map = new HashMap();
        if("save".equals(action) && !StringUtil.isBlankOrEmpty(userId)){
            map.put("userId",userId);
            dao.deleteUserRole(userId);
            if(roleIds != null && roleIds.length > 0){
                for(int i=0; i<roleIds.length; i++){
                    String roleId = roleIds[i];
                    if(!StringUtil.isBlankOrEmpty(roleId)){
                        map.put("roleId",roleId);
                        CUserrole ur = new CUserrole();
                        ur.setId(StringUtil.getUUID());
                        ur.setUserId(userId);
                        ur.setRoleId(roleId);
                        userroleDAO.addCUserrole(ur);
                    }
                }
            }
        }
        return "saveRole";
    }

    public String save() {
        if (user != null) {
            if ("save".equals(action)) {
                if (!StringUtil.isBlankOrEmpty(userId)) {
                    Map map = new HashMap();
                    map.put("userId", userId);
                    CUser u = userDAO.queryForBean(map);
                    if(u != null && !u.getPassword().equals(user.getPassword()))
                        user.setPassword(StringUtil.MD5Encode(user.getPassword()));
                    userDAO.modCUser(user);
                }
            } else if ("add".equals(action)) {
                user.setUserId(StringUtil.getUUID());
                user.setPassword(StringUtil.MD5Encode(user.getPassword()));
                userDAO.addCUser(user);
            }
        }
        return "save";
    }

    public CUserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(CUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public CUser getUser() {
        return user;
    }

    public void setUser(CUser user) {
        this.user = user;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public String[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String[] roleIds) {
        this.roleIds = roleIds;
    }

    public CUserroleDAO getUserroleDAO() {
        return userroleDAO;
    }

    public void setUserroleDAO(CUserroleDAO userroleDAO) {
        this.userroleDAO = userroleDAO;
    }

    public CUserrole getUserrole() {
        return userrole;
    }

    public void setUserrole(CUserrole userrole) {
        this.userrole = userrole;
    }

    public List getOrgTreeList() {
        return orgTreeList;
    }

    public void setOrgTreeList(List orgTreeList) {
        this.orgTreeList = orgTreeList;
    }
}
