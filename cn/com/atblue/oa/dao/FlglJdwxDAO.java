package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FlglJdwx;

public interface FlglJdwxDAO {

    public Object addFlglJdwx(FlglJdwx paramBean);

    public int modFlglJdwx(FlglJdwx paramBean);

    public int delFlglJdwx(Map paramMap);

    public FlglJdwx queryForBean(Map paramMap);

    public List<FlglJdwx> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
