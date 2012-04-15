package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeQpd;
import cn.com.atblue.oa.dao.OfficeQpdDAO;

public class OfficeQpdImpl extends SqlMapClientDaoSupport implements OfficeQpdDAO {

    public Object addOfficeQpd(OfficeQpd paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeqpd.addOfficeQpd", paramBean);
    }

    public int modOfficeQpd(OfficeQpd paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeqpd.modOfficeQpd", paramBean);
    }

    public int delOfficeQpd(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeqpd.delOfficeQpd", paramMap);
    }

    public OfficeQpd queryForBean(Map paramMap){
        return (OfficeQpd)this.getSqlMapClientTemplate().queryForObject("oa.officeqpd.queryForBean",paramMap);
    }

    public List<OfficeQpd> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeqpd.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeqpd.queryForCount", paramMap);
    }
}
