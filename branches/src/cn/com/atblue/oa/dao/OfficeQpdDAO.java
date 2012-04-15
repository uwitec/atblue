package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeQpd;

public interface OfficeQpdDAO {

    public Object addOfficeQpd(OfficeQpd paramBean);

    public int modOfficeQpd(OfficeQpd paramBean);

    public int delOfficeQpd(Map paramMap);

    public OfficeQpd queryForBean(Map paramMap);

    public List<OfficeQpd> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
