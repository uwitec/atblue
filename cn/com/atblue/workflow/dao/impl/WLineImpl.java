package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WLine;
import cn.com.atblue.workflow.dao.WLineDAO;

public class WLineImpl extends SqlMapClientDaoSupport implements WLineDAO {

    public Object addWLine(WLine paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wline.addWLine", paramBean);
    }

    public int modWLine(WLine paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wline.modWLine", paramBean);
    }

    public int delWLine(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wline.delWLine", paramMap);
    }

    public WLine queryForBean(Map paramMap){
        return (WLine)this.getSqlMapClientTemplate().queryForObject("workflow.wline.queryForBean",paramMap);
    }

    public List<WLine> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wline.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wline.queryForCount", paramMap);
    }
}
