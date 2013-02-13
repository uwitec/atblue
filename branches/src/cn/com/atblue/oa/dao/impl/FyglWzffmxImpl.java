package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglWzffmx;
import cn.com.atblue.oa.dao.FyglWzffmxDAO;

public class FyglWzffmxImpl extends SqlMapClientDaoSupport implements FyglWzffmxDAO {

    public Object addFyglWzffmx(FyglWzffmx paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglwzffmx.addFyglWzffmx", paramBean);
    }

    public int modFyglWzffmx(FyglWzffmx paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglwzffmx.modFyglWzffmx", paramBean);
    }

    public int delFyglWzffmx(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglwzffmx.delFyglWzffmx", paramMap);
    }

    public FyglWzffmx queryForBean(Map paramMap){
        return (FyglWzffmx)this.getSqlMapClientTemplate().queryForObject("oa.fyglwzffmx.queryForBean",paramMap);
    }

    public List<FyglWzffmx> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwzffmx.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwzffmx.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwzffmx.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwzffmx.getPagedCount", paramMap);
    }
}
