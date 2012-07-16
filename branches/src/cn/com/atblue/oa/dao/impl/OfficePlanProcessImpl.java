package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.com.atblue.oa.bean.OfficePlanProcess;
import cn.com.atblue.oa.dao.OfficePlanProcessDAO;

public class OfficePlanProcessImpl extends SqlMapClientDaoSupport implements OfficePlanProcessDAO {

	public Object addOfficePlanProcess(OfficePlanProcess paramBean) {
		return this.getSqlMapClientTemplate().insert("oa.officePlanProcess.addOfficePlanProcess", paramBean);
	}

	public int delOfficePlanProcess(Map paramMap) {
		return this.getSqlMapClientTemplate().delete("oa.officePlanProcess.delOfficePlanProcess", paramMap);
	}
	public int modOfficePlanProcess(OfficePlanProcess paramBean) {
		return this.getSqlMapClientTemplate().update("oa.officePlanProcess.modOfficePlanProcess", paramBean);
	}

	public OfficePlanProcess queryForBean(Map paramMap) {
		return (OfficePlanProcess)this.getSqlMapClientTemplate().queryForObject("oa.officePlanProcess.queryForBean",paramMap);
	}

	public int queryForCount(Map paramMap) {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officePlanProcess.queryForCount", paramMap);
	}

	public List<OfficePlanProcess> queryForList(Map paramMap) {
		return this.getSqlMapClientTemplate().queryForList("oa.officePlanProcess.queryForList", paramMap);
	}

}
