package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglFwdw;
import cn.com.atblue.oa.dao.FyglFwdwDAO;

public class FyglFwdwImpl extends SqlMapClientDaoSupport implements FyglFwdwDAO {

    public Object addFyglFwdw(FyglFwdw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglfwdw.addFyglFwdw", paramBean);
    }

    public int modFyglFwdw(FyglFwdw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglfwdw.modFyglFwdw", paramBean);
    }

    public int delFyglFwdw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglfwdw.delFyglFwdw", paramMap);
    }

    public FyglFwdw queryForBean(Map paramMap){
        return (FyglFwdw)this.getSqlMapClientTemplate().queryForObject("oa.fyglfwdw.queryForBean",paramMap);
    }

    public List<FyglFwdw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglfwdw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglfwdw.queryForCount", paramMap);
    }
}
