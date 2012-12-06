package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.oa.bean.FyglFwdw;
import cn.com.atblue.oa.bean.OfficeMail;
import cn.com.atblue.oa.bean.OfficeMailSjr;
import cn.com.atblue.oa.dao.FyglFwdwDAO;
import cn.com.atblue.oa.dao.ODao;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FwdwAction extends BaseAction {
    private ODao oDao;
    private FyglFwdwDAO fyglFwdwDAO;

    private FyglFwdw bean;
    private String action;
    private String bm;
    private String mc;
    private List dataList;

    public String list(){
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(mc))
            map.put("mc", mc);
        int cn = oDao.getPagedFwdwCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedFwdwList(map);
        return "list";
    }

    public String add() {
        return "add";
    }
    public String mod() {
        if (!StringUtil.isBlankOrEmpty(bm)) {
            Map map = new HashMap();
            map.put("bm", bm);
            this.bean = fyglFwdwDAO.queryForBean(map);
        }
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setBm(StringUtil.getUUID());
                fyglFwdwDAO.addFyglFwdw(bean);
            } else if ("save".equals(action)) {
                fyglFwdwDAO.modFyglFwdw(bean);
            }
        }
        return "save";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(bm)) {
            Map map = new HashMap();
            map.put("bm", bm);
            fyglFwdwDAO.delFyglFwdw(map);
        }
        return "del";
    }

    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public String getBm() {
        return bm;
    }

    public void setBm(String bm) {
        this.bm = bm;
    }

    public FyglFwdwDAO getFyglFwdwDAO() {
        return fyglFwdwDAO;
    }

    public void setFyglFwdwDAO(FyglFwdwDAO fyglFwdwDAO) {
        this.fyglFwdwDAO = fyglFwdwDAO;
    }

    public FyglFwdw getBean() {
        return bean;
    }

    public void setBean(FyglFwdw bean) {
        this.bean = bean;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
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
}
