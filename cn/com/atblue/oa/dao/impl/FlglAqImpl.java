package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglAq;
import cn.com.atblue.oa.dao.FlglAqDAO;

public class FlglAqImpl extends SqlMapClientDaoSupport implements FlglAqDAO {

    public Object addFlglAq(FlglAq paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flglaq.addFlglAq", paramBean);
    }

    public int modFlglAq(FlglAq paramBean){
        return this.getSqlMapClientTemplate().update("oa.flglaq.modFlglAq", paramBean);
    }

    public int delFlglAq(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flglaq.delFlglAq", paramMap);
    }

    public FlglAq queryForBean(Map paramMap){
        return (FlglAq)this.getSqlMapClientTemplate().queryForObject("oa.flglaq.queryForBean",paramMap);
    }

    public List<FlglAq> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglaq.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglaq.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglaq.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglaq.getPagedCount", paramMap);
    }
}
