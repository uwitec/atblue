package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglZhdlwf;

public interface FyglZhdlwfDAO {

    public Object addFyglZhdlwf(FyglZhdlwf paramBean);

    public int modFyglZhdlwf(FyglZhdlwf paramBean);

    public int delFyglZhdlwf(Map paramMap);

    public FyglZhdlwf queryForBean(Map paramMap);

    public List<FyglZhdlwf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
