package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglGdclyf;
import cn.com.atblue.oa.dao.FyglGdclyfDAO;

public class FyglGdclyfImpl extends SqlMapClientDaoSupport implements FyglGdclyfDAO {

    public Object addFyglGdclyf(FyglGdclyf paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglgdclyf.addFyglGdclyf", paramBean);
    }

    public int modFyglGdclyf(FyglGdclyf paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglgdclyf.modFyglGdclyf", paramBean);
    }

    public int delFyglGdclyf(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglgdclyf.delFyglGdclyf", paramMap);
    }

    public FyglGdclyf queryForBean(Map paramMap){
        return (FyglGdclyf)this.getSqlMapClientTemplate().queryForObject("oa.fyglgdclyf.queryForBean",paramMap);
    }

    public List<FyglGdclyf> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgdclyf.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgdclyf.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglgdclyf.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglgdclyf.getPagedCount", paramMap);
    }
}
