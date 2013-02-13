package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglJjwxjhc;

public interface FyglJjwxjhcDAO {

    public Object addFyglJjwxjhc(FyglJjwxjhc paramBean);

    public int modFyglJjwxjhc(FyglJjwxjhc paramBean);

    public int delFyglJjwxjhc(Map paramMap);

    public FyglJjwxjhc queryForBean(Map paramMap);

    public List<FyglJjwxjhc> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
