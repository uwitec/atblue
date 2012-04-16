package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeMail;

public interface OfficeMailDAO {

    public Object addOfficeMail(OfficeMail paramBean);

    public int modOfficeMail(OfficeMail paramBean);

    public int delOfficeMail(Map paramMap);

    public OfficeMail queryForBean(Map paramMap);

    public List<OfficeMail> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
