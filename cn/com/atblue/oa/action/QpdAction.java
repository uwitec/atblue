package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.oa.bean.OfficeQpdForm;
import cn.com.atblue.oa.bean.OfficeQpdFormitem;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeQpdFormDAO;
import cn.com.atblue.oa.dao.OfficeQpdFormitemDAO;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QpdAction extends BaseAction {
    private ODao oDao;
    private OfficeQpdFormDAO officeQpdFormDAO;
    private OfficeQpdFormitemDAO officeQpdFormitemDAO;
    
    private String formId;
    private String formName;
    private String action;
    private String[] formItemIds;
    private String[] formItemNames;
    private String[] formItemTitles;
    private String[] pxs;

    private OfficeQpdForm bean;
    private List dataList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(formName))
            map.put("formName", formName);
        int cn = oDao.getPagedQpdCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedQpdList(map);
        return "list";
    }

    public String add() {
        this.dataList = oDao.getAllUserList();
        return "add";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(formId)) {
            Map map = new HashMap();
            map.put("formId", formId);
            this.bean = officeQpdFormDAO.queryForBean(map);
            this.dataList = oDao.getAllQpdFormItemsByFormId(formId);
        }
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setFormId(StringUtil.getUUID());
                bean.setLrr(cUser.getUserId());
                bean.setLrsj(new Date());
                officeQpdFormDAO.addOfficeQpdForm(bean);
                if(formItemNames != null && formItemNames.length > 0){
                    for(int i=0; i<formItemNames.length; i++){
                        String  formItemName = formItemNames[i];
                        if(!StringUtil.isBlankOrEmpty(formItemName)){
                            OfficeQpdFormitem officeQpdFormitem = new  OfficeQpdFormitem();
                            officeQpdFormitem.setFormId(bean.getFormId());
                            officeQpdFormitem.setFormItemId(StringUtil.getUUID());
                            officeQpdFormitem.setFormItemName(formItemName);
                            officeQpdFormitem.setFormItemTitle(formItemTitles[i]);
                            if(!StringUtil.isBlankOrEmpty(pxs[i])){
                                officeQpdFormitem.setPx(Double.valueOf(pxs[i]));
                            }
                            officeQpdFormitemDAO.addOfficeQpdFormitem(officeQpdFormitem);
                        }
                    }
                }
            } else if ("save".equals(action)) {
                Map map = new HashMap();
                map.put("formId", bean.getFormId());
                OfficeQpdForm officeQpdForm = officeQpdFormDAO.queryForBean(map);
                officeQpdForm.setFormName(bean.getFormName());
                officeQpdForm.setFormTitle(bean.getFormTitle());
                officeQpdForm.setLrsj(new Date());
                officeQpdForm.setLrr(cUser.getUserId());
                officeQpdFormDAO.modOfficeQpdForm(officeQpdForm);
                if(formItemIds != null && formItemIds.length > 0){
                    oDao.deleteAllQpdFormItemsByFormId(bean.getFormId());
                    for(int i=0; i<formItemNames.length; i++){
                        String  formItemName = formItemNames[i];
                        if(!StringUtil.isBlankOrEmpty(formItemName)){
                            OfficeQpdFormitem officeQpdFormitem = new  OfficeQpdFormitem();
                            officeQpdFormitem.setFormId(bean.getFormId());
                            officeQpdFormitem.setFormItemId(StringUtil.getUUID());
                            officeQpdFormitem.setFormItemName(formItemName);
                            officeQpdFormitem.setFormItemTitle(formItemTitles[i]);
                            if(!StringUtil.isBlankOrEmpty(pxs[i])){
                                officeQpdFormitem.setPx(Double.valueOf(pxs[i]));
                            }
                            officeQpdFormitemDAO.addOfficeQpdFormitem(officeQpdFormitem);
                        }
                    }
                }
            }
        }
        return "save";
    }
    public String del() {
        if (!StringUtil.isBlankOrEmpty(formId)) {
            Map map = new HashMap();
            map.put("formId", formId);
            officeQpdFormDAO.delOfficeQpdForm(map);
        }
        return "del";
    }
    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public OfficeQpdForm getBean() {
        return bean;
    }

    public void setBean(OfficeQpdForm bean) {
        this.bean = bean;
    }

    public OfficeQpdFormDAO getOfficeQpdFormDAO() {
        return officeQpdFormDAO;
    }

    public void setOfficeQpdFormDAO(OfficeQpdFormDAO officeQpdFormDAO) {
        this.officeQpdFormDAO = officeQpdFormDAO;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public OfficeQpdFormitemDAO getOfficeQpdFormitemDAO() {
        return officeQpdFormitemDAO;
    }

    public void setOfficeQpdFormitemDAO(OfficeQpdFormitemDAO officeQpdFormitemDAO) {
        this.officeQpdFormitemDAO = officeQpdFormitemDAO;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String[] getFormItemIds() {
        return formItemIds;
    }

    public void setFormItemIds(String[] formItemIds) {
        this.formItemIds = formItemIds;
    }

    public String[] getFormItemNames() {
        return formItemNames;
    }

    public void setFormItemNames(String[] formItemNames) {
        this.formItemNames = formItemNames;
    }

    public String[] getFormItemTitles() {
        return formItemTitles;
    }

    public void setFormItemTitles(String[] formItemTitles) {
        this.formItemTitles = formItemTitles;
    }

    public String[] getPxs() {
        return pxs;
    }

    public void setPxs(String[] pxs) {
        this.pxs = pxs;
    }
}
