package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSeal;

public interface OfficeSealDAO {

    public Object addOfficeSeal(OfficeSeal paramBean);

    public int modOfficeSeal(OfficeSeal paramBean);

    public int delOfficeSeal(Map paramMap);

    public OfficeSeal queryForBean(Map paramMap);

    public List<OfficeSeal> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
