package cn.com.atblue.oa.action;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.common.SysConfig;
import cn.com.atblue.common.sms.SMSHandler;
import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.CUserDAO;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.bean.OfficeSmsNotice;
import cn.com.atblue.oa.bean.OfficeSmsPerson;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeSmsNoticeDAO;
import cn.com.atblue.oa.dao.OfficeSmsPersonDAO;
import com.opensymphony.xwork2.ActionContext;
import org.smslib.OutboundMessage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SmsAction extends BaseAction {
    private Dao dao;
    private ODao oDao;
    private OfficeSmsNoticeDAO officeSmsNoticeDAO;
    private OfficeSmsPersonDAO officeSmsPersonDAO;
    private CUserDAO userDAO;

    private String tzid;
    private String dxnr;
    private String action;
    private String[] ubox;
    private String[] users;

    private OfficeSmsNotice bean;
    private List dataList;
    private List orgTreeList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(dxnr))
            map.put("dxnr", dxnr);
        int cn = oDao.getPagedSmsCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedSmsList(map);
        return "list";
    }

    public String add() {
        this.orgTreeList = dao.getSelectOrgTrees();
        return "add";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(tzid)) {
            Map map = new HashMap();
            map.put("tzid", tzid);
            this.bean = officeSmsNoticeDAO.queryForBean(map);
            this.users = oDao.getPersonsByTzid(tzid);
            this.orgTreeList = dao.getSelectOrgTrees();
        }
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setTzid(oDao.getSmsSequence());
                bean.setCjsj(new Date());
                bean.setFsr(cUser.getUserId());
                bean.setZt("已保存");
                officeSmsNoticeDAO.addOfficeSmsNotice(bean);
                if (ubox != null && ubox.length > 0) {
                    for (int i = 0; i < ubox.length; i++) {
                        String uid = ubox[i];
                        if (!StringUtil.isBlankOrEmpty(uid)) {
                            Map map = new HashMap();
                            map.put("userId", uid);
                            CUser u = userDAO.queryForBean(map);
                            OfficeSmsPerson officeSmsPerson = new OfficeSmsPerson();
                            officeSmsPerson.setPkId(StringUtil.getUUID());
                            officeSmsPerson.setTzid(bean.getTzid());
                            officeSmsPerson.setCreateTime(new Date());
                            String testPhone = sysConfig.getProperty("testPhone");
                            if(!StringUtil.isBlankOrEmpty(testPhone)){
                                officeSmsPerson.setPhone(testPhone);
                            }else{
                                officeSmsPerson.setPhone(u.getMobile());
                            }
                            officeSmsPerson.setUserId(uid);
                            officeSmsPerson.setUserName(u.getRealName());
                            officeSmsPerson.setSfqs("0");
                            officeSmsPerson.setSffs("0");
                            officeSmsPerson.setDxnr("尊敬的" + u.getRealName() + "您好，OA系统："+bean.getDxnr()+"，请返回数字"+bean.getTzid()+"进行签收！");
                            officeSmsPerson.setTzlb("G");
                            officeSmsPerson.setSqId(bean.getTzid().toString());
                            officeSmsPerson.setTzid(bean.getTzid());
                            officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
                        }
                    }
                }
            } else if ("save".equals(action)) {
                Map map = new HashMap();
                map.put("tzid", bean.getTzid());
                OfficeSmsNotice officeSmsNotice = officeSmsNoticeDAO.queryForBean(map);
                officeSmsNotice.setCjsj(new Date());
                officeSmsNotice.setFsr(cUser.getUserId());
                officeSmsNotice.setZt("已保存");
                officeSmsNotice.setDxnr(bean.getDxnr());
                officeSmsNotice.setFsbm(bean.getFsbm());
                officeSmsNoticeDAO.modOfficeSmsNotice(officeSmsNotice);
                if (ubox != null && ubox.length > 0) {
                    oDao.deleteSmsPersonsById(bean.getTzid());
                    for (int i = 0; i < ubox.length; i++) {
                        String uid = ubox[i];
                        if (!StringUtil.isBlankOrEmpty(uid)) {
                            map.put("userId", uid);
                            CUser u = userDAO.queryForBean(map);
                            //默认不发送短信
                            OfficeSmsPerson officeSmsPerson = new OfficeSmsPerson();
                            officeSmsPerson.setPkId(StringUtil.getUUID());
                            officeSmsPerson.setTzid(bean.getTzid());
                            officeSmsPerson.setCreateTime(new Date());
                            String testPhone = sysConfig.getProperty("testPhone");
                            if(!StringUtil.isBlankOrEmpty(testPhone)){
                                officeSmsPerson.setPhone(testPhone);
                            }else{
                                officeSmsPerson.setPhone(u.getMobile());
                            }
                            officeSmsPerson.setUserId(uid);
                            officeSmsPerson.setUserName(u.getRealName());
                            officeSmsPerson.setSfqs("0");
                            officeSmsPerson.setSffs("0"); //是否发送
                            String smsNotice = StringUtil.parseNull(sysConfig.getProperty("smsNotice"),"");
                            smsNotice = StringUtil.replace(smsNotice,"$0",u.getRealName());
                            smsNotice = StringUtil.replace(smsNotice,"$2",bean.getDxnr());
                            smsNotice = StringUtil.replace(smsNotice,"$3",bean.getTzid().toString());
                            officeSmsPerson.setDxnr(smsNotice);
//                            officeSmsPerson.setDxnr("尊敬的" + u.getRealName() + "您好，OA系统："+bean.getDxnr()+"，请返回数字"+bean.getTzid()+"进行签收！");
                            officeSmsPerson.setTzlb("G");
                            officeSmsPerson.setSqId(bean.getTzid().toString());
                            officeSmsPerson.setTzid(bean.getTzid());
                            officeSmsPersonDAO.addOfficeSmsPerson(officeSmsPerson);
                        }
                    }
                }
            }
        }
        return "save";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(tzid)) {
            Map map = new HashMap();
            map.put("tzid", tzid);
            officeSmsNoticeDAO.delOfficeSmsNotice(map);
            oDao.deleteSmsPersonsById(Integer.valueOf(tzid));
        }
        return "del";
    }

    public String send() {
        if (!StringUtil.isBlankOrEmpty(tzid)) {
            Map map = new HashMap();
            map.put("tzid", tzid);
            this.bean = officeSmsNoticeDAO.queryForBean(map);
            oDao.updateSmsPersonSffs(tzid);//设置发送标志0
            this.bean.setZt("已发送");
            officeSmsNoticeDAO.modOfficeSmsNotice(this.bean);
        }
        return "send";
    }

    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public OfficeSmsNoticeDAO getOfficeSmsNoticeDAO() {
        return officeSmsNoticeDAO;
    }

    public void setOfficeSmsNoticeDAO(OfficeSmsNoticeDAO officeSmsNoticeDAO) {
        this.officeSmsNoticeDAO = officeSmsNoticeDAO;
    }

    public OfficeSmsPersonDAO getOfficeSmsPersonDAO() {
        return officeSmsPersonDAO;
    }

    public void setOfficeSmsPersonDAO(OfficeSmsPersonDAO officeSmsPersonDAO) {
        this.officeSmsPersonDAO = officeSmsPersonDAO;
    }

    public CUserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(CUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public String getTzid() {
        return tzid;
    }

    public void setTzid(String tzid) {
        this.tzid = tzid;
    }

    public String getDxnr() {
        return dxnr;
    }

    public void setDxnr(String dxnr) {
        this.dxnr = dxnr;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String[] getUbox() {
        return ubox;
    }

    public void setUbox(String[] ubox) {
        this.ubox = ubox;
    }

    public OfficeSmsNotice getBean() {
        return bean;
    }

    public void setBean(OfficeSmsNotice bean) {
        this.bean = bean;
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

    public String[] getUsers() {
        return users;
    }

    public void setUsers(String[] users) {
        this.users = users;
    }
}
