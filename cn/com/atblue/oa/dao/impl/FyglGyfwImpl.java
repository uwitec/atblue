package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglGyfw;
import cn.com.atblue.oa.dao.FyglGyfwDAO;

public class FyglGyfwImpl extends SqlMapClientDaoSupport implements FyglGyfwDAO {

    public Object addFyglGyfw(FyglGyfw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglgyfw.addFyglGyfw", paramBean);
    }

    public int modFyglGyfw(FyglGyfw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglgyfw.modFyglGyfw", paramBean);
    }

    public int delFyglGyfw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglgyfw.delFyglGyfw", paramMap);
    }

    public FyglGyfw queryForBean(Map paramMap){
        return (FyglGyfw)this.getSqlMapClientTemplate().queryForObject("oa.fyglgyfw.queryForBean",paramMap);
    }

    public List<FyglGyfw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgyfw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgyfw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgyfw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgyfw.getPagedCount", paramMap);
    }
}
