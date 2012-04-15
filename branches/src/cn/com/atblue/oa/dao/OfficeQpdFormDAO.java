package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeQpdForm;

public interface OfficeQpdFormDAO {

    public Object addOfficeQpdForm(OfficeQpdForm paramBean);

    public int modOfficeQpdForm(OfficeQpdForm paramBean);

    public int delOfficeQpdForm(Map paramMap);

    public OfficeQpdForm queryForBean(Map paramMap);

    public List<OfficeQpdForm> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
