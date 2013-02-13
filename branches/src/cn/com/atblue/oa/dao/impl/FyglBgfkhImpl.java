package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglBgfkh;
import cn.com.atblue.oa.dao.FyglBgfkhDAO;

public class FyglBgfkhImpl extends SqlMapClientDaoSupport implements FyglBgfkhDAO {

    public Object addFyglBgfkh(FyglBgfkh paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglbgfkh.addFyglBgfkh", paramBean);
    }

    public int modFyglBgfkh(FyglBgfkh paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglbgfkh.modFyglBgfkh", paramBean);
    }

    public int delFyglBgfkh(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglbgfkh.delFyglBgfkh", paramMap);
    }

    public FyglBgfkh queryForBean(Map paramMap){
        return (FyglBgfkh)this.getSqlMapClientTemplate().queryForObject("oa.fyglbgfkh.queryForBean",paramMap);
    }

    public List<FyglBgfkh> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbgfkh.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbgfkh.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbgfkh.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbgfkh.getPagedCount", paramMap);
    }
}
