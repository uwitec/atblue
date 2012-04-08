package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.COrgnization;

public interface COrgnizationDAO {

    public Object addCOrgnization(COrgnization paramBean);

    public int modCOrgnization(COrgnization paramBean);

    public int delCOrgnization(Map paramMap);

    public COrgnization queryForBean(Map paramMap);

    public List<COrgnization> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
