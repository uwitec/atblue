package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeQpdyj;

public interface OfficeQpdyjDAO {

    public Object addOfficeQpdyj(OfficeQpdyj paramBean);

    public int modOfficeQpdyj(OfficeQpdyj paramBean);

    public int delOfficeQpdyj(Map paramMap);

    public OfficeQpdyj queryForBean(Map paramMap);

    public List<OfficeQpdyj> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
