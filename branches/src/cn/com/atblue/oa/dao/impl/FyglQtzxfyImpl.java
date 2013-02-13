package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglQtzxfy;
import cn.com.atblue.oa.dao.FyglQtzxfyDAO;

public class FyglQtzxfyImpl extends SqlMapClientDaoSupport implements FyglQtzxfyDAO {

    public Object addFyglQtzxfy(FyglQtzxfy paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fyglqtzxfy.addFyglQtzxfy", paramBean);
    }

    public int modFyglQtzxfy(FyglQtzxfy paramBean){
        return this.getSqlMapClientTemplate().update("oa.fyglqtzxfy.modFyglQtzxfy", paramBean);
    }

    public int delFyglQtzxfy(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fyglqtzxfy.delFyglQtzxfy", paramMap);
    }

    public FyglQtzxfy queryForBean(Map paramMap){
        return (FyglQtzxfy)this.getSqlMapClientTemplate().queryForObject("oa.fyglqtzxfy.queryForBean",paramMap);
    }

    public List<FyglQtzxfy> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglqtzxfy.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglqtzxfy.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fyglqtzxfy.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fyglqtzxfy.getPagedCount", paramMap);
    }
}
