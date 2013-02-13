package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglTwjf;

public interface FyglTwjfDAO {

    public Object addFyglTwjf(FyglTwjf paramBean);

    public int modFyglTwjf(FyglTwjf paramBean);

    public int delFyglTwjf(Map paramMap);

    public FyglTwjf queryForBean(Map paramMap);

    public List<FyglTwjf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
