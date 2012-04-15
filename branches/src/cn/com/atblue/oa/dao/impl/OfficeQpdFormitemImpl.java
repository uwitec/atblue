package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeQpdFormitem;
import cn.com.atblue.oa.dao.OfficeQpdFormitemDAO;

public class OfficeQpdFormitemImpl extends SqlMapClientDaoSupport implements OfficeQpdFormitemDAO {

    public Object addOfficeQpdFormitem(OfficeQpdFormitem paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officeqpdformitem.addOfficeQpdFormitem", paramBean);
    }

    public int modOfficeQpdFormitem(OfficeQpdFormitem paramBean){
        return this.getSqlMapClientTemplate().update("oa.officeqpdformitem.modOfficeQpdFormitem", paramBean);
    }

    public int delOfficeQpdFormitem(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officeqpdformitem.delOfficeQpdFormitem", paramMap);
    }

    public OfficeQpdFormitem queryForBean(Map paramMap){
        return (OfficeQpdFormitem)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdformitem.queryForBean",paramMap);
    }

    public List<OfficeQpdFormitem> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officeqpdformitem.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeqpdformitem.queryForCount", paramMap);
    }
}
