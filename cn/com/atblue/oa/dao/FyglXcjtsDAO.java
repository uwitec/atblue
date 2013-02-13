package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglXcjts;

public interface FyglXcjtsDAO {

    public Object addFyglXcjts(FyglXcjts paramBean);

    public int modFyglXcjts(FyglXcjts paramBean);

    public int delFyglXcjts(Map paramMap);

    public FyglXcjts queryForBean(Map paramMap);

    public List<FyglXcjts> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
