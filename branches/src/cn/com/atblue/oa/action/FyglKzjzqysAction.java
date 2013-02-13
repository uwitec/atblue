package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.bean.FyglKzjzqys;
import cn.com.atblue.oa.dao.FyglKzjzqysDAO;
import cn.com.atblue.oa.dao.ODao;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FyglKzjzqysAction extends BaseAction {
private Dao dao;
private ODao oDao;
private FyglKzjzqysDAO fyglKzjzqysDAO;

private FyglKzjzqys bean;
private String action;
private String bm;
private String mc;
private List dataList;

public String list() {
Map map = new HashMap();
if (!StringUtil.isBlankOrEmpty(mc))
map.put("mc", mc);
int cn = fyglKzjzqysDAO.getPagedCount(map);
this.getPagination().setRowCount(cn);
map.put("currentPage", this.getPagination().getPage());
map.put("pageSize", this.getPagination().getPageSize());
this.dataList = fyglKzjzqysDAO.getPagedList(map);
return "list";
}

public String add() {
return "add";
}

public String mod() {
if (!StringUtil.isBlankOrEmpty(bm)) {
Map map = new HashMap();
map.put("kzjbm", bm);
this.bean = fyglKzjzqysDAO.queryForBean(map);
}
return "mod";
}

public String save() {
Map session = ActionContext.getContext().getSession();
CUser cUser = (CUser) session.get("cUser");
if (bean != null) {
if ("add".equals(action)) {
bean.setKzjbm(StringUtil.getUUID());
fyglKzjzqysDAO.addFyglKzjzqys(bean);
} else if ("save".equals(action)) {
fyglKzjzqysDAO.modFyglKzjzqys(bean);
}
}
return "save";
}

public String del() {
if (!StringUtil.isBlankOrEmpty(bm)) {
Map map = new HashMap();
map.put("kzjbm", bm);
fyglKzjzqysDAO.delFyglKzjzqys(map);
}
return "del";
}

public ODao getoDao() {
return oDao;
}

public void setoDao(ODao oDao) {
this.oDao = oDao;
}

public FyglKzjzqysDAO getFyglKzjzqysDAO() {
return fyglKzjzqysDAO;
}

public void setFyglKzjzqysDAO(FyglKzjzqysDAO fyglKzjzqysDAO) {
this.fyglKzjzqysDAO = fyglKzjzqysDAO;
}

public FyglKzjzqys getBean() {
return bean;
}

public void setBean(FyglKzjzqys bean) {
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
