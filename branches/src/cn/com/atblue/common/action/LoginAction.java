package cn.com.atblue.common.action;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.manager.bean.COrgnization;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.COrgnizationDAO;
import cn.com.atblue.manager.dao.Dao;
import cn.com.atblue.oa.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.slb.sis.wsafcep.controller.ActionServlet;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class LoginAction extends BaseAction {
    private Dao dao;
    private COrgnizationDAO orgnizationDAO;

    private String userName;
    private String password;
    private String jzmm;

    public String login() {
        Map session = ActionContext.getContext().getSession();
        if(!StringUtil.isBlankOrEmpty(userName) && !StringUtil.isBlankOrEmpty(password)){
            CUser cUser = null;
            try{
                cUser = dao.findUserByName(userName); 
            }catch (Exception e){
                   e.printStackTrace();
            }
            if(cUser != null){
                String passwd = cUser.getPassword();
                if(StringUtil.MD5Encode(password).equals(passwd)){
                    session.put("cUser",cUser);
                    session.put("passwd",password);
                    session.put("jzmm",jzmm);
                    session.put("loginTime",new Date());
                    Map map = new HashMap();
                    map.put("orgnaId",cUser.getOrgnaId());
                    COrgnization cOrgnization = orgnizationDAO.queryForBean(map);
                    if(cOrgnization != null){
                        session.put("orgnaName",cOrgnization.getOrgnaName());
                    }
                    return "success";
                }
            }
        }
        return "failure";
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }

    public COrgnizationDAO getOrgnizationDAO() {
        return orgnizationDAO;
    }

    public void setOrgnizationDAO(COrgnizationDAO orgnizationDAO) {
        this.orgnizationDAO = orgnizationDAO;
    }

    public String getJzmm() {
        return jzmm;
    }

    public void setJzmm(String jzmm) {
        this.jzmm = jzmm;
    }
}
