package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WConnect;

public interface WConnectDAO {

    public Object addWConnect(WConnect paramBean);

    public int modWConnect(WConnect paramBean);

    public int delWConnect(Map paramMap);

    public WConnect queryForBean(Map paramMap);

    public List<WConnect> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
