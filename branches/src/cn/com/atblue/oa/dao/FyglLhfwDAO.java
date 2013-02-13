package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglLhfw;

public interface FyglLhfwDAO {

    public Object addFyglLhfw(FyglLhfw paramBean);

    public int modFyglLhfw(FyglLhfw paramBean);

    public int delFyglLhfw(Map paramMap);

    public FyglLhfw queryForBean(Map paramMap);

    public List<FyglLhfw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
