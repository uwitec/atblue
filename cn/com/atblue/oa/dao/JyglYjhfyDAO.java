package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.JyglYjhfy;

public interface JyglYjhfyDAO {

    public Object addJyglYjhfy(JyglYjhfy paramBean);

    public int modJyglYjhfy(JyglYjhfy paramBean);

    public int delJyglYjhfy(Map paramMap);

    public JyglYjhfy queryForBean(Map paramMap);

    public List<JyglYjhfy> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
