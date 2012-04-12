package cn.com.atblue.oa.dao;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeSeal;

import java.util.List;
import java.util.Map;

public interface ODao {
    public List getPagedSealList(Map paramMap);

    public int getPagedSealCount(Map paramMap);
    
    public List getAllUserList();
    
    public OfficeSeal getSealByUserId(String userId);

    public List getPagedHysqList(PageBean pb, Map paramMap);

    public int getPagedHysqCount(Map paramMap);
    
    public void deleteCjhyryBySqid(String sqid);

    public String[] getCjhyryBySqid(String sqid);

    public List getWaitPagedHysqList(PageBean pb, Map paramMap);

    public int getWaitPagedHysqCount(Map paramMap);

    public List getAlreadyPagedHysqList(PageBean pb, Map paramMap);

    public int getAlreadyPagedHysqCount(Map paramMap);
    
    public List getFlowList(String processId);
}
