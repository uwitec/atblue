package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglScfzlw;

public interface FyglScfzlwDAO {

    public Object addFyglScfzlw(FyglScfzlw paramBean);

    public int modFyglScfzlw(FyglScfzlw paramBean);

    public int delFyglScfzlw(Map paramMap);

    public FyglScfzlw queryForBean(Map paramMap);

    public List<FyglScfzlw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
