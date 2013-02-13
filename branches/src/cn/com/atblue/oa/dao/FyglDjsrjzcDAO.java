package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglDjsrjzc;

public interface FyglDjsrjzcDAO {

    public Object addFyglDjsrjzc(FyglDjsrjzc paramBean);

    public int modFyglDjsrjzc(FyglDjsrjzc paramBean);

    public int delFyglDjsrjzc(Map paramMap);

    public FyglDjsrjzc queryForBean(Map paramMap);

    public List<FyglDjsrjzc> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
