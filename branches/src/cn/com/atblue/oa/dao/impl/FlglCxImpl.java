package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglCx;
import cn.com.atblue.oa.dao.FlglCxDAO;

public class FlglCxImpl extends SqlMapClientDaoSupport implements FlglCxDAO {

    public Object addFlglCx(FlglCx paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flglcx.addFlglCx", paramBean);
    }

    public int modFlglCx(FlglCx paramBean){
        return this.getSqlMapClientTemplate().update("oa.flglcx.modFlglCx", paramBean);
    }

    public int delFlglCx(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flglcx.delFlglCx", paramMap);
    }

    public FlglCx queryForBean(Map paramMap){
        return (FlglCx)this.getSqlMapClientTemplate().queryForObject("oa.flglcx.queryForBean",paramMap);
    }

    public List<FlglCx> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglcx.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglcx.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flglcx.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flglcx.getPagedCount", paramMap);
    }
}
