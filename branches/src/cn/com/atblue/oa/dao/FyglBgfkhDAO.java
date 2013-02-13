package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglBgfkh;

public interface FyglBgfkhDAO {

    public Object addFyglBgfkh(FyglBgfkh paramBean);

    public int modFyglBgfkh(FyglBgfkh paramBean);

    public int delFyglBgfkh(Map paramMap);

    public FyglBgfkh queryForBean(Map paramMap);

    public List<FyglBgfkh> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
