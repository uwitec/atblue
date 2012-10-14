package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeYsfYsp;

public interface OfficeYsfYspDAO {

    public Object addOfficeYsfYsp(OfficeYsfYsp paramBean);

    public int modOfficeYsfYsp(OfficeYsfYsp paramBean);

    public int delOfficeYsfYsp(Map paramMap);

    public OfficeYsfYsp queryForBean(Map paramMap);

    public List<OfficeYsfYsp> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
