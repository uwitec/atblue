package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeCjhyry;

public interface OfficeCjhyryDAO {

    public Object addOfficeCjhyry(OfficeCjhyry paramBean);

    public int modOfficeCjhyry(OfficeCjhyry paramBean);

    public int delOfficeCjhyry(Map paramMap);

    public OfficeCjhyry queryForBean(Map paramMap);

    public List<OfficeCjhyry> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
