package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglFlf;

public interface FyglFlfDAO {

    public Object addFyglFlf(FyglFlf paramBean);

    public int modFyglFlf(FyglFlf paramBean);

    public int delFyglFlf(Map paramMap);

    public FyglFlf queryForBean(Map paramMap);

    public List<FyglFlf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
