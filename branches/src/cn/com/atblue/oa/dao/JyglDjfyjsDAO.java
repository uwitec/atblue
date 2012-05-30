package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.JyglDjfyjs;

public interface JyglDjfyjsDAO {

    public Object addJyglDjfyjs(JyglDjfyjs paramBean);

    public int modJyglDjfyjs(JyglDjfyjs paramBean);

    public int delJyglDjfyjs(Map paramMap);

    public JyglDjfyjs queryForBean(Map paramMap);

    public List<JyglDjfyjs> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
