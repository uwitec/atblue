package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficePlan;

public interface OfficePlanDAO {

    public Object addOfficePlan(OfficePlan paramBean);

    public int modOfficePlan(OfficePlan paramBean);

    public int delOfficePlan(Map paramMap);
    public int delOfficePlanByFkid(Map paramMap);

    public OfficePlan queryForBean(Map paramMap);

    public List<OfficePlan> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
    
    public List getPagedList(PageBean pb, Map paramMap);

    public int getPagedCount(Map paramMap);
    
    public List getWaitPagedList(PageBean pb, Map paramMap);

    public int getWaitPagedCount(Map paramMap);

    public List getAlreadyPagedList(PageBean pb, Map paramMap);

    public int getAlreadyPagedCount(Map paramMap);
    
    
}
