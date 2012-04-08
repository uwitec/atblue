package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WActivity;

public interface WActivityDAO {

    public Object addWActivity(WActivity paramBean);

    public int modWActivity(WActivity paramBean);

    public int delWActivity(Map paramMap);

    public WActivity queryForBean(Map paramMap);

    public List<WActivity> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
