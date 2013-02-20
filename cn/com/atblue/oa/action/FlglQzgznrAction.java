package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.bean.FlglQzgznr;
import cn.com.atblue.oa.dao.FlglQzgznrDAO;
import cn.com.atblue.oa.dao.ODao;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FlglQzgznrAction extends BaseAction {
private Dao dao;
private ODao oDao;
private FlglQzgznrDAO flglQzgznrDAO;

private FlglQzgznr bean;
private String action;
private String bm;
private String mc;
private List dataList;

public String list() {
Map map = new HashMap();
if (!StringUtil.isBlankOrEmpty(mc))
map.put("mc", mc);
int cn = flglQzgznrDAO.getPagedCount(map);
this.getPagination().setRowCount(cn);
map.put("currentPage", this.getPagination().getPage());
map.put("pageSize", this.getPagination().getPageSize());
this.dataList = flglQzgznrDAO.getPagedList(map);
return "list";
}

public String add() {
return "add";
}

public String mod() {
if (!StringUtil.isBlankOrEmpty(bm)) {
Map map = new HashMap();
map.put("nrbm", bm);
this.bean = flglQzgznrDAO.queryForBean(map);
}
return "mod";
}

public String save() {
Map session = ActionContext.getContext().getSession();
CUser cUser = (CUser) session.get("cUser");
if (bean != null) {
if ("add".equals(action)) {
bean.setNrbm(StringUtil.getUUID());
flglQzgznrDAO.addFlglQzgznr(bean);
} else if ("save".equals(action)) {
flglQzgznrDAO.modFlglQzgznr(bean);
}
}
return "save";
}

public String del() {
if (!StringUtil.isBlankOrEmpty(bm)) {
Map map = new HashMap();
map.put("nrbm", bm);
flglQzgznrDAO.delFlglQzgznr(map);
}
return "del";
}

public ODao getoDao() {
return oDao;
}

public void setoDao(ODao oDao) {
this.oDao = oDao;
}

public FlglQzgznrDAO getFlglQzgznrDAO() {
return flglQzgznrDAO;
}

public void setFlglQzgznrDAO(FlglQzgznrDAO flglQzgznrDAO) {
this.flglQzgznrDAO = flglQzgznrDAO;
}

public FlglQzgznr getBean() {
return bean;
}

public void setBean(FlglQzgznr bean) {
this.bean = bean;
}

public String getAction() {
return action;
}

public void setAction(String action) {
this.action = action;
}

public String getBm() {
return bm;
}

public void setBm(String bm) {
this.bm = bm;
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
}
