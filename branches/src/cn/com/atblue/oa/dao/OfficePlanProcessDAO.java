package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficePlanProcess;

public interface OfficePlanProcessDAO {

    public Object addOfficePlanProcess(OfficePlanProcess paramBean);

    public int modOfficePlanProcess(OfficePlanProcess paramBean);

    public int delOfficePlanProcess(Map paramMap);

    public OfficePlanProcess queryForBean(Map paramMap);

    public List<OfficePlanProcess> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
    
}
