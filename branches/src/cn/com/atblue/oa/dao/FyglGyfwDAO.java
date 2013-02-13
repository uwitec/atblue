package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglGyfw;

public interface FyglGyfwDAO {

    public Object addFyglGyfw(FyglGyfw paramBean);

    public int modFyglGyfw(FyglGyfw paramBean);

    public int delFyglGyfw(Map paramMap);

    public FyglGyfw queryForBean(Map paramMap);

    public List<FyglGyfw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
