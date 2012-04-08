package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CRole;

public interface CRoleDAO {

    public Object addCRole(CRole paramBean);

    public int modCRole(CRole paramBean);

    public int delCRole(Map paramMap);

    public CRole queryForBean(Map paramMap);

    public List<CRole> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
