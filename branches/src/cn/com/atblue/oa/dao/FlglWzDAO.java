package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglWz;

public interface FlglWzDAO {

    public Object addFlglWz(FlglWz paramBean);

    public int modFlglWz(FlglWz paramBean);

    public int delFlglWz(Map paramMap);

    public FlglWz queryForBean(Map paramMap);

    public List<FlglWz> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
