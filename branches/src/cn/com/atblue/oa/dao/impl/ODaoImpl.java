package cn.com.atblue.oa.dao.impl;

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
}
