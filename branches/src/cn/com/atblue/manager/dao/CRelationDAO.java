package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CRelation;

public interface CRelationDAO {

    public Object addCRelation(CRelation paramBean);

    public int modCRelation(CRelation paramBean);

    public int delCRelation(Map paramMap);

    public CRelation queryForBean(Map paramMap);

    public List<CRelation> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
