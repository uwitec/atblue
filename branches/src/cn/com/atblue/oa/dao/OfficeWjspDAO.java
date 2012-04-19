package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeWjsp;

public interface OfficeWjspDAO {

    public Object addOfficeWjsp(OfficeWjsp paramBean);

    public int modOfficeWjsp(OfficeWjsp paramBean);

    public int delOfficeWjsp(Map paramMap);

    public OfficeWjsp queryForBean(Map paramMap);

    public List<OfficeWjsp> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
    
    public List getPagedList(PageBean pb, Map paramMap);

    public int getPagedCount(Map paramMap);
    
    public List getWaitPagedList(PageBean pb, Map paramMap);

    public int getWaitPagedCount(Map paramMap);

    public List getAlreadyPagedList(PageBean pb, Map paramMap);

    public int getAlreadyPagedCount(Map paramMap);
}
