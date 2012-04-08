package cn.com.atblue.manager.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.COrgnization;
import cn.com.atblue.manager.dao.COrgnizationDAO;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.action.BaseAction;
import com.opensymphony.xwork2.inject.Inject;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrgnizationAcion extends BaseAction {
    private COrgnizationDAO orgnizationDAO;
    private Dao dao;

    private String id = "0";
    private String action = "org";
    private String parentId;
    private String nodeType;
    private String direction;
    private String orgId;

    private COrgnization orgnization;
    private COrgnization parentOrgnization;

    public String index(){
        return "index";
    }
    public String add(){
        if(!StringUtil.isBlankOrEmpty(parentId)){
            Map map = new HashMap();
            map.put("orgnaId",parentId);
            this.parentOrgnization = orgnizationDAO.queryForBean(map);
        }
        return "add";
    }
    public String mod(){
        if(!StringUtil.isBlankOrEmpty(orgId)){
            Map map = new HashMap();
            map.put("orgnaId",orgId);
            this.orgnization = orgnizationDAO.queryForBean(map);
            map.put("orgnaId",orgnization.getParentId());
            this.parentOrgnization = orgnizationDAO.queryForBean(map);
        }
        return "mod";
    }
    public String del(){
        if(!StringUtil.isBlankOrEmpty(orgId)){
            Map map = new HashMap();
            map.put("orgnaId",orgId);
            orgnizationDAO.delCOrgnization(map);
        }
        return "index";
    }
    public String save(){
        if(orgnization != null){
            if("save".equals(action)){
                if(!StringUtil.isBlankOrEmpty(orgId)){
                    orgnizationDAO.modCOrgnization(orgnization);
                }
            }else if("add".equals(action)){
                if(!StringUtil.isBlankOrEmpty(parentId)){
                    orgnization.setOrgnaId(StringUtil.getUUID());
                    orgnization.setParentId(parentId);
                    orgnizationDAO.addCOrgnization(orgnization);
                }
            }
        }
        return "index";
    }
    public String treeLoader() {
        List list = null;
        list = dao.getOrgsByParentId(id);
        list = list == null ? new ArrayList() : list;
        StringBuffer buf = new StringBuffer("");
        buf.append("[");
        for (int i = 0; i < list.size(); i++) {
            if (i != 0) {
                buf.append(",");
            }
            Map orgMap = (Map) list.get(i);
            String childCn = StringUtil.parseNull(orgMap.get("CN"), "0");
            buf.append("{");
            buf.append("\"id\":").append("\"" + StringUtil.parseNull(orgMap.get("ORGNA_ID"), "") + "\"")
                    .append(",");
            buf.append("\"text\":")
                    .append("\"" + StringUtil.parseNull(orgMap.get("ORGNA_NAME"), "") + "\"").append(",");
            if (Integer.valueOf(childCn).intValue() > 0) {
                buf.append("\"leaf\":").append("false").append(",");
                buf.append("\"cls\":").append("\"task-folder\"");
            } else {
                buf.append("\"leaf\":").append("true").append(",");
                buf.append("\"cls\":").append("\"task\"");
            }
            buf.append("}");
        }
        buf.append("]");
        System.out.println(buf.toString());
        this.setJson(buf.toString());
        return "treeLoader";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getNodeType() {
        return nodeType;
    }

    public void setNodeType(String nodeType) {
        this.nodeType = nodeType;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public COrgnizationDAO getOrgnizationDAO() {
        return orgnizationDAO;
    }

    public void setOrgnizationDAO(COrgnizationDAO orgnizationDAO) {
        this.orgnizationDAO = orgnizationDAO;
    }

    public COrgnization getOrgnization() {
        return orgnization;
    }

    public void setOrgnization(COrgnization orgnization) {
        this.orgnization = orgnization;
    }

    public COrgnization getParentOrgnization() {
        return parentOrgnization;
    }

    public void setParentOrgnization(COrgnization parentOrgnization) {
        this.parentOrgnization = parentOrgnization;
    }
}
