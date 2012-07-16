package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficePlan;
import cn.com.atblue.oa.dao.OfficePlanDAO;

public class OfficePlanImpl extends SqlMapClientDaoSupport implements OfficePlanDAO {

	public Object addOfficePlan(OfficePlan paramBean) {
		return this.getSqlMapClientTemplate().insert("oa.officeplan.addOfficePlan", paramBean);
	}

	public int delOfficePlan(Map paramMap) {
		return this.getSqlMapClientTemplate().delete("oa.officeplan.delOfficePlan", paramMap);
	}
	public int delOfficePlanByFkid(Map paramMap) {
		return this.getSqlMapClientTemplate().delete("oa.officeplan.delOfficePlanByFkid", paramMap);
	}
	public int modOfficePlan(OfficePlan paramBean) {
		return this.getSqlMapClientTemplate().update("oa.officeplan.modOfficePlan", paramBean);
	}

	public OfficePlan queryForBean(Map paramMap) {
		return (OfficePlan)this.getSqlMapClientTemplate().queryForObject("oa.officeplan.queryForBean",paramMap);
	}

	public int queryForCount(Map paramMap) {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officeplan.queryForCount", paramMap);
	}

	public List<OfficePlan> queryForList(Map paramMap) {
		return this.getSqlMapClientTemplate().queryForList("oa.officeplan.queryForList", paramMap);
	}
	 public List getPagedList(PageBean pb, Map paramMap){
	        paramMap.put("currentPage", pb.getCurrentPage());
	        paramMap.put("pageSize", pb.getPageSize());
	        return getSqlMapClientTemplate().queryForList(
	                "oa.officeplan.getPagedList", paramMap);
	    }
	    public int getPagedCount(Map paramMap){
	        return (Integer) getSqlMapClientTemplate().queryForObject(
	                "oa.officeplan.getPagedCount", paramMap);
	    }
	    public List getWaitPagedList(PageBean pb, Map paramMap){
	        paramMap.put("currentPage", pb.getCurrentPage());
	        paramMap.put("pageSize", pb.getPageSize());
	        return getSqlMapClientTemplate().queryForList(
	                "oa.officeplan.getWaitPagedList", paramMap);
	    }

	    public int getWaitPagedCount(Map paramMap){
	        return (Integer) getSqlMapClientTemplate().queryForObject(
	                "oa.officeplan.getWaitPagedCount", paramMap);
	    }
	    public List getAlreadyPagedList(PageBean pb, Map paramMap){
	        paramMap.put("currentPage", pb.getCurrentPage());
	        paramMap.put("pageSize", pb.getPageSize());
	        return getSqlMapClientTemplate().queryForList(
	                "oa.officeplan.getAlreadyPagedList", paramMap);
	    }

	    public int getAlreadyPagedCount(Map paramMap){
	        return (Integer) getSqlMapClientTemplate().queryForObject(
	                "oa.officeplan.getAlreadyPagedCount", paramMap);
	    }

}
