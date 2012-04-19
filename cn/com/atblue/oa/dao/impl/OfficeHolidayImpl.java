package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeHoliday;
import cn.com.atblue.oa.dao.OfficeHolidayDAO;

public class OfficeHolidayImpl extends SqlMapClientDaoSupport implements OfficeHolidayDAO {

    public Object addOfficeHoliday(OfficeHoliday paramBean){
        return this.getSqlMapClientTemplate().insert("oa.OfficeHoliday.addOfficeHoliday", paramBean);
    }

    public int modOfficeHoliday(OfficeHoliday paramBean){
        return this.getSqlMapClientTemplate().update("oa.OfficeHoliday.modOfficeHoliday", paramBean);
    }

    public int delOfficeHoliday(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.OfficeHoliday.delOfficeHoliday", paramMap);
    }

    public OfficeHoliday queryForBean(Map paramMap){
        return (OfficeHoliday)this.getSqlMapClientTemplate().queryForObject("oa.OfficeHoliday.queryForBean",paramMap);
    }

    public List<OfficeHoliday> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.OfficeHoliday.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.OfficeHoliday.queryForCount", paramMap);
    }
    public List getPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeHoliday.getPagedList", paramMap);
    }
    public int getPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeHoliday.getPagedCount", paramMap);
    }
    public List getWaitPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeHoliday.getWaitPagedList", paramMap);
    }

    public int getWaitPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeHoliday.getWaitPagedCount", paramMap);
    }
    public List getAlreadyPagedList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.OfficeHoliday.getAlreadyPagedList", paramMap);
    }

    public int getAlreadyPagedCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.OfficeHoliday.getAlreadyPagedCount", paramMap);
    }
}
