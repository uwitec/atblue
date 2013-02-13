package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglKzjzqys;
import cn.com.atblue.oa.dao.FyglKzjzqysDAO;

public class FyglKzjzqysImpl extends SqlMapClientDaoSupport implements FyglKzjzqysDAO {

    public Object addFyglKzjzqys(FyglKzjzqys paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglkzjzqys.addFyglKzjzqys", paramBean);
    }

    public int modFyglKzjzqys(FyglKzjzqys paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglkzjzqys.modFyglKzjzqys", paramBean);
    }

    public int delFyglKzjzqys(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglkzjzqys.delFyglKzjzqys", paramMap);
    }

    public FyglKzjzqys queryForBean(Map paramMap){
        return (FyglKzjzqys)this.getSqlMapClientTemplate().queryForObject("oa.fyglkzjzqys.queryForBean",paramMap);
    }

    public List<FyglKzjzqys> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglkzjzqys.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglkzjzqys.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglkzjzqys.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglkzjzqys.getPagedCount", paramMap);
    }
}
