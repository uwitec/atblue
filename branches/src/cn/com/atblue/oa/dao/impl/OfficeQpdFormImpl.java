package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeQpdForm;
import cn.com.atblue.oa.dao.OfficeQpdFormDAO;

public class OfficeQpdFormImpl extends SqlMapClientDaoSupport implements OfficeQpdFormDAO {

    public Object addOfficeQpdForm(OfficeQpdForm paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeqpdform.addOfficeQpdForm", paramBean);
    }

    public int modOfficeQpdForm(OfficeQpdForm paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeqpdform.modOfficeQpdForm", paramBean);
    }

    public int delOfficeQpdForm(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeqpdform.delOfficeQpdForm", paramMap);
    }

    public OfficeQpdForm queryForBean(Map paramMap){
        return (OfficeQpdForm)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdform.queryForBean",paramMap);
    }

    public List<OfficeQpdForm> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeqpdform.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdform.queryForCount", paramMap);
    }
}
