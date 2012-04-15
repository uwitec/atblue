package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeQpdFormitem;

public interface OfficeQpdFormitemDAO {

    public Object addOfficeQpdFormitem(OfficeQpdFormitem paramBean);

    public int modOfficeQpdFormitem(OfficeQpdFormitem paramBean);

    public int delOfficeQpdFormitem(Map paramMap);

    public OfficeQpdFormitem queryForBean(Map paramMap);

    public List<OfficeQpdFormitem> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
