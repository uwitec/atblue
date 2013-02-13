package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglWxdlw;

public interface FyglWxdlwDAO {

    public Object addFyglWxdlw(FyglWxdlw paramBean);

    public int modFyglWxdlw(FyglWxdlw paramBean);

    public int delFyglWxdlw(Map paramMap);

    public FyglWxdlw queryForBean(Map paramMap);

    public List<FyglWxdlw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
