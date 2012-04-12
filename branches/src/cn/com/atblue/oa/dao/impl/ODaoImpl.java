package cn.com.atblue.oa.dao.impl;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeSeal;
import cn.com.atblue.oa.dao.ODao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

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
}
