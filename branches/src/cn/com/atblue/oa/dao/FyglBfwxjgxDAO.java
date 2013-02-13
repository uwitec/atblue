package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglBfwxjgx;

public interface FyglBfwxjgxDAO {

    public Object addFyglBfwxjgx(FyglBfwxjgx paramBean);

    public int modFyglBfwxjgx(FyglBfwxjgx paramBean);

    public int delFyglBfwxjgx(Map paramMap);

    public FyglBfwxjgx queryForBean(Map paramMap);

    public List<FyglBfwxjgx> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
