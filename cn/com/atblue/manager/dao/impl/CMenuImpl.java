package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CMenu;
import cn.com.atblue.manager.dao.CMenuDAO;

public class CMenuImpl extends SqlMapClientDaoSupport implements CMenuDAO {

    public Object addCMenu(CMenu paramBean){
        return this.getSqlMapClientTemplate().insert("manager.cmenu.addCMenu", paramBean);
    }

    public int modCMenu(CMenu paramBean){
        return this.getSqlMapClientTemplate().update("manager.cmenu.modCMenu", paramBean);
    }

    public int delCMenu(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.cmenu.delCMenu", paramMap);
    }

    public CMenu queryForBean(Map paramMap){
        return (CMenu)this.getSqlMapClientTemplate().queryForObject("manager.cmenu.queryForBean",paramMap);
    }

    public List<CMenu> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.cmenu.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.cmenu.queryForCount", paramMap);
    }
}
