package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CUserrole;

public interface CUserroleDAO {

    public Object addCUserrole(CUserrole paramBean);

    public int modCUserrole(CUserrole paramBean);

    public int delCUserrole(Map paramMap);

    public CUserrole queryForBean(Map paramMap);

    public List<CUserrole> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
