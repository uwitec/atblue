package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglWcf;

public interface FyglWcfDAO {

    public Object addFyglWcf(FyglWcf paramBean);

    public int modFyglWcf(FyglWcf paramBean);

    public int delFyglWcf(Map paramMap);

    public FyglWcf queryForBean(Map paramMap);

    public List<FyglWcf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
