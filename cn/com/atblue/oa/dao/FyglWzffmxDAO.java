package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglWzffmx;

public interface FyglWzffmxDAO {

    public Object addFyglWzffmx(FyglWzffmx paramBean);

    public int modFyglWzffmx(FyglWzffmx paramBean);

    public int delFyglWzffmx(Map paramMap);

    public FyglWzffmx queryForBean(Map paramMap);

    public List<FyglWzffmx> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
