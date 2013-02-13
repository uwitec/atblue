package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglLwsc;

public interface FyglLwscDAO {

    public Object addFyglLwsc(FyglLwsc paramBean);

    public int modFyglLwsc(FyglLwsc paramBean);

    public int delFyglLwsc(Map paramMap);

    public FyglLwsc queryForBean(Map paramMap);

    public List<FyglLwsc> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
