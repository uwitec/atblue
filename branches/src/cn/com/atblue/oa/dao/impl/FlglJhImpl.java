package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglJh;
import cn.com.atblue.oa.dao.FlglJhDAO;

public class FlglJhImpl extends SqlMapClientDaoSupport implements FlglJhDAO {

    public Object addFlglJh(FlglJh paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flgljh.addFlglJh", paramBean);
    }

    public int modFlglJh(FlglJh paramBean){
        return this.getSqlMapClientTemplate().update("oa.flgljh.modFlglJh", paramBean);
    }

    public int delFlglJh(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flgljh.delFlglJh", paramMap);
    }

    public FlglJh queryForBean(Map paramMap){
        return (FlglJh)this.getSqlMapClientTemplate().queryForObject("oa.flgljh.queryForBean",paramMap);
    }

    public List<FlglJh> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flgljh.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flgljh.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flgljh.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flgljh.getPagedCount", paramMap);
    }
}
