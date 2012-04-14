package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeYysq;

public interface OfficeYysqDAO {

    public Object addOfficeYysq(OfficeYysq paramBean);

    public int modOfficeYysq(OfficeYysq paramBean);

    public int delOfficeYysq(Map paramMap);

    public OfficeYysq queryForBean(Map paramMap);

    public List<OfficeYysq> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
