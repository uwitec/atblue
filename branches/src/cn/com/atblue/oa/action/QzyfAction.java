package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.bean.FyglQzyf;
import cn.com.atblue.oa.dao.FyglQzyfDAO;
import cn.com.atblue.oa.dao.ODao;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QzyfAction extends BaseAction {
    private Dao dao;
    private ODao oDao;
    private FyglQzyfDAO fyglQzyfDAO;

    private FyglQzyf bean;
    private String action;
    private String qzbm;
    private String mc;
    private List dataList;
    private List orgTreeList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(mc))
            map.put("mc", mc);
        int cn = oDao.getPagedQzfyCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedQzfyList(map);
        return "list";
    }

    public String add() {
        this.orgTreeList = dao.getSelectOrgTreesByParentId("d4dfcf91-6c09-470b-b3d1-8a47e1bdb562");
        return "add";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(qzbm)) {
            Map map = new HashMap();
            map.put("qzbm", qzbm);
            this.bean = fyglQzyfDAO.queryForBean(map);
        }
        this.orgTreeList = dao.getSelectOrgTreesByParentId("d4dfcf91-6c09-470b-b3d1-8a47e1bdb562");
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setQzbm(StringUtil.getUUID());
                bean.setLrr(cUser.getUserId());
                bean.setLrsj(new Date());
                fyglQzyfDAO.addFyglQzyf(bean);
            } else if ("save".equals(action)) {
                bean.setLrr(cUser.getUserId());
                bean.setLrsj(new Date());
                fyglQzyfDAO.modFyglQzyf(bean);
            }
        }
        return "save";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(qzbm)) {
            Map map = new HashMap();
            map.put("qzbm", qzbm);
            fyglQzyfDAO.delFyglQzyf(map);
        }
        return "del";
    }

    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public FyglQzyfDAO getFyglQzyfDAO() {
        return fyglQzyfDAO;
    }

    public void setFyglQzyfDAO(FyglQzyfDAO fyglQzyfDAO) {
        this.fyglQzyfDAO = fyglQzyfDAO;
    }

    public FyglQzyf getBean() {
        return bean;
    }

    public void setBean(FyglQzyf bean) {
        this.bean = bean;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getQzbm() {
        return qzbm;
    }

    public void setQzbm(String qzbm) {
        this.qzbm = qzbm;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public List getOrgTreeList() {
        return orgTreeList;
    }

    public void setOrgTreeList(List orgTreeList) {
        this.orgTreeList = orgTreeList;
    }
}
