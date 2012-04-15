package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeQpdyj;
import cn.com.atblue.oa.dao.OfficeQpdyjDAO;

public class OfficeQpdyjImpl extends SqlMapClientDaoSupport implements OfficeQpdyjDAO {

    public Object addOfficeQpdyj(OfficeQpdyj paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeqpdyj.addOfficeQpdyj", paramBean);
    }

    public int modOfficeQpdyj(OfficeQpdyj paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeqpdyj.modOfficeQpdyj", paramBean);
    }

    public int delOfficeQpdyj(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeqpdyj.delOfficeQpdyj", paramMap);
    }

    public OfficeQpdyj queryForBean(Map paramMap){
        return (OfficeQpdyj)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdyj.queryForBean",paramMap);
    }

    public List<OfficeQpdyj> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeqpdyj.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdyj.queryForCount", paramMap);
    }
}
