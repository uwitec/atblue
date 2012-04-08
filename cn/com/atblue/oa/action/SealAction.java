package cn.com.atblue.oa.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.bean.OfficeSeal;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeSealDAO;
import com.opensymphony.xwork2.ActionContext;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SealAction extends BaseAction {
    private static final int BUFFER_SIZE = 16 * 1024;
    private ODao oDao;
    private Dao dao;
    private OfficeSealDAO officeSealDAO;

    private String sealId;
    private String userName;
    private String realName;
    private String orgnaId;
    private String action;
    private OfficeSeal bean;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;

    private List dataList;
    private List orgTreeList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(realName))
            map.put("realName", realName);
        if (!StringUtil.isBlankOrEmpty(userName))
            map.put("userName", userName);
        if (!StringUtil.isBlankOrEmpty(orgnaId))
            map.put("orgnaId", orgnaId);
        int cn = oDao.getPagedSealCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedSealList(map);
        this.orgTreeList = dao.getSelectOrgTrees();
        return "list";
    }

    public String add() {
        this.dataList = oDao.getAllUserList();
        return "add";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(sealId)) {
            Map map = new HashMap();
            map.put("sealId", sealId);
            this.bean = officeSealDAO.queryForBean(map);
        }
        this.dataList = oDao.getAllUserList();
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setSealId(StringUtil.getUUID());
                bean.setCreatePerson(cUser.getUserId());
                bean.setCreateTime(new Date());
                if (upload != null && upload.length() > 0) {
                    try {
                        InputStream is = new FileInputStream(upload);
                        byte[] bArray = new byte[is.available()];
                        is.read(bArray);
                        bean.setSeal(bArray);
                        is.close();
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                officeSealDAO.addOfficeSeal(bean);
            } else if ("save".equals(action)) {
                Map map = new HashMap();
                map.put("sealId", bean.getSealId());
                OfficeSeal officeSeal = officeSealDAO.queryForBean(map);
                officeSeal.setUserId(bean.getUserId());
                if (upload != null && upload.length() > 0) {
                    try {
                        InputStream is = new FileInputStream(upload);
                        byte[] bArray = new byte[is.available()];
                        is.read(bArray);
                        officeSeal.setSeal(bArray);
                        is.close();
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                officeSealDAO.modOfficeSeal(officeSeal);
            }
        }
        return "save";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(sealId)) {
            Map map = new HashMap();
            map.put("sealId", sealId);
            officeSealDAO.delOfficeSeal(map);
        }
        return "del";
    }

    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getOrgnaId() {
        return orgnaId;
    }

    public void setOrgnaId(String orgnaId) {
        this.orgnaId = orgnaId;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getSealId() {
        return sealId;
    }

    public void setSealId(String sealId) {
        this.sealId = sealId;
    }

    public OfficeSeal getBean() {
        return bean;
    }

    public void setBean(OfficeSeal bean) {
        this.bean = bean;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public OfficeSealDAO getOfficeSealDAO() {
        return officeSealDAO;
    }

    public void setOfficeSealDAO(OfficeSealDAO officeSealDAO) {
        this.officeSealDAO = officeSealDAO;
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
