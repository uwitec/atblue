package cn.com.atblue.oa.dao;

import cn.com.atblue.oa.bean.OfficeSeal;

import java.util.List;
import java.util.Map;

public interface ODao {
    public List getPagedSealList(Map paramMap);

    public int getPagedSealCount(Map paramMap);
    
    public List getAllUserList();
    
    public OfficeSeal getSealByUserId(String userId);
}
