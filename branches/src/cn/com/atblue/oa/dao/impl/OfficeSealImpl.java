package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSeal;
import cn.com.atblue.oa.dao.OfficeSealDAO;

public class OfficeSealImpl extends SqlMapClientDaoSupport implements OfficeSealDAO {

    public Object addOfficeSeal(OfficeSeal paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeseal.addOfficeSeal", paramBean);
    }

    public int modOfficeSeal(OfficeSeal paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeseal.modOfficeSeal", paramBean);
    }

    public int delOfficeSeal(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeseal.delOfficeSeal", paramMap);
    }

    public OfficeSeal queryForBean(Map paramMap){
        return (OfficeSeal)this.getSqlMapClientTemplate().queryForObject("oa.officeseal.queryForBean",paramMap);
    }

    public List<OfficeSeal> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeseal.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeseal.queryForCount", paramMap);
    }
}
