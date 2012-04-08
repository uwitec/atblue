package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WWorkflow;

public interface WWorkflowDAO {

    public Object addWWorkflow(WWorkflow paramBean);

    public int modWWorkflow(WWorkflow paramBean);

    public int delWWorkflow(Map paramMap);

    public WWorkflow queryForBean(Map paramMap);

    public List<WWorkflow> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
