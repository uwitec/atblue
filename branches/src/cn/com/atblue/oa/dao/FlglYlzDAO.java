package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglYlz;

public interface FlglYlzDAO {

    public Object addFlglYlz(FlglYlz paramBean);

    public int modFlglYlz(FlglYlz paramBean);

    public int delFlglYlz(Map paramMap);

    public FlglYlz queryForBean(Map paramMap);

    public List<FlglYlz> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
