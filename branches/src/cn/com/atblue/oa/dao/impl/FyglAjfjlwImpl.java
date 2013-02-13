package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglAjfjlw;
import cn.com.atblue.oa.dao.FyglAjfjlwDAO;

public class FyglAjfjlwImpl extends SqlMapClientDaoSupport implements FyglAjfjlwDAO {

    public Object addFyglAjfjlw(FyglAjfjlw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglajfjlw.addFyglAjfjlw", paramBean);
    }

    public int modFyglAjfjlw(FyglAjfjlw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglajfjlw.modFyglAjfjlw", paramBean);
    }

    public int delFyglAjfjlw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglajfjlw.delFyglAjfjlw", paramMap);
    }

    public FyglAjfjlw queryForBean(Map paramMap){
        return (FyglAjfjlw)this.getSqlMapClientTemplate().queryForObject("oa.fyglajfjlw.queryForBean",paramMap);
    }

    public List<FyglAjfjlw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglajfjlw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglajfjlw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglajfjlw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglajfjlw.getPagedCount", paramMap);
    }
}
