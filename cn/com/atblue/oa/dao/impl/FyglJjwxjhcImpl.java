package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglJjwxjhc;
import cn.com.atblue.oa.dao.FyglJjwxjhcDAO;

public class FyglJjwxjhcImpl extends SqlMapClientDaoSupport implements FyglJjwxjhcDAO {

    public Object addFyglJjwxjhc(FyglJjwxjhc paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygljjwxjhc.addFyglJjwxjhc", paramBean);
    }

    public int modFyglJjwxjhc(FyglJjwxjhc paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygljjwxjhc.modFyglJjwxjhc", paramBean);
    }

    public int delFyglJjwxjhc(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygljjwxjhc.delFyglJjwxjhc", paramMap);
    }

    public FyglJjwxjhc queryForBean(Map paramMap){
        return (FyglJjwxjhc)this.getSqlMapClientTemplate().queryForObject("oa.fygljjwxjhc.queryForBean",paramMap);
    }

    public List<FyglJjwxjhc> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygljjwxjhc.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygljjwxjhc.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygljjwxjhc.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygljjwxjhc.getPagedCount", paramMap);
    }
}
