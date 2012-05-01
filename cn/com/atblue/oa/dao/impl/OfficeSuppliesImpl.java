package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeSupplies;
import cn.com.atblue.oa.dao.OfficeSuppliesDAO;

public class OfficeSuppliesImpl extends SqlMapClientDaoSupport implements OfficeSuppliesDAO {

    public Object addOfficeSupplies(OfficeSupplies paramBean){
        return this.getSqlMapClientTemplate().insert("oa.OfficeSupplies.addOfficeSupplies", paramBean);
    }

    public int modOfficeSupplies(OfficeSupplies paramBean){
        return this.getSqlMapClientTemplate().update("oa.OfficeSupplies.modOfficeSupplies", paramBean);
    }

    public int delOfficeSupplies(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.OfficeSupplies.delOfficeSupplies", paramMap);
    }

    public OfficeSupplies queryForBean(Map paramMap){
        return (OfficeSupplies)this.getSqlMapClientTemplate().queryForObject("oa.OfficeSupplies.queryForBean",paramMap);
    }

    public List<OfficeSupplies> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.OfficeSupplies.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.OfficeSupplies.queryForCount", paramMap);
    }
    public List getPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeSupplies.getPagedList", paramMap);
    }
    public int getPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeSupplies.getPagedCount", paramMap);
    }
    public List getWaitPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeSupplies.getWaitPagedList", paramMap);
    }

    public int getWaitPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeSupplies.getWaitPagedCount", paramMap);
    }
    public List getAlreadyPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeSupplies.getAlreadyPagedList", paramMap);
    }

    public int getAlreadyPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeSupplies.getAlreadyPagedCount", paramMap);
    }
}
