package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglGhjfl;
import cn.com.atblue.oa.dao.FyglGhjflDAO;

public class FyglGhjflImpl extends SqlMapClientDaoSupport implements FyglGhjflDAO {

    public Object addFyglGhjfl(FyglGhjfl paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglghjfl.addFyglGhjfl", paramBean);
    }

    public int modFyglGhjfl(FyglGhjfl paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglghjfl.modFyglGhjfl", paramBean);
    }

    public int delFyglGhjfl(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglghjfl.delFyglGhjfl", paramMap);
    }

    public FyglGhjfl queryForBean(Map paramMap){
        return (FyglGhjfl)this.getSqlMapClientTemplate().queryForObject("oa.fyglghjfl.queryForBean",paramMap);
    }

    public List<FyglGhjfl> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglghjfl.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglghjfl.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglghjfl.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglghjfl.getPagedCount", paramMap);
    }
}
