package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglQzgznr;
import cn.com.atblue.oa.dao.FlglQzgznrDAO;

public class FlglQzgznrImpl extends SqlMapClientDaoSupport implements FlglQzgznrDAO {

    public Object addFlglQzgznr(FlglQzgznr paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flglqzgznr.addFlglQzgznr", paramBean);
    }

    public int modFlglQzgznr(FlglQzgznr paramBean){
        return this.getSqlMapClientTemplate().update("oa.flglqzgznr.modFlglQzgznr", paramBean);
    }

    public int delFlglQzgznr(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flglqzgznr.delFlglQzgznr", paramMap);
    }

    public FlglQzgznr queryForBean(Map paramMap){
        return (FlglQzgznr)this.getSqlMapClientTemplate().queryForObject("oa.flglqzgznr.queryForBean",paramMap);
    }

    public List<FlglQzgznr> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglqzgznr.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglqzgznr.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglqzgznr.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglqzgznr.getPagedCount", paramMap);
    }
}
