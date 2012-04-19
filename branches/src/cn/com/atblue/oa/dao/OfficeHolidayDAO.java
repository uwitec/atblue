package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeHoliday;

public interface OfficeHolidayDAO {

    public Object addOfficeHoliday(OfficeHoliday paramBean);

    public int modOfficeHoliday(OfficeHoliday paramBean);

    public int delOfficeHoliday(Map paramMap);

    public OfficeHoliday queryForBean(Map paramMap);

    public List<OfficeHoliday> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
    
    public List getPagedList(PageBean pb, Map paramMap);

    public int getPagedCount(Map paramMap);
    
    public List getWaitPagedList(PageBean pb, Map paramMap);

    public int getWaitPagedCount(Map paramMap);

    public List getAlreadyPagedList(PageBean pb, Map paramMap);

    public int getAlreadyPagedCount(Map paramMap);
}
