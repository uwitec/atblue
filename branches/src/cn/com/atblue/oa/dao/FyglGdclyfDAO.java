package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglGdclyf;

public interface FyglGdclyfDAO {

    public Object addFyglGdclyf(FyglGdclyf paramBean);

    public int modFyglGdclyf(FyglGdclyf paramBean);

    public int delFyglGdclyf(Map paramMap);

    public FyglGdclyf queryForBean(Map paramMap);

    public List<FyglGdclyf> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
