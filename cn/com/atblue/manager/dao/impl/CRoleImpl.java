package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CRole;
import cn.com.atblue.manager.dao.CRoleDAO;

public class CRoleImpl extends SqlMapClientDaoSupport implements CRoleDAO {

    public Object addCRole(CRole paramBean){
        return this.getSqlMapClientTemplate().insert("manager.crole.addCRole", paramBean);
    }

    public int modCRole(CRole paramBean){
        return this.getSqlMapClientTemplate().update("manager.crole.modCRole", paramBean);
    }

    public int delCRole(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.crole.delCRole", paramMap);
    }

    public CRole queryForBean(Map paramMap){
        return (CRole)this.getSqlMapClientTemplate().queryForObject("manager.crole.queryForBean",paramMap);
    }

    public List<CRole> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.crole.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.crole.queryForCount", paramMap);
    }
}
