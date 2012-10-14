package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeYsfYsp;
import cn.com.atblue.oa.dao.OfficeYsfYspDAO;

public class OfficeYsfYspImpl extends SqlMapClientDaoSupport implements OfficeYsfYspDAO {

    public Object addOfficeYsfYsp(OfficeYsfYsp paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeysfysp.addOfficeYsfYsp", paramBean);
    }

    public int modOfficeYsfYsp(OfficeYsfYsp paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeysfysp.modOfficeYsfYsp", paramBean);
    }

    public int delOfficeYsfYsp(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeysfysp.delOfficeYsfYsp", paramMap);
    }

    public OfficeYsfYsp queryForBean(Map paramMap){
        return (OfficeYsfYsp)this.getSqlMapClientTemplate().queryForObject("oa.officeysfysp.queryForBean",paramMap);
    }

    public List<OfficeYsfYsp> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeysfysp.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeysfysp.queryForCount", paramMap);
    }
}
