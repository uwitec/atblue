package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglYljwd;
import cn.com.atblue.oa.dao.FyglYljwdDAO;

public class FyglYljwdImpl extends SqlMapClientDaoSupport implements FyglYljwdDAO {

    public Object addFyglYljwd(FyglYljwd paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglyljwd.addFyglYljwd", paramBean);
    }

    public int modFyglYljwd(FyglYljwd paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglyljwd.modFyglYljwd", paramBean);
    }

    public int delFyglYljwd(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglyljwd.delFyglYljwd", paramMap);
    }

    public FyglYljwd queryForBean(Map paramMap){
        return (FyglYljwd)this.getSqlMapClientTemplate().queryForObject("oa.fyglyljwd.queryForBean",paramMap);
    }

    public List<FyglYljwd> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglyljwd.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglyljwd.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglyljwd.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglyljwd.getPagedCount", paramMap);
    }
}
