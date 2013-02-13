package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglPbyf;
import cn.com.atblue.oa.dao.FyglPbyfDAO;

public class FyglPbyfImpl extends SqlMapClientDaoSupport implements FyglPbyfDAO {

    public Object addFyglPbyf(FyglPbyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglpbyf.addFyglPbyf", paramBean);
    }

    public int modFyglPbyf(FyglPbyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglpbyf.modFyglPbyf", paramBean);
    }

    public int delFyglPbyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglpbyf.delFyglPbyf", paramMap);
    }

    public FyglPbyf queryForBean(Map paramMap){
        return (FyglPbyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglpbyf.queryForBean",paramMap);
    }

    public List<FyglPbyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpbyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpbyf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpbyf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpbyf.getPagedCount", paramMap);
    }
}
