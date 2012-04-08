package cn.com.atblue.manager.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CRelation;
import cn.com.atblue.manager.bean.CRole;
import cn.com.atblue.manager.dao.CRelationDAO;
import cn.com.atblue.manager.dao.CRoleDAO;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.action.BaseAction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoleAction extends BaseAction {
    private CRoleDAO roleDAO;
    private CRelationDAO relationDAO;
    private Dao dao;
    private String roleId;
    private String action;
    private String resIds;
    private CRole role;
    private List dataList;

    public String list() {
        this.dataList = roleDAO.queryForList(new HashMap());
        return "list";
    }

    public String add() {
        return "add";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(roleId)) {
            Map map = new HashMap();
            map.put("roleId", roleId);
            this.role = roleDAO.queryForBean(map);
        }
        return "mod";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(roleId)) {
            Map map = new HashMap();
            map.put("roleId", roleId);
            roleDAO.delCRole(map);
        }
        return "del";
    }

    public String save() {
        if (role != null) {
            if ("save".equals(action)) {
                if (!StringUtil.isBlankOrEmpty(roleId)) {
                    roleDAO.modCRole(role);
                }
            } else if ("add".equals(action)) {
                role.setRoleId(StringUtil.getUUID());
                roleDAO.addCRole(role);
            }
        }
        if("url".equals(action)){
            if(!StringUtil.isBlankOrEmpty(resIds) && !StringUtil.isBlankOrEmpty(roleId)){
                dao.deleteRoleRes(roleId);
                String[] ids = StringUtil.split(resIds,",");
                if(ids != null && ids.length > 0){
                    for(int i=0; i<ids.length; i++){
                        CRelation relation = new CRelation();
                        relation.setRelationId(StringUtil.getUUID());
                        relation.setRoleId(roleId);
                        relation.setResId(ids[i]);
                        relationDAO.addCRelation(relation);
                    }
                }
            }
        }
        return "save";
    }

    public String url(){
        StringBuffer buf = new StringBuffer();
        if(!StringUtil.isBlankOrEmpty(roleId)){
            List list = dao.getResourcesByRole(roleId);
            if(list != null && list.size() > 0){
                for(int i=0; i<list.size(); i++){
                    if(i > 0){
                        buf.append(",");
                    }
                    Map map = (Map)list.get(i);
                    buf.append("'"+StringUtil.parseNull(map.get("RES_ID"),"")+"'");
                }
            }
        }
        this.resIds = buf.toString();
        return "url";
    }
    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public CRole getRole() {
        return role;
    }

    public void setRole(CRole role) {
        this.role = role;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public CRoleDAO getRoleDAO() {
        return roleDAO;
    }

    public void setRoleDAO(CRoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public String getResIds() {
        return resIds;
    }

    public void setResIds(String resIds) {
        this.resIds = resIds;
    }

    public CRelationDAO getRelationDAO() {
        return relationDAO;
    }

    public void setRelationDAO(CRelationDAO relationDAO) {
        this.relationDAO = relationDAO;
    }
}
