package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FlglJdwx;
import cn.com.atblue.oa.dao.FlglJdwxDAO;

public class FlglJdwxImpl extends SqlMapClientDaoSupport implements FlglJdwxDAO {

    public Object addFlglJdwx(FlglJdwx paramBean){
        return this.getSqlMapClientTemplate().insert("oa.flgljdwx.addFlglJdwx", paramBean);
    }

    public int modFlglJdwx(FlglJdwx paramBean){
        return this.getSqlMapClientTemplate().update("oa.flgljdwx.modFlglJdwx", paramBean);
    }

    public int delFlglJdwx(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.flgljdwx.delFlglJdwx", paramMap);
    }

    public FlglJdwx queryForBean(Map paramMap){
        return (FlglJdwx)this.getSqlMapClientTemplate().queryForObject("oa.flgljdwx.queryForBean",paramMap);
    }

    public List<FlglJdwx> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flgljdwx.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flgljdwx.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.flgljdwx.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.flgljdwx.getPagedCount", paramMap);
    }
}
