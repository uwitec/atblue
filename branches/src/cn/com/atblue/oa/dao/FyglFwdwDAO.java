package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglFwdw;

public interface FyglFwdwDAO {

    public Object addFyglFwdw(FyglFwdw paramBean);

    public int modFyglFwdw(FyglFwdw paramBean);

    public int delFyglFwdw(Map paramMap);

    public FyglFwdw queryForBean(Map paramMap);

    public List<FyglFwdw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
