package cn.com.atblue.oa.dao;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeNotice;

import java.util.List;
import java.util.Map;


public interface OfficeNoticeDAO {


	int deleteByPrimaryKey(String noticeid);


	void insert(OfficeNotice record);


	void insertSelective(OfficeNotice record);


	OfficeNotice selectByPrimaryKey(String noticeid);


	int updateByPrimaryKeySelective(OfficeNotice record);


	int updateByPrimaryKeyWithBLOBs(OfficeNotice record);


	int updateByPrimaryKeyWithoutBLOBs(OfficeNotice record);
	

	List selectAllByDepartment(PageBean pb, Map map);
	

	int selectAllByDepartment(Map map);
	

	String getStatus(String status);
	

	String getSummary(String content, int offset) throws Exception;

	List getNowNotice(String userid, PageBean pb);
	
	int getNowNoticeCount(String userid);
	

	List getExpiredNotice(String userid, PageBean pb);
	
	int getExpiredNoticeCount(String userid);
}