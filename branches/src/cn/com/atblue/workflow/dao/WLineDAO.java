package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WLine;

public interface WLineDAO {

    public Object addWLine(WLine paramBean);

    public int modWLine(WLine paramBean);

    public int delWLine(Map paramMap);

    public WLine queryForBean(Map paramMap);

    public List<WLine> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
