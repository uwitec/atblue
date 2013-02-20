package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglJh;

public interface FlglJhDAO {

    public Object addFlglJh(FlglJh paramBean);

    public int modFlglJh(FlglJh paramBean);

    public int delFlglJh(Map paramMap);

    public FlglJh queryForBean(Map paramMap);

    public List<FlglJh> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
