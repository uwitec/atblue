package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglJdwxjlw;

public interface FyglJdwxjlwDAO {

    public Object addFyglJdwxjlw(FyglJdwxjlw paramBean);

    public int modFyglJdwxjlw(FyglJdwxjlw paramBean);

    public int delFyglJdwxjlw(Map paramMap);

    public FyglJdwxjlw queryForBean(Map paramMap);

    public List<FyglJdwxjlw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
