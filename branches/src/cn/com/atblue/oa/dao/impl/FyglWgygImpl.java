package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglWgyg;
import cn.com.atblue.oa.dao.FyglWgygDAO;

public class FyglWgygImpl extends SqlMapClientDaoSupport implements FyglWgygDAO {

    public Object addFyglWgyg(FyglWgyg paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglwgyg.addFyglWgyg", paramBean);
    }

    public int modFyglWgyg(FyglWgyg paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglwgyg.modFyglWgyg", paramBean);
    }

    public int delFyglWgyg(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglwgyg.delFyglWgyg", paramMap);
    }

    public FyglWgyg queryForBean(Map paramMap){
        return (FyglWgyg)this.getSqlMapClientTemplate().queryForObject("oa.fyglwgyg.queryForBean",paramMap);
    }

    public List<FyglWgyg> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwgyg.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwgyg.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglwgyg.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglwgyg.getPagedCount", paramMap);
    }
}
