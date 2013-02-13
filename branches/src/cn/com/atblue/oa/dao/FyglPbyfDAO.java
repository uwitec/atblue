package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglPbyf;

public interface FyglPbyfDAO {

    public Object addFyglPbyf(FyglPbyf paramBean);

    public int modFyglPbyf(FyglPbyf paramBean);

    public int delFyglPbyf(Map paramMap);

    public FyglPbyf queryForBean(Map paramMap);

    public List<FyglPbyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
