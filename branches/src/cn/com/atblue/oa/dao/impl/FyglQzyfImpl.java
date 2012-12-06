package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglQzyf;
import cn.com.atblue.oa.dao.FyglQzyfDAO;

public class FyglQzyfImpl extends SqlMapClientDaoSupport implements FyglQzyfDAO {

    public Object addFyglQzyf(FyglQzyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglqzyf.addFyglQzyf", paramBean);
    }

    public int modFyglQzyf(FyglQzyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglqzyf.modFyglQzyf", paramBean);
    }

    public int delFyglQzyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglqzyf.delFyglQzyf", paramMap);
    }

    public FyglQzyf queryForBean(Map paramMap){
        return (FyglQzyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglqzyf.queryForBean",paramMap);
    }

    public List<FyglQzyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglqzyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglqzyf.queryForCount", paramMap);
    }
}
