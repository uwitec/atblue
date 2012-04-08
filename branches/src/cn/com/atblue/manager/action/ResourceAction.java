package cn.com.atblue.manager.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CResource;
import cn.com.atblue.manager.bean.CRole;
import cn.com.atblue.manager.dao.CResourceDAO;
import cn.com.atblue.oa.action.BaseAction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResourceAction extends BaseAction {
    private CResourceDAO resourceDAO;

    private String resId;
    private String parentId;
    private String action;
    private CResource resource;
    private List dataList;

    public String list(){
        return "list";
    }

    public String add() {
        if(!StringUtil.isBlankOrEmpty(parentId)){
            Map map = new HashMap();
            map.put("resId",parentId);
            this.resource = resourceDAO.queryForBean(map);
        }
        return "add";
    }

    public String mod() {
        if(!StringUtil.isBlankOrEmpty(resId)){
            Map map = new HashMap();
            map.put("resId",resId);
            this.resource = resourceDAO.queryForBean(map);
        }
        return "mod";
    }

    public String del(){
        if(!StringUtil.isBlankOrEmpty(resId)){
            Map map = new HashMap();
            map.put("resId",resId);
            resourceDAO.delCResource(map);
        }
        return "del";
    }
    public String save(){
        if(resource != null){
            if("save".equals(action)){
                if(!StringUtil.isBlankOrEmpty(resId)){
                    resource.setResId(resId);
                    resourceDAO.modCResource(resource);
                }
            }else if("add".equals(action)){
                if(!StringUtil.isBlankOrEmpty(parentId)){
                    resource.setResId(StringUtil.getUUID());
                    resource.setParentId(parentId);
                    resourceDAO.addCResource(resource);
                }
            }
        }
        return "save";
    }

    public CResourceDAO getResourceDAO() {
        return resourceDAO;
    }

    public void setResourceDAO(CResourceDAO resourceDAO) {
        this.resourceDAO = resourceDAO;
    }

    public String getResId() {
        return resId;
    }

    public void setResId(String resId) {
        this.resId = resId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public CResource getResource() {
        return resource;
    }

    public void setResource(CResource resource) {
        this.resource = resource;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}
