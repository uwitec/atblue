package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglXcjts;
import cn.com.atblue.oa.dao.FyglXcjtsDAO;

public class FyglXcjtsImpl extends SqlMapClientDaoSupport implements FyglXcjtsDAO {

    public Object addFyglXcjts(FyglXcjts paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglxcjts.addFyglXcjts", paramBean);
    }

    public int modFyglXcjts(FyglXcjts paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglxcjts.modFyglXcjts", paramBean);
    }

    public int delFyglXcjts(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglxcjts.delFyglXcjts", paramMap);
    }

    public FyglXcjts queryForBean(Map paramMap){
        return (FyglXcjts)this.getSqlMapClientTemplate().queryForObject("oa.fyglxcjts.queryForBean",paramMap);
    }

    public List<FyglXcjts> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglxcjts.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglxcjts.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglxcjts.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglxcjts.getPagedCount", paramMap);
    }
}
