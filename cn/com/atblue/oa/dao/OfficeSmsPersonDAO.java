package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSmsPerson;

public interface OfficeSmsPersonDAO {

    public Object addOfficeSmsPerson(OfficeSmsPerson paramBean);

    public int modOfficeSmsPerson(OfficeSmsPerson paramBean);

    public int delOfficeSmsPerson(Map paramMap);

    public OfficeSmsPerson queryForBean(Map paramMap);

    public List<OfficeSmsPerson> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
