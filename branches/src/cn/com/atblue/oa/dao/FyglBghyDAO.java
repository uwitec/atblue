package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglBghy;

public interface FyglBghyDAO {

    public Object addFyglBghy(FyglBghy paramBean);

    public int modFyglBghy(FyglBghy paramBean);

    public int delFyglBghy(Map paramMap);

    public FyglBghy queryForBean(Map paramMap);

    public List<FyglBghy> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
