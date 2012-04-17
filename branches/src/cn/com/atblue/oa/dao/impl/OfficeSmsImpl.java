package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSms;
import cn.com.atblue.oa.dao.OfficeSmsDAO;

public class OfficeSmsImpl extends SqlMapClientDaoSupport implements OfficeSmsDAO {

    public Object addOfficeSms(OfficeSms paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officesms.addOfficeSms", paramBean);
    }

    public int modOfficeSms(OfficeSms paramBean){
        return this.getSqlMapClientTemplate().update("oa.officesms.modOfficeSms", paramBean);
    }

    public int delOfficeSms(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officesms.delOfficeSms", paramMap);
    }

    public OfficeSms queryForBean(Map paramMap){
        return (OfficeSms)this.getSqlMapClientTemplate().queryForObject("oa.officesms.queryForBean",paramMap);
    }

    public List<OfficeSms> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officesms.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officesms.queryForCount", paramMap);
    }
}
