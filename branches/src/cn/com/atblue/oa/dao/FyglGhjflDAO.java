package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglGhjfl;

public interface FyglGhjflDAO {

    public Object addFyglGhjfl(FyglGhjfl paramBean);

    public int modFyglGhjfl(FyglGhjfl paramBean);

    public int delFyglGhjfl(Map paramMap);

    public FyglGhjfl queryForBean(Map paramMap);

    public List<FyglGhjfl> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
