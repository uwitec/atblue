package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSmsHis;

public interface OfficeSmsHisDAO {

    public Object addOfficeSmsHis(OfficeSmsHis paramBean);

    public int modOfficeSmsHis(OfficeSmsHis paramBean);

    public int delOfficeSmsHis(Map paramMap);

    public OfficeSmsHis queryForBean(Map paramMap);

    public List<OfficeSmsHis> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
