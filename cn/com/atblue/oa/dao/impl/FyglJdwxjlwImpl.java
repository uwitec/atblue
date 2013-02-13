package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglJdwxjlw;
import cn.com.atblue.oa.dao.FyglJdwxjlwDAO;

public class FyglJdwxjlwImpl extends SqlMapClientDaoSupport implements FyglJdwxjlwDAO {

    public Object addFyglJdwxjlw(FyglJdwxjlw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygljdwxjlw.addFyglJdwxjlw", paramBean);
    }

    public int modFyglJdwxjlw(FyglJdwxjlw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygljdwxjlw.modFyglJdwxjlw", paramBean);
    }

    public int delFyglJdwxjlw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygljdwxjlw.delFyglJdwxjlw", paramMap);
    }

    public FyglJdwxjlw queryForBean(Map paramMap){
        return (FyglJdwxjlw)this.getSqlMapClientTemplate().queryForObject("oa.fygljdwxjlw.queryForBean",paramMap);
    }

    public List<FyglJdwxjlw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygljdwxjlw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygljdwxjlw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygljdwxjlw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygljdwxjlw.getPagedCount", paramMap);
    }
}
