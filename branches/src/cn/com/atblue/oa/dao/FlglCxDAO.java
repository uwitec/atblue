package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglCx;

public interface FlglCxDAO {

    public Object addFlglCx(FlglCx paramBean);

    public int modFlglCx(FlglCx paramBean);

    public int delFlglCx(Map paramMap);

    public FlglCx queryForBean(Map paramMap);

    public List<FlglCx> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
