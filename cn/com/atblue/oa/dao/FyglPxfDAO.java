package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglPxf;

public interface FyglPxfDAO {

    public Object addFyglPxf(FyglPxf paramBean);

    public int modFyglPxf(FyglPxf paramBean);

    public int delFyglPxf(Map paramMap);

    public FyglPxf queryForBean(Map paramMap);

    public List<FyglPxf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
