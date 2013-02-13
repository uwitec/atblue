package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglZhdlwf;
import cn.com.atblue.oa.dao.FyglZhdlwfDAO;

public class FyglZhdlwfImpl extends SqlMapClientDaoSupport implements FyglZhdlwfDAO {

    public Object addFyglZhdlwf(FyglZhdlwf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglzhdlwf.addFyglZhdlwf", paramBean);
    }

    public int modFyglZhdlwf(FyglZhdlwf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglzhdlwf.modFyglZhdlwf", paramBean);
    }

    public int delFyglZhdlwf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglzhdlwf.delFyglZhdlwf", paramMap);
    }

    public FyglZhdlwf queryForBean(Map paramMap){
        return (FyglZhdlwf)this.getSqlMapClientTemplate().queryForObject("oa.fyglzhdlwf.queryForBean",paramMap);
    }

    public List<FyglZhdlwf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglzhdlwf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglzhdlwf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglzhdlwf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglzhdlwf.getPagedCount", paramMap);
    }
}
