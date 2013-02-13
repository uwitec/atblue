package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglScfzlw;
import cn.com.atblue.oa.dao.FyglScfzlwDAO;

public class FyglScfzlwImpl extends SqlMapClientDaoSupport implements FyglScfzlwDAO {

    public Object addFyglScfzlw(FyglScfzlw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglscfzlw.addFyglScfzlw", paramBean);
    }

    public int modFyglScfzlw(FyglScfzlw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglscfzlw.modFyglScfzlw", paramBean);
    }

    public int delFyglScfzlw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglscfzlw.delFyglScfzlw", paramMap);
    }

    public FyglScfzlw queryForBean(Map paramMap){
        return (FyglScfzlw)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzlw.queryForBean",paramMap);
    }

    public List<FyglScfzlw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglscfzlw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzlw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglscfzlw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglscfzlw.getPagedCount", paramMap);
    }
}
