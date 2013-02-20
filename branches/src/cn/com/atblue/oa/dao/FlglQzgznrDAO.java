package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglQzgznr;

public interface FlglQzgznrDAO {

    public Object addFlglQzgznr(FlglQzgznr paramBean);

    public int modFlglQzgznr(FlglQzgznr paramBean);

    public int delFlglQzgznr(Map paramMap);

    public FlglQzgznr queryForBean(Map paramMap);

    public List<FlglQzgznr> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
