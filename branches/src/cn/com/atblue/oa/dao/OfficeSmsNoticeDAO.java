package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSmsNotice;

public interface OfficeSmsNoticeDAO {

    public Object addOfficeSmsNotice(OfficeSmsNotice paramBean);

    public int modOfficeSmsNotice(OfficeSmsNotice paramBean);

    public int delOfficeSmsNotice(Map paramMap);

    public OfficeSmsNotice queryForBean(Map paramMap);

    public List<OfficeSmsNotice> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
