package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CUser;

public interface CUserDAO {

    public Object addCUser(CUser paramBean);

    public int modCUser(CUser paramBean);

    public int delCUser(Map paramMap);

    public CUser queryForBean(Map paramMap);

    public List<CUser> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
