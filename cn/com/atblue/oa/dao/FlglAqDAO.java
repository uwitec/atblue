package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglAq;

public interface FlglAqDAO {

    public Object addFlglAq(FlglAq paramBean);

    public int modFlglAq(FlglAq paramBean);

    public int delFlglAq(Map paramMap);

    public FlglAq queryForBean(Map paramMap);

    public List<FlglAq> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
