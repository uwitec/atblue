package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeMailSjr;

public interface OfficeMailSjrDAO {

    public Object addOfficeMailSjr(OfficeMailSjr paramBean);

    public int modOfficeMailSjr(OfficeMailSjr paramBean);

    public int delOfficeMailSjr(Map paramMap);

    public OfficeMailSjr queryForBean(Map paramMap);

    public List<OfficeMailSjr> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
