package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglWxdlw;
import cn.com.atblue.oa.dao.FyglWxdlwDAO;

public class FyglWxdlwImpl extends SqlMapClientDaoSupport implements FyglWxdlwDAO {

    public Object addFyglWxdlw(FyglWxdlw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglwxdlw.addFyglWxdlw", paramBean);
    }

    public int modFyglWxdlw(FyglWxdlw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglwxdlw.modFyglWxdlw", paramBean);
    }

    public int delFyglWxdlw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglwxdlw.delFyglWxdlw", paramMap);
    }

    public FyglWxdlw queryForBean(Map paramMap){
        return (FyglWxdlw)this.getSqlMapClientTemplate().queryForObject("oa.fyglwxdlw.queryForBean",paramMap);
    }

    public List<FyglWxdlw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwxdlw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwxdlw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwxdlw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwxdlw.getPagedCount", paramMap);
    }
}
