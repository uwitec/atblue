package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeHysq;

public interface OfficeHysqDAO {

    public Object addOfficeHysq(OfficeHysq paramBean);

    public int modOfficeHysq(OfficeHysq paramBean);

    public int delOfficeHysq(Map paramMap);

    public OfficeHysq queryForBean(Map paramMap);

    public List<OfficeHysq> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
