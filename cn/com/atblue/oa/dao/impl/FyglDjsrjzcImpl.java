package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglDjsrjzc;
import cn.com.atblue.oa.dao.FyglDjsrjzcDAO;

public class FyglDjsrjzcImpl extends SqlMapClientDaoSupport implements FyglDjsrjzcDAO {

    public Object addFyglDjsrjzc(FyglDjsrjzc paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygldjsrjzc.addFyglDjsrjzc", paramBean);
    }

    public int modFyglDjsrjzc(FyglDjsrjzc paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygldjsrjzc.modFyglDjsrjzc", paramBean);
    }

    public int delFyglDjsrjzc(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygldjsrjzc.delFyglDjsrjzc", paramMap);
    }

    public FyglDjsrjzc queryForBean(Map paramMap){
        return (FyglDjsrjzc)this.getSqlMapClientTemplate().queryForObject("oa.fygldjsrjzc.queryForBean",paramMap);
    }

    public List<FyglDjsrjzc> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygldjsrjzc.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygldjsrjzc.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygldjsrjzc.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygldjsrjzc.getPagedCount", paramMap);
    }
}
