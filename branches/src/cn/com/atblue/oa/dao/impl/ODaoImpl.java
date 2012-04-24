package cn.com.atblue.oa.dao.impl;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeSeal;
import cn.com.atblue.oa.dao.ODao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ODaoImpl extends SqlMapClientDaoSupport implements ODao {
    @Override
    public List getPagedSealList(Map paramMap) {
        return this.getSqlMapClientTemplate().queryForList("oa.dao.getPagedSealList", paramMap);
    }

    @Override
    public int getPagedSealCount(Map paramMap) {
        return (Integer) this.getSqlMapClientTemplate().queryForObject("oa.dao.getPagedSealCount", paramMap);
    }
    @Override
    public List getPagedQpdList(Map paramMap) {
        return this.getSqlMapClientTemplate().queryForList("oa.dao.getPagedQpdList", paramMap);
    }

    @Override
    public int getPagedQpdCount(Map paramMap) {
        return (Integer) this.getSqlMapClientTemplate().queryForObject("oa.dao.getPagedQpdCount", paramMap);
    }

    @Override
    public List getPagedMailList(Map paramMap) {
        return this.getSqlMapClientTemplate().queryForList("oa.dao.getPagedMailList", paramMap);
    }

    @Override
    public int getPagedMailCount(Map paramMap) {
        return (Integer) this.getSqlMapClientTemplate().queryForObject("oa.dao.getPagedMailCount", paramMap);
    }

    public List getPagedSmsList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.dao.getPagedSmsList", paramMap);
    }

    public int getPagedSmsCount(Map paramMap){
        return (Integer) this.getSqlMapClientTemplate().queryForObject("oa.dao.getPagedSmsCount", paramMap);
    }

    public List getAllUserList(){
        return  this.getSqlMapClientTemplate().queryForList("oa.dao.getAllUserList");
    }

    public OfficeSeal getSealByUserId(String userId){
        return  (OfficeSeal) this.getSqlMapClientTemplate().queryForObject("oa.dao.getSealByUserId", userId);
    }

    public List getPagedHysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getPagedHysqList", paramMap);
    }

    public int getPagedHysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getPagedHysqCount", paramMap);
    }

    public void deleteCjhyryBySqid(String sqid){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteCjhyryBySqid",sqid);
    }

    public String[] getCjhyryBySqid(String sqid){
        List list =  this.getSqlMapClientTemplate().queryForList("oa.dao.getCjhyryBySqid",sqid);
        String[] _temp = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map)list.get(i);
            String str = (String)map.get("USERID");
            _temp[i] = str;
        }
        return _temp;
    }

    public String[] getMailSjrByMailId(String mailId){
        List list =  this.getSqlMapClientTemplate().queryForList("oa.dao.getMailSjrByMailId",mailId);
        String[] _temp = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map)list.get(i);
            String str = (String)map.get("USER_ID");
            _temp[i] = str;
        }
        return _temp;
    }
    public String[] getPersonsByTzid(String tzid){
        List list =  this.getSqlMapClientTemplate().queryForList("oa.dao.getPersonsByTzid",tzid);
        String[] _temp = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            Map map = (Map)list.get(i);
            String str = (String)map.get("USER_ID");
            _temp[i] = str;
        }
        return _temp;
    }

    public List getMailSjrsByMailId(String mailId){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getMailSjrsByMailId", mailId);
    }

    public List getSmsPersonsByTzId(String tzId){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getSmsPersonsByTzId", tzId);
    }

    public List getWaitPagedHysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getWaitPagedHysqList", paramMap);
    }

    public int getWaitPagedHysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getWaitPagedHysqCount", paramMap);
    }
    public List getAlreadyPagedHysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getAlreadyPagedHysqList", paramMap);
    }

    public int getAlreadyPagedHysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getAlreadyPagedHysqCount", paramMap);
    }

    public List getFlowList(String processId){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getFlowList", processId);
    }

    public int getSmsSequence(){
        return  (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getSmsSequence");
    }

    public List getPagedYysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getPagedYysqList", paramMap);
    }

    public int getPagedYysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getPagedYysqCount", paramMap);
    }

    public List getWaitPagedYysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getWaitPagedYysqList", paramMap);
    }

    public int getWaitPagedYysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getWaitPagedYysqCount", paramMap);
    }

    public List getAlreadyPagedYysqList(PageBean pb, Map paramMap){
        paramMap.put("currentPage", pb.getCurrentPage());
        paramMap.put("pageSize", pb.getPageSize());
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getAlreadyPagedYysqList", paramMap);
    }

    public int getAlreadyPagedYysqCount(Map paramMap){
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "oa.dao.getAlreadyPagedYysqCount", paramMap);
    }

    public List getAllQpdFormItemsByFormId(String formId){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getAllQpdFormItemsByFormId", formId);
    }

    public List getAllQpdFormItemsByFormId2(String formId,String processId){
        Map map = new HashMap();
        map.put("formId",formId);
        map.put("processId",processId);
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getAllQpdFormItemsByFormId2", map);
    }

    public void deleteAllQpdFormItemsByFormId(String formId){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteAllQpdFormItemsByFormId",formId);
    }

    public void deleteAllMailJsrByMailId(String mailId){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteAllMailJsrByMailId",mailId);
    }

    public void deleteSmsPersonsById(int id){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteSmsPersonsById",id);
    }

    public void delOfficeDocumentsCheck(String checkman, String documentid){
        Map map = new HashMap();
        map.put("checkman", checkman);
        map.put("documentid", documentid);
        this.getSqlMapClientTemplate().delete("oa.dao.delOfficeDocumentsCheck",map);
    }

    public void deleteAllSms(){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteAllSms");
    }

    public String getFormItemIdByConnectId(String connectId,String formId){
    	Map map = new HashMap();
    	map.put("connectId", connectId);
    	map.put("formId", formId);
        return (String)this.getSqlMapClientTemplate().queryForObject("oa.dao.getFormItemIdByConnectId",map);
    }

    public String getSignDataByProcessId(String processId){
        return (String)this.getSqlMapClientTemplate().queryForObject("oa.dao.getSignDataByProcessId",processId);
    }

    public void deleteAllQpdYjsByProcessId(String processId){
        this.getSqlMapClientTemplate().delete("oa.dao.deleteAllQpdYjsByProcessId",processId);
    }

    public void updateMailJsrSfjs(String mailId,String userId){
        Map map = new HashMap();
        map.put("mailId",mailId);
        map.put("userId",userId);
        this.getSqlMapClientTemplate().update("oa.dao.updateMailJsrSfjs",map);
    }

    public void updateSmsPersons(int tzId,String userId){
        Map map = new HashMap();
        map.put("tzId",tzId);
        map.put("userId",userId);
        this.getSqlMapClientTemplate().update("oa.dao.updateSmsPersons",map);
    }

    public void updateSmsPerson(String tzId,String phone){
        Map map = new HashMap();
        map.put("tzId",tzId);
        map.put("phone",phone);
        this.getSqlMapClientTemplate().update("oa.dao.updateSmsPerson",map);
    }

    public List getSmsPersonsList(){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getSmsPersonsList");
    }

    public List getLatestAnnounce(int cn){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getLatestAnnounce",cn);
    }

    public List getOfficeDocumentsCheckList(String documentid){
        return getSqlMapClientTemplate().queryForList(
                "oa.dao.getOfficeDocumentsCheckList",documentid);
    }
}
