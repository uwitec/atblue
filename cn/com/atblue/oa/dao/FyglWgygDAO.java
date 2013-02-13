package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglWgyg;

public interface FyglWgygDAO {

    public Object addFyglWgyg(FyglWgyg paramBean);

    public int modFyglWgyg(FyglWgyg paramBean);

    public int delFyglWgyg(Map paramMap);

    public FyglWgyg queryForBean(Map paramMap);

    public List<FyglWgyg> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
