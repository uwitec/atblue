package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeYsf;

public interface OfficeYsfDAO {

    public Object addOfficeYsf(OfficeYsf paramBean);

    public int modOfficeYsf(OfficeYsf paramBean);

    public int delOfficeYsf(Map paramMap);

    public OfficeYsf queryForBean(Map paramMap);

    public List<OfficeYsf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
