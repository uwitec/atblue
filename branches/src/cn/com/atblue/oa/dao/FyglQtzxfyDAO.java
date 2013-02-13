package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.FyglQtzxfy;

public interface FyglQtzxfyDAO {

    public Object addFyglQtzxfy(FyglQtzxfy paramBean);

    public int modFyglQtzxfy(FyglQtzxfy paramBean);

    public int delFyglQtzxfy(Map paramMap);

    public FyglQtzxfy queryForBean(Map paramMap);

    public List<FyglQtzxfy> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);

    public List getPagedList(Map paramMap);

    public int getPagedCount(Map paramMap);
}
