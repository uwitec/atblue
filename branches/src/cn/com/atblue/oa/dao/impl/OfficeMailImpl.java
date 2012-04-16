package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeMail;
import cn.com.atblue.oa.dao.OfficeMailDAO;

public class OfficeMailImpl extends SqlMapClientDaoSupport implements OfficeMailDAO {

    public Object addOfficeMail(OfficeMail paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officemail.addOfficeMail", paramBean);
    }

    public int modOfficeMail(OfficeMail paramBean){
        return this.getSqlMapClientTemplate().update("oa.officemail.modOfficeMail", paramBean);
    }

    public int delOfficeMail(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officemail.delOfficeMail", paramMap);
    }

    public OfficeMail queryForBean(Map paramMap){
        return (OfficeMail)this.getSqlMapClientTemplate().queryForObject("oa.officemail.queryForBean",paramMap);
    }

    public List<OfficeMail> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officemail.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officemail.queryForCount", paramMap);
    }
}
