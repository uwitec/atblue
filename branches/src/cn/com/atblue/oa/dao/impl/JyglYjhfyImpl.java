package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.JyglYjhfy;
import cn.com.atblue.oa.dao.JyglYjhfyDAO;

public class JyglYjhfyImpl extends SqlMapClientDaoSupport implements JyglYjhfyDAO {

    public Object addJyglYjhfy(JyglYjhfy paramBean){
        return this.getSqlMapClientTemplate().insert("jygl.jyglyjhfy.addJyglYjhfy", paramBean);
    }

    public int modJyglYjhfy(JyglYjhfy paramBean){
        return this.getSqlMapClientTemplate().update("jygl.jyglyjhfy.modJyglYjhfy", paramBean);
    }

    public int delJyglYjhfy(Map paramMap){
        return this.getSqlMapClientTemplate().delete("jygl.jyglyjhfy.delJyglYjhfy", paramMap);
    }

    public JyglYjhfy queryForBean(Map paramMap){
        return (JyglYjhfy)this.getSqlMapClientTemplate().queryForObject("jygl.jyglyjhfy.queryForBean",paramMap);
    }

    public List<JyglYjhfy> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("jygl.jyglyjhfy.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("jygl.jyglyjhfy.queryForCount", paramMap);
    }
}
