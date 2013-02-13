package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglPsyf;
import cn.com.atblue.oa.dao.FyglPsyfDAO;

public class FyglPsyfImpl extends SqlMapClientDaoSupport implements FyglPsyfDAO {

    public Object addFyglPsyf(FyglPsyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglpsyf.addFyglPsyf", paramBean);
    }

    public int modFyglPsyf(FyglPsyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglpsyf.modFyglPsyf", paramBean);
    }

    public int delFyglPsyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglpsyf.delFyglPsyf", paramMap);
    }

    public FyglPsyf queryForBean(Map paramMap){
        return (FyglPsyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglpsyf.queryForBean",paramMap);
    }

    public List<FyglPsyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpsyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpsyf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpsyf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpsyf.getPagedCount", paramMap);
    }
}
