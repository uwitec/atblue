package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglPxf;
import cn.com.atblue.oa.dao.FyglPxfDAO;

public class FyglPxfImpl extends SqlMapClientDaoSupport implements FyglPxfDAO {

    public Object addFyglPxf(FyglPxf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglpxf.addFyglPxf", paramBean);
    }

    public int modFyglPxf(FyglPxf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglpxf.modFyglPxf", paramBean);
    }

    public int delFyglPxf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglpxf.delFyglPxf", paramMap);
    }

    public FyglPxf queryForBean(Map paramMap){
        return (FyglPxf)this.getSqlMapClientTemplate().queryForObject("oa.fyglpxf.queryForBean",paramMap);
    }

    public List<FyglPxf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpxf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpxf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglpxf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglpxf.getPagedCount", paramMap);
    }
}
