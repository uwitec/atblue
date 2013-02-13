package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglBfwxjgx;
import cn.com.atblue.oa.dao.FyglBfwxjgxDAO;

public class FyglBfwxjgxImpl extends SqlMapClientDaoSupport implements FyglBfwxjgxDAO {

    public Object addFyglBfwxjgx(FyglBfwxjgx paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglbfwxjgx.addFyglBfwxjgx", paramBean);
    }

    public int modFyglBfwxjgx(FyglBfwxjgx paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglbfwxjgx.modFyglBfwxjgx", paramBean);
    }

    public int delFyglBfwxjgx(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglbfwxjgx.delFyglBfwxjgx", paramMap);
    }

    public FyglBfwxjgx queryForBean(Map paramMap){
        return (FyglBfwxjgx)this.getSqlMapClientTemplate().queryForObject("oa.fyglbfwxjgx.queryForBean",paramMap);
    }

    public List<FyglBfwxjgx> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbfwxjgx.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbfwxjgx.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbfwxjgx.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbfwxjgx.getPagedCount", paramMap);
    }
}
