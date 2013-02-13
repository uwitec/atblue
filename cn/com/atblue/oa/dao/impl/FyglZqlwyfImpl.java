package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglZqlwyf;
import cn.com.atblue.oa.dao.FyglZqlwyfDAO;

public class FyglZqlwyfImpl extends SqlMapClientDaoSupport implements FyglZqlwyfDAO {

    public Object addFyglZqlwyf(FyglZqlwyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglzqlwyf.addFyglZqlwyf", paramBean);
    }

    public int modFyglZqlwyf(FyglZqlwyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglzqlwyf.modFyglZqlwyf", paramBean);
    }

    public int delFyglZqlwyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglzqlwyf.delFyglZqlwyf", paramMap);
    }

    public FyglZqlwyf queryForBean(Map paramMap){
        return (FyglZqlwyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglzqlwyf.queryForBean",paramMap);
    }

    public List<FyglZqlwyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglzqlwyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglzqlwyf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglzqlwyf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglzqlwyf.getPagedCount", paramMap);
    }
}
