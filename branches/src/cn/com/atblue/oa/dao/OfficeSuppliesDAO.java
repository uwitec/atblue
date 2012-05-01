package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeSupplies;

public interface OfficeSuppliesDAO {

    public Object addOfficeSupplies(OfficeSupplies paramBean);

    public int modOfficeSupplies(OfficeSupplies paramBean);

    public int delOfficeSupplies(Map paramMap);

    public OfficeSupplies queryForBean(Map paramMap);

    public List<OfficeSupplies> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
    
    public List getPagedList(PageBean pb, Map paramMap);

    public int getPagedCount(Map paramMap);
    
    public List getWaitPagedList(PageBean pb, Map paramMap);

    public int getWaitPagedCount(Map paramMap);

    public List getAlreadyPagedList(PageBean pb, Map paramMap);

    public int getAlreadyPagedCount(Map paramMap);
}
