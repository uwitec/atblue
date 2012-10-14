package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficePeixun;
import cn.com.atblue.oa.dao.OfficePeixunDAO;

public class OfficePeixunImpl extends SqlMapClientDaoSupport implements OfficePeixunDAO {

    public Object addOfficePeixun(OfficePeixun paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officepeixun.addOfficePeixun", paramBean);
    }

    public int modOfficePeixun(OfficePeixun paramBean){
        return this.getSqlMapClientTemplate().update("oa.officepeixun.modOfficePeixun", paramBean);
    }

    public int delOfficePeixun(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officepeixun.delOfficePeixun", paramMap);
    }

    public OfficePeixun queryForBean(Map paramMap){
        return (OfficePeixun)this.getSqlMapClientTemplate().queryForObject("oa.officepeixun.queryForBean",paramMap);
    }

    public List<OfficePeixun> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officepeixun.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officepeixun.queryForCount", paramMap);
    }
}
