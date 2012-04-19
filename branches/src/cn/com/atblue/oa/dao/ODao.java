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

    public String[] getMailSjrByMailId(String mailId);

    public List getMailSjrsByMailId(String mailId);

    public List getSmsPersonsByTzId(String tzId);

    public List getWaitPagedHysqList(PageBean pb, Map paramMap);

    public int getWaitPagedHysqCount(Map paramMap);

    public List getAlreadyPagedHysqList(PageBean pb, Map paramMap);

    public int getAlreadyPagedHysqCount(Map paramMap);
    
    public List getFlowList(String processId);

    public List getPagedYysqList(PageBean pb, Map paramMap);

    public int getPagedYysqCount(Map paramMap);

    public List getWaitPagedYysqList(PageBean pb, Map paramMap);

    public int getWaitPagedYysqCount(Map paramMap);

    public List getAlreadyPagedYysqList(PageBean pb, Map paramMap);

    public int getAlreadyPagedYysqCount(Map paramMap);

    public List getPagedQpdList(Map paramMap);

    public int getPagedQpdCount(Map paramMap);
    
    public List getAllQpdFormItemsByFormId(String formId);

    public List getAllQpdFormItemsByFormId2(String formId,String processId);

    public void deleteAllQpdFormItemsByFormId(String formId);
    
    public String getFormItemIdByConnectId(String connectId);
    
    public String getSignDataByProcessId(String processId);

    public void deleteAllQpdYjsByProcessId(String processId);

    public List getPagedMailList(Map paramMap);

    public int getPagedMailCount(Map paramMap);

    public void deleteAllMailJsrByMailId(String mailId);
    
    public void updateMailJsrSfjs(String mailId,String userId);

    public void updateSmsPersons(int tzId,String userId);

    public void deleteAllSms();

    public List getPagedSmsList(Map paramMap);

    public int getPagedSmsCount(Map paramMap);
    
    public int getSmsSequence();
    
    public void deleteSmsPersonsById(int id);
    
    public String[] getPersonsByTzid(String tzid);
    
    public List getSmsPersonsList();
}
