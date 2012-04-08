package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WInstance;

public interface WInstanceDAO {

    public Object addWInstance(WInstance paramBean);

    public int modWInstance(WInstance paramBean);

    public int delWInstance(Map paramMap);

    public WInstance queryForBean(Map paramMap);

    public List<WInstance> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
