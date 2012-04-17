package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSms;

public interface OfficeSmsDAO {

    public Object addOfficeSms(OfficeSms paramBean);

    public int modOfficeSms(OfficeSms paramBean);

    public int delOfficeSms(Map paramMap);

    public OfficeSms queryForBean(Map paramMap);

    public List<OfficeSms> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
