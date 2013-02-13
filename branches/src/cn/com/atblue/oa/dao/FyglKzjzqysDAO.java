package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglKzjzqys;

public interface FyglKzjzqysDAO {

    public Object addFyglKzjzqys(FyglKzjzqys paramBean);

    public int modFyglKzjzqys(FyglKzjzqys paramBean);

    public int delFyglKzjzqys(Map paramMap);

    public FyglKzjzqys queryForBean(Map paramMap);

    public List<FyglKzjzqys> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
