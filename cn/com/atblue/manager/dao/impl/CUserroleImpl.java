package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CUserrole;
import cn.com.atblue.manager.dao.CUserroleDAO;

public class CUserroleImpl extends SqlMapClientDaoSupport implements CUserroleDAO {

    public Object addCUserrole(CUserrole paramBean){
        return this.getSqlMapClientTemplate().insert("manager.cuserrole.addCUserrole", paramBean);
    }

    public int modCUserrole(CUserrole paramBean){
        return this.getSqlMapClientTemplate().update("manager.cuserrole.modCUserrole", paramBean);
    }

    public int delCUserrole(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.cuserrole.delCUserrole", paramMap);
    }

    public CUserrole queryForBean(Map paramMap){
        return (CUserrole)this.getSqlMapClientTemplate().queryForObject("manager.cuserrole.queryForBean",paramMap);
    }

    public List<CUserrole> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.cuserrole.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.cuserrole.queryForCount", paramMap);
    }
}
