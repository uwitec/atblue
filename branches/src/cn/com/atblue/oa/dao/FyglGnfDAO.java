package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglGnf;

public interface FyglGnfDAO {

    public Object addFyglGnf(FyglGnf paramBean);

    public int modFyglGnf(FyglGnf paramBean);

    public int delFyglGnf(Map paramMap);

    public FyglGnf queryForBean(Map paramMap);

    public List<FyglGnf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
