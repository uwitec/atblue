package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CResource;

public interface CResourceDAO {

    public Object addCResource(CResource paramBean);

    public int modCResource(CResource paramBean);

    public int delCResource(Map paramMap);

    public CResource queryForBean(Map paramMap);

    public List<CResource> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
