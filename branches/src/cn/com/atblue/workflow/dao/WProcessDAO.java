package cn.com.atblue.workflow.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.workflow.bean.WProcess;

public interface WProcessDAO {

    public Object addWProcess(WProcess paramBean);

    public int modWProcess(WProcess paramBean);

    public int delWProcess(Map paramMap);

    public WProcess queryForBean(Map paramMap);

    public List<WProcess> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
