package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CUser;
import cn.com.atblue.manager.dao.CUserDAO;

public class CUserImpl extends SqlMapClientDaoSupport implements CUserDAO {

    public Object addCUser(CUser paramBean){
        return this.getSqlMapClientTemplate().insert("manager.cuser.addCUser", paramBean);
    }

    public int modCUser(CUser paramBean){
        return this.getSqlMapClientTemplate().update("manager.cuser.modCUser", paramBean);
    }

    public int delCUser(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.cuser.delCUser", paramMap);
    }

    public CUser queryForBean(Map paramMap){
        return (CUser)this.getSqlMapClientTemplate().queryForObject("manager.cuser.queryForBean",paramMap);
    }

    public List<CUser> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.cuser.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.cuser.queryForCount", paramMap);
    }
}
