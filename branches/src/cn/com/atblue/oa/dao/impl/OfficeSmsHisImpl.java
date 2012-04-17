package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSmsHis;
import cn.com.atblue.oa.dao.OfficeSmsHisDAO;

public class OfficeSmsHisImpl extends SqlMapClientDaoSupport implements OfficeSmsHisDAO {

    public Object addOfficeSmsHis(OfficeSmsHis paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officesmshis.addOfficeSmsHis", paramBean);
    }

    public int modOfficeSmsHis(OfficeSmsHis paramBean){
        return this.getSqlMapClientTemplate().update("oa.officesmshis.modOfficeSmsHis", paramBean);
    }

    public int delOfficeSmsHis(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officesmshis.delOfficeSmsHis", paramMap);
    }

    public OfficeSmsHis queryForBean(Map paramMap){
        return (OfficeSmsHis)this.getSqlMapClientTemplate().queryForObject("oa.officesmshis.queryForBean",paramMap);
    }

    public List<OfficeSmsHis> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officesmshis.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officesmshis.queryForCount", paramMap);
    }
}
