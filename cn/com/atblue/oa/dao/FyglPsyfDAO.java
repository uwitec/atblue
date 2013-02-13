package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglPsyf;

public interface FyglPsyfDAO {

    public Object addFyglPsyf(FyglPsyf paramBean);

    public int modFyglPsyf(FyglPsyf paramBean);

    public int delFyglPsyf(Map paramMap);

    public FyglPsyf queryForBean(Map paramMap);

    public List<FyglPsyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
