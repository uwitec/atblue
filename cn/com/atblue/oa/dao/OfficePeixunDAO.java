package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficePeixun;

public interface OfficePeixunDAO {

    public Object addOfficePeixun(OfficePeixun paramBean);

    public int modOfficePeixun(OfficePeixun paramBean);

    public int delOfficePeixun(Map paramMap);

    public OfficePeixun queryForBean(Map paramMap);

    public List<OfficePeixun> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
