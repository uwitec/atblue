package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglTwjf;
import cn.com.atblue.oa.dao.FyglTwjfDAO;

public class FyglTwjfImpl extends SqlMapClientDaoSupport implements FyglTwjfDAO {

    public Object addFyglTwjf(FyglTwjf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygltwjf.addFyglTwjf", paramBean);
    }

    public int modFyglTwjf(FyglTwjf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygltwjf.modFyglTwjf", paramBean);
    }

    public int delFyglTwjf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygltwjf.delFyglTwjf", paramMap);
    }

    public FyglTwjf queryForBean(Map paramMap){
        return (FyglTwjf)this.getSqlMapClientTemplate().queryForObject("oa.fygltwjf.queryForBean",paramMap);
    }

    public List<FyglTwjf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygltwjf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygltwjf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygltwjf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygltwjf.getPagedCount", paramMap);
    }
}
