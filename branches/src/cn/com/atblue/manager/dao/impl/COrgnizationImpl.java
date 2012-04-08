package cn.com.atblue.manager.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.manager.bean.COrgnization;
import cn.com.atblue.manager.dao.COrgnizationDAO;

public class COrgnizationImpl extends SqlMapClientDaoSupport implements COrgnizationDAO {

    public Object addCOrgnization(COrgnization paramBean){
        return this.getSqlMapClientTemplate().insert("manager.corgnization.addCOrgnization", paramBean);
    }

    public int modCOrgnization(COrgnization paramBean){
        return this.getSqlMapClientTemplate().update("manager.corgnization.modCOrgnization", paramBean);
    }

    public int delCOrgnization(Map paramMap){
        return this.getSqlMapClientTemplate().delete("manager.corgnization.delCOrgnization", paramMap);
    }

    public COrgnization queryForBean(Map paramMap){
        return (COrgnization)this.getSqlMapClientTemplate().queryForObject("manager.corgnization.queryForBean",paramMap);
    }

    public List<COrgnization> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("manager.corgnization.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("manager.corgnization.queryForCount", paramMap);
    }
}
