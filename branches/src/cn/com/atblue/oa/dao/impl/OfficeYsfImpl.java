package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeYsf;
import cn.com.atblue.oa.dao.OfficeYsfDAO;

public class OfficeYsfImpl extends SqlMapClientDaoSupport implements OfficeYsfDAO {

    public Object addOfficeYsf(OfficeYsf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeysf.addOfficeYsf", paramBean);
    }

    public int modOfficeYsf(OfficeYsf paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeysf.modOfficeYsf", paramBean);
    }

    public int delOfficeYsf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeysf.delOfficeYsf", paramMap);
    }

    public OfficeYsf queryForBean(Map paramMap){
        return (OfficeYsf)this.getSqlMapClientTemplate().queryForObject("oa.officeysf.queryForBean",paramMap);
    }

    public List<OfficeYsf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeysf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeysf.queryForCount", paramMap);
    }
}
