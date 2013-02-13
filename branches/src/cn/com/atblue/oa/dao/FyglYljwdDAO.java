package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglYljwd;

public interface FyglYljwdDAO {

    public Object addFyglYljwd(FyglYljwd paramBean);

    public int modFyglYljwd(FyglYljwd paramBean);

    public int delFyglYljwd(Map paramMap);

    public FyglYljwd queryForBean(Map paramMap);

    public List<FyglYljwd> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
