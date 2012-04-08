package cn.com.atblue.oa.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import bsh.StringUtil;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.oa.bean.UMessage;
import cn.com.atblue.oa.dao.UMessageDAO;

public class UMessageDAOImpl extends SqlMapClientDaoSupport implements
		UMessageDAO {

	public int delete(UMessage message) {
		return getSqlMapClientTemplate().delete("UMessage.delete", message);
	}

	public UMessage findById(String id) {
		return (UMessage) getSqlMapClientTemplate().queryForObject(
				"UMessage.findById", id);
	}

	public int findCountByReceiverFlag(String receiverId, int flag) {
		Map map = new HashMap();
		map.put("receiverid", receiverId);
		map.put("flag", flag);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"UMessage.findCountByReceiverFlag", map);
	}

	public List findByReceiverFlag(String receiverId, int flag, int pageNum,
			int pageSize) {
		Map map = new HashMap();
		map.put("receiverid", receiverId);
		map.put("flag", flag);
		map.put("currentPage", pageNum);
		map.put("pageSize", pageSize);
		return getSqlMapClientTemplate().queryForList(
				"UMessage.findByReceiverFlag", map);
	}

	public int findCountBySenderFlag(String senderId, int flag) {
		Map map = new HashMap();
		map.put("senderid", senderId);
		map.put("flag", flag);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"UMessage.findCountBySenderFlag", map);
	}

	public List findBySenderFlag(String senderId, int flag, int pageNum,
			int pageSize) {
		Map map = new HashMap();
		map.put("senderid", senderId);
		map.put("flag", flag);
		map.put("currentPage", pageNum);
		map.put("pageSize", pageSize);
		return getSqlMapClientTemplate().queryForList(
				"UMessage.findBySenderFlag", map);
	}

	public void insert(UMessage message) {
		getSqlMapClientTemplate().insert("UMessage.insert", message);
	}

	public int update(UMessage message) {
		return getSqlMapClientTemplate().update("UMessage.update", message);
	}
	
	public UMessage getByAppkey(String appkey){
		List list = getSqlMapClientTemplate().queryForList(
				"UMessage.getByAppkey",appkey);
		if(list!=null && list.size()>0){
			return (UMessage)list.get(0);
		}
		return null;
	}
}
