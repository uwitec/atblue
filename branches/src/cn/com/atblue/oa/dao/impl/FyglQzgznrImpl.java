package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglQzgznr;
import cn.com.atblue.oa.dao.FyglQzgznrDAO;

public class FyglQzgznrImpl extends SqlMapClientDaoSupport implements FyglQzgznrDAO {

    public Object addFyglQzgznr(FyglQzgznr paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglqzgznr.addFyglQzgznr", paramBean);
    }

    public int modFyglQzgznr(FyglQzgznr paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglqzgznr.modFyglQzgznr", paramBean);
    }

    public int delFyglQzgznr(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglqzgznr.delFyglQzgznr", paramMap);
    }

    public FyglQzgznr queryForBean(Map paramMap){
        return (FyglQzgznr)this.getSqlMapClientTemplate().queryForObject("oa.fyglqzgznr.queryForBean",paramMap);
    }

    public List<FyglQzgznr> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglqzgznr.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglqzgznr.queryForCount", paramMap);
    }
}
