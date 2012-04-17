package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSmsNotice;
import cn.com.atblue.oa.dao.OfficeSmsNoticeDAO;

public class OfficeSmsNoticeImpl extends SqlMapClientDaoSupport implements OfficeSmsNoticeDAO {

    public Object addOfficeSmsNotice(OfficeSmsNotice paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officesmsnotice.addOfficeSmsNotice", paramBean);
    }

    public int modOfficeSmsNotice(OfficeSmsNotice paramBean){
        return this.getSqlMapClientTemplate().update("oa.officesmsnotice.modOfficeSmsNotice", paramBean);
    }

    public int delOfficeSmsNotice(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officesmsnotice.delOfficeSmsNotice", paramMap);
    }

    public OfficeSmsNotice queryForBean(Map paramMap){
        return (OfficeSmsNotice)this.getSqlMapClientTemplate().queryForObject("oa.officesmsnotice.queryForBean",paramMap);
    }

    public List<OfficeSmsNotice> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officesmsnotice.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officesmsnotice.queryForCount", paramMap);
    }
}
