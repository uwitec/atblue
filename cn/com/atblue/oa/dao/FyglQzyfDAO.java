package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglQzyf;

public interface FyglQzyfDAO {

    public Object addFyglQzyf(FyglQzyf paramBean);

    public int modFyglQzyf(FyglQzyf paramBean);

    public int delFyglQzyf(Map paramMap);

    public FyglQzyf queryForBean(Map paramMap);

    public List<FyglQzyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
