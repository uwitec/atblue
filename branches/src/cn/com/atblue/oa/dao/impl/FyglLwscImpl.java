package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglLwsc;
import cn.com.atblue.oa.dao.FyglLwscDAO;

public class FyglLwscImpl extends SqlMapClientDaoSupport implements FyglLwscDAO {

    public Object addFyglLwsc(FyglLwsc paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygllwsc.addFyglLwsc", paramBean);
    }

    public int modFyglLwsc(FyglLwsc paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygllwsc.modFyglLwsc", paramBean);
    }

    public int delFyglLwsc(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygllwsc.delFyglLwsc", paramMap);
    }

    public FyglLwsc queryForBean(Map paramMap){
        return (FyglLwsc)this.getSqlMapClientTemplate().queryForObject("oa.fygllwsc.queryForBean",paramMap);
    }

    public List<FyglLwsc> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygllwsc.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygllwsc.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygllwsc.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygllwsc.getPagedCount", paramMap);
    }
}
