package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeWjsp;
import cn.com.atblue.oa.dao.OfficeWjspDAO;

public class OfficeWjspImpl extends SqlMapClientDaoSupport implements OfficeWjspDAO {

    public Object addOfficeWjsp(OfficeWjsp paramBean){
        return this.getSqlMapClientTemplate().insert("oa.OfficeWjsp.addOfficeWjsp", paramBean);
    }

    public int modOfficeWjsp(OfficeWjsp paramBean){
        return this.getSqlMapClientTemplate().update("oa.OfficeWjsp.modOfficeWjsp", paramBean);
    }

    public int delOfficeWjsp(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.OfficeWjsp.delOfficeWjsp", paramMap);
    }

    public OfficeWjsp queryForBean(Map paramMap){
        return (OfficeWjsp)this.getSqlMapClientTemplate().queryForObject("oa.OfficeWjsp.queryForBean",paramMap);
    }

    public List<OfficeWjsp> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.OfficeWjsp.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.OfficeWjsp.queryForCount", paramMap);
    }
    public List getPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeWjsp.getPagedList", paramMap);
    }
    public int getPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeWjsp.getPagedCount", paramMap);
    }
    public List getWaitPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeWjsp.getWaitPagedList", paramMap);
    }

    public int getWaitPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeWjsp.getWaitPagedCount", paramMap);
    }
    public List getAlreadyPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeWjsp.getAlreadyPagedList", paramMap);
    }

    public int getAlreadyPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeWjsp.getAlreadyPagedCount", paramMap);
    }
}
