package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglFlf;
import cn.com.atblue.oa.dao.FyglFlfDAO;

public class FyglFlfImpl extends SqlMapClientDaoSupport implements FyglFlfDAO {

    public Object addFyglFlf(FyglFlf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglflf.addFyglFlf", paramBean);
    }

    public int modFyglFlf(FyglFlf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglflf.modFyglFlf", paramBean);
    }

    public int delFyglFlf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglflf.delFyglFlf", paramMap);
    }

    public FyglFlf queryForBean(Map paramMap){
        return (FyglFlf)this.getSqlMapClientTemplate().queryForObject("oa.fyglflf.queryForBean",paramMap);
    }

    public List<FyglFlf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglflf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglflf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglflf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglflf.getPagedCount", paramMap);
    }
}
