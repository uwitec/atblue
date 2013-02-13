package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglScfzyf;

public interface FyglScfzyfDAO {

    public Object addFyglScfzyf(FyglScfzyf paramBean);

    public int modFyglScfzyf(FyglScfzyf paramBean);

    public int delFyglScfzyf(Map paramMap);

    public FyglScfzyf queryForBean(Map paramMap);

    public List<FyglScfzyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
