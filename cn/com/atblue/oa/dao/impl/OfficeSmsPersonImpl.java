package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSmsPerson;
import cn.com.atblue.oa.dao.OfficeSmsPersonDAO;

public class OfficeSmsPersonImpl extends SqlMapClientDaoSupport implements OfficeSmsPersonDAO {

    public Object addOfficeSmsPerson(OfficeSmsPerson paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officesmsperson.addOfficeSmsPerson", paramBean);
    }

    public int modOfficeSmsPerson(OfficeSmsPerson paramBean){
        return this.getSqlMapClientTemplate().update("oa.officesmsperson.modOfficeSmsPerson", paramBean);
    }

    public int delOfficeSmsPerson(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officesmsperson.delOfficeSmsPerson", paramMap);
    }

    public OfficeSmsPerson queryForBean(Map paramMap){
        return (OfficeSmsPerson)this.getSqlMapClientTemplate().queryForObject("oa.officesmsperson.queryForBean",paramMap);
    }

    public List<OfficeSmsPerson> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officesmsperson.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officesmsperson.queryForCount", paramMap);
    }
}
