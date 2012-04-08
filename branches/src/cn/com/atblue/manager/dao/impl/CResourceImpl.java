package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.CResource;
import cn.com.atblue.manager.dao.CResourceDAO;

public class CResourceImpl extends SqlMapClientDaoSupport implements CResourceDAO {

    public Object addCResource(CResource paramBean){
        return this.getSqlMapClientTemplate().insert("manager.cresource.addCResource", paramBean);
    }

    public int modCResource(CResource paramBean){
        return this.getSqlMapClientTemplate().update("manager.cresource.modCResource", paramBean);
    }

    public int delCResource(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.cresource.delCResource", paramMap);
    }

    public CResource queryForBean(Map paramMap){
        return (CResource)this.getSqlMapClientTemplate().queryForObject("manager.cresource.queryForBean",paramMap);
    }

    public List<CResource> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.cresource.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.cresource.queryForCount", paramMap);
    }
}
