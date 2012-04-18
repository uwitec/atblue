package cn.com.atblue.oa.action;

import cn.com.atblue.common.SysConfig;
import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.oa.bean.OfficeMail;
import cn.com.atblue.oa.bean.OfficeMailSjr;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeMailDAO;
import cn.com.atblue.oa.dao.OfficeMailSjrDAO;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MailAction extends BaseAction {
    private ODao oDao;
    private OfficeMailDAO officeMailDAO;
    private OfficeMailSjrDAO officeMailSjrDAO;
    private JavaMailSender mailSender;
    private SysConfig propertyConfig;

    private String mailId;
    private String mailZt;
    private String action;
    private String[] ubox;
    private String[] users;

    private OfficeMail bean;
    private List dataList;

    public String list() {
        Map map = new HashMap();
        if (!StringUtil.isBlankOrEmpty(mailZt))
            map.put("mailZt", mailZt);
        int cn = oDao.getPagedMailCount(map);
        this.getPagination().setRowCount(cn);
        map.put("currentPage", this.getPagination().getPage());
        map.put("pageSize", this.getPagination().getPageSize());
        this.dataList = oDao.getPagedMailList(map);
        return "list";
    }

    public String add() {
        return "add";
    }

    public String send() {
        if (!StringUtil.isBlankOrEmpty(mailId)) {
            Map map = new HashMap();
            map.put("mailId", mailId);
            this.bean = officeMailDAO.queryForBean(map);
            List uList = oDao.getMailSjrsByMailId(mailId);
            if (uList != null && uList.size() > 0) {
                for (int i = 0; i < uList.size(); i++) {
                    map = (Map) uList.get(i);
                    String uid = StringUtil.parseNull(map.get("USER_ID"), "");
                    String email = StringUtil.parseNull(map.get("EMAIL"), "");
                    String sffs = StringUtil.parseNull(map.get("SFFS"), "");
                    if (!"1".equals(sffs)) {
                        if (!StringUtil.isBlankOrEmpty(email)) {
                            SimpleMailMessage mail = new SimpleMailMessage();
                            mail.setTo(email);
                            mail.setFrom(propertyConfig.getProperty("sendmail"));// 发送者
                            mail.setSubject(bean.getMailZt());// 主题
                            mail.setText(bean.getMailNr());// 邮件内容
                            try {
                                mailSender.send(mail);
                                oDao.updateMailJsrSfjs(bean.getMailId(), uid);
                            } catch (Exception e) {

                            }
                        }
                    }
                    this.bean.setMailStatus("已发送");
                    officeMailDAO.modOfficeMail(this.bean);
                }
            }
        }
        return "send";
    }

    public String mod() {
        if (!StringUtil.isBlankOrEmpty(mailId)) {
            Map map = new HashMap();
            map.put("mailId", mailId);
            this.bean = officeMailDAO.queryForBean(map);
            this.users = oDao.getMailSjrByMailId(mailId);
        }
        return "mod";
    }

    public String save() {
        Map session = ActionContext.getContext().getSession();
        CUser cUser = (CUser) session.get("cUser");
        if (bean != null) {
            if ("add".equals(action)) {
                bean.setMailId(StringUtil.getUUID());
                bean.setMailStatus("已保存");
                bean.setSendPerson(cUser.getUserId());
                bean.setSendTime(new Date());
                officeMailDAO.addOfficeMail(bean);
                if (ubox != null && ubox.length > 0) {
                    for (int i = 0; i < ubox.length; i++) {
                        String uid = ubox[i];
                        if (!StringUtil.isBlankOrEmpty(uid)) {
                            OfficeMailSjr officeMailSjr = new OfficeMailSjr();
                            officeMailSjr.setPkId(StringUtil.getUUID());
                            officeMailSjr.setUserId(uid);
                            officeMailSjr.setMailId(bean.getMailId());
                            officeMailSjr.setSffs("0");
                            officeMailSjrDAO.addOfficeMailSjr(officeMailSjr);
                        }
                    }
                }
            } else if ("save".equals(action)) {
                Map map = new HashMap();
                map.put("mailId", bean.getMailId());
                OfficeMail officeMail = officeMailDAO.queryForBean(map);
                officeMail.setMailZt(bean.getMailZt());
                officeMail.setMailNr(bean.getMailNr());
                officeMail.setMailStatus("已保存");
                officeMail.setSendPerson(cUser.getUserId());
                officeMail.setSendTime(new Date());
                officeMailDAO.modOfficeMail(officeMail);
                if (ubox != null && ubox.length > 0) {
                    oDao.deleteAllMailJsrByMailId(bean.getMailId());
                    for (int i = 0; i < ubox.length; i++) {
                        String uid = ubox[i];
                        if (!StringUtil.isBlankOrEmpty(uid)) {
                            OfficeMailSjr officeMailSjr = new OfficeMailSjr();
                            officeMailSjr.setPkId(StringUtil.getUUID());
                            officeMailSjr.setUserId(uid);
                            officeMailSjr.setMailId(bean.getMailId());
                            officeMailSjr.setSffs("0");
                            officeMailSjrDAO.addOfficeMailSjr(officeMailSjr);
                        }
                    }
                }
            }
        }
        return "save";
    }

    public String del() {
        if (!StringUtil.isBlankOrEmpty(mailId)) {
            Map map = new HashMap();
            map.put("mailId", mailId);
            officeMailDAO.delOfficeMail(map);
            oDao.deleteAllMailJsrByMailId(mailId);
        }
        return "del";
    }

    public ODao getoDao() {
        return oDao;
    }

    public void setoDao(ODao oDao) {
        this.oDao = oDao;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }

    public OfficeMailDAO getOfficeMailDAO() {
        return officeMailDAO;
    }

    public void setOfficeMailDAO(OfficeMailDAO officeMailDAO) {
        this.officeMailDAO = officeMailDAO;
    }

    public OfficeMail getBean() {
        return bean;
    }

    public void setBean(OfficeMail bean) {
        this.bean = bean;
    }

    public String getMailZt() {
        return mailZt;
    }

    public void setMailZt(String mailZt) {
        this.mailZt = mailZt;
    }

    public String[] getUbox() {
        return ubox;
    }

    public void setUbox(String[] ubox) {
        this.ubox = ubox;
    }

    public OfficeMailSjrDAO getOfficeMailSjrDAO() {
        return officeMailSjrDAO;
    }

    public void setOfficeMailSjrDAO(OfficeMailSjrDAO officeMailSjrDAO) {
        this.officeMailSjrDAO = officeMailSjrDAO;
    }

    public String getMailId() {
        return mailId;
    }

    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String[] getUsers() {
        return users;
    }

    public void setUsers(String[] users) {
        this.users = users;
    }

    public JavaMailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public SysConfig getPropertyConfig() {
        return propertyConfig;
    }

    public void setPropertyConfig(SysConfig propertyConfig) {
        this.propertyConfig = propertyConfig;
    }
}
