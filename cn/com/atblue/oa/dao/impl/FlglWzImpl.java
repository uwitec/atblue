package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglWz;
import cn.com.atblue.oa.dao.FlglWzDAO;

public class FlglWzImpl extends SqlMapClientDaoSupport implements FlglWzDAO {

    public Object addFlglWz(FlglWz paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flglwz.addFlglWz", paramBean);
    }

    public int modFlglWz(FlglWz paramBean){
        return this.getSqlMapClientTemplate().update("oa.flglwz.modFlglWz", paramBean);
    }

    public int delFlglWz(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flglwz.delFlglWz", paramMap);
    }

    public FlglWz queryForBean(Map paramMap){
        return (FlglWz)this.getSqlMapClientTemplate().queryForObject("oa.flglwz.queryForBean",paramMap);
    }

    public List<FlglWz> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglwz.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglwz.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglwz.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglwz.getPagedCount", paramMap);
    }
}
