package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeMailSjr;
import cn.com.atblue.oa.dao.OfficeMailSjrDAO;

public class OfficeMailSjrImpl extends SqlMapClientDaoSupport implements OfficeMailSjrDAO {

    public Object addOfficeMailSjr(OfficeMailSjr paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officemailsjr.addOfficeMailSjr", paramBean);
    }

    public int modOfficeMailSjr(OfficeMailSjr paramBean){
        return this.getSqlMapClientTemplate().update("oa.officemailsjr.modOfficeMailSjr", paramBean);
    }

    public int delOfficeMailSjr(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officemailsjr.delOfficeMailSjr", paramMap);
    }

    public OfficeMailSjr queryForBean(Map paramMap){
        return (OfficeMailSjr)this.getSqlMapClientTemplate().queryForObject("oa.officemailsjr.queryForBean",paramMap);
    }

    public List<OfficeMailSjr> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officemailsjr.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officemailsjr.queryForCount", paramMap);
    }
}
