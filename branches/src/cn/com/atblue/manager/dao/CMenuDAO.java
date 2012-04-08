package cn.com.atblue.manager.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.manager.bean.CMenu;

public interface CMenuDAO {

    public Object addCMenu(CMenu paramBean);

    public int modCMenu(CMenu paramBean);

    public int delCMenu(Map paramMap);

    public CMenu queryForBean(Map paramMap);

    public List<CMenu> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
