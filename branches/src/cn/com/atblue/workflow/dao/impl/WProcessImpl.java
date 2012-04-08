package cn.com.atblue.workflow.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.workflow.bean.WProcess;
import cn.com.atblue.workflow.dao.WProcessDAO;

public class WProcessImpl extends SqlMapClientDaoSupport implements WProcessDAO {

    public Object addWProcess(WProcess paramBean){
        return this.getSqlMapClientTemplate().insert("workflow.wprocess.addWProcess", paramBean);
    }

    public int modWProcess(WProcess paramBean){
        return this.getSqlMapClientTemplate().update("workflow.wprocess.modWProcess", paramBean);
    }

    public int delWProcess(Map paramMap){
        return this.getSqlMapClientTemplate().delete("workflow.wprocess.delWProcess", paramMap);
    }

    public WProcess queryForBean(Map paramMap){
        return (WProcess)this.getSqlMapClientTemplate().queryForObject("workflow.wprocess.queryForBean",paramMap);
    }

    public List<WProcess> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("workflow.wprocess.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("workflow.wprocess.queryForCount", paramMap);
    }
}
