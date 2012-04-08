package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WDefinition;

public interface WDefinitionDAO {

    public Object addWDefinition(WDefinition paramBean);

    public int modWDefinition(WDefinition paramBean);

    public int delWDefinition(Map paramMap);

    public WDefinition queryForBean(Map paramMap);

    public List<WDefinition> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
