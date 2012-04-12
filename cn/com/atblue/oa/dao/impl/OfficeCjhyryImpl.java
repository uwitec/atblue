package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeCjhyry;
import cn.com.atblue.oa.dao.OfficeCjhyryDAO;

public class OfficeCjhyryImpl extends SqlMapClientDaoSupport implements OfficeCjhyryDAO {

    public Object addOfficeCjhyry(OfficeCjhyry paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officecjhyry.addOfficeCjhyry", paramBean);
    }

    public int modOfficeCjhyry(OfficeCjhyry paramBean){
        return this.getSqlMapClientTemplate().update("oa.officecjhyry.modOfficeCjhyry", paramBean);
    }

    public int delOfficeCjhyry(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officecjhyry.delOfficeCjhyry", paramMap);
    }

    public OfficeCjhyry queryForBean(Map paramMap){
        return (OfficeCjhyry)this.getSqlMapClientTemplate().queryForObject("oa.officecjhyry.queryForBean",paramMap);
    }

    public List<OfficeCjhyry> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officecjhyry.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officecjhyry.queryForCount", paramMap);
    }
}
