package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglYlz;
import cn.com.atblue.oa.dao.FlglYlzDAO;

public class FlglYlzImpl extends SqlMapClientDaoSupport implements FlglYlzDAO {

    public Object addFlglYlz(FlglYlz paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flglylz.addFlglYlz", paramBean);
    }

    public int modFlglYlz(FlglYlz paramBean){
        return this.getSqlMapClientTemplate().update("oa.flglylz.modFlglYlz", paramBean);
    }

    public int delFlglYlz(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flglylz.delFlglYlz", paramMap);
    }

    public FlglYlz queryForBean(Map paramMap){
        return (FlglYlz)this.getSqlMapClientTemplate().queryForObject("oa.flglylz.queryForBean",paramMap);
    }

    public List<FlglYlz> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglylz.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglylz.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglylz.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglylz.getPagedCount", paramMap);
    }
}
