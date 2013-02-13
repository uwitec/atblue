package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.FyglLhfw;
import cn.com.atblue.oa.dao.FyglLhfwDAO;

public class FyglLhfwImpl extends SqlMapClientDaoSupport implements FyglLhfwDAO {

    public Object addFyglLhfw(FyglLhfw paramBean){
        return this.getSqlMapClientTemplate().insert("oa.fygllhfw.addFyglLhfw", paramBean);
    }

    public int modFyglLhfw(FyglLhfw paramBean){
        return this.getSqlMapClientTemplate().update("oa.fygllhfw.modFyglLhfw", paramBean);
    }

    public int delFyglLhfw(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.fygllhfw.delFyglLhfw", paramMap);
    }

    public FyglLhfw queryForBean(Map paramMap){
        return (FyglLhfw)this.getSqlMapClientTemplate().queryForObject("oa.fygllhfw.queryForBean",paramMap);
    }

    public List<FyglLhfw> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygllhfw.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygllhfw.queryForCount", paramMap);
    }

    public List getPagedList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.fygllhfw.getPagedList", paramMap);
    }

    public int getPagedCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.fygllhfw.getPagedCount", paramMap);
    }
}
