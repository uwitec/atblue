package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglBghy;
import cn.com.atblue.oa.dao.FyglBghyDAO;

public class FyglBghyImpl extends SqlMapClientDaoSupport implements FyglBghyDAO {

    public Object addFyglBghy(FyglBghy paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglbghy.addFyglBghy", paramBean);
    }

    public int modFyglBghy(FyglBghy paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglbghy.modFyglBghy", paramBean);
    }

    public int delFyglBghy(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglbghy.delFyglBghy", paramMap);
    }

    public FyglBghy queryForBean(Map paramMap){
        return (FyglBghy)this.getSqlMapClientTemplate().queryForObject("oa.fyglbghy.queryForBean",paramMap);
    }

    public List<FyglBghy> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbghy.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbghy.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglbghy.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglbghy.getPagedCount", paramMap);
    }
}
