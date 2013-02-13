package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglQzgznr;

public interface FyglQzgznrDAO {

    public Object addFyglQzgznr(FyglQzgznr paramBean);

    public int modFyglQzgznr(FyglQzgznr paramBean);

    public int delFyglQzgznr(Map paramMap);

    public FyglQzgznr queryForBean(Map paramMap);

    public List<FyglQzgznr> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
