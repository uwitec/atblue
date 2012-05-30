package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.JyglDjfyjs;
import cn.com.atblue.oa.dao.JyglDjfyjsDAO;

public class JyglDjfyjsImpl extends SqlMapClientDaoSupport implements JyglDjfyjsDAO {

    public Object addJyglDjfyjs(JyglDjfyjs paramBean){
        return this.getSqlMapClientTemplate().insert("jygl.jygldjfyjs.addJyglDjfyjs", paramBean);
    }

    public int modJyglDjfyjs(JyglDjfyjs paramBean){
        return this.getSqlMapClientTemplate().update("jygl.jygldjfyjs.modJyglDjfyjs", paramBean);
    }

    public int delJyglDjfyjs(Map paramMap){
        return this.getSqlMapClientTemplate().delete("jygl.jygldjfyjs.delJyglDjfyjs", paramMap);
    }

    public JyglDjfyjs queryForBean(Map paramMap){
        return (JyglDjfyjs)this.getSqlMapClientTemplate().queryForObject("jygl.jygldjfyjs.queryForBean",paramMap);
    }

    public List<JyglDjfyjs> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("jygl.jygldjfyjs.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("jygl.jygldjfyjs.queryForCount", paramMap);
    }
}
