package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglZqlwyf;

public interface FyglZqlwyfDAO {

    public Object addFyglZqlwyf(FyglZqlwyf paramBean);

    public int modFyglZqlwyf(FyglZqlwyf paramBean);

    public int delFyglZqlwyf(Map paramMap);

    public FyglZqlwyf queryForBean(Map paramMap);

    public List<FyglZqlwyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
