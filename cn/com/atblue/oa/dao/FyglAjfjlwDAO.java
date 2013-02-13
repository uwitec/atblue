package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglAjfjlw;

public interface FyglAjfjlwDAO {

    public Object addFyglAjfjlw(FyglAjfjlw paramBean);

    public int modFyglAjfjlw(FyglAjfjlw paramBean);

    public int delFyglAjfjlw(Map paramMap);

    public FyglAjfjlw queryForBean(Map paramMap);

    public List<FyglAjfjlw> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
