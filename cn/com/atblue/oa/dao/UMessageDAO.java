package cn.com.atblue.oa.dao;

import java.util.List;

import cn.com.atblue.oa.bean.UMessage;


public interface UMessageDAO {
	public void insert(UMessage message);

	public int update(UMessage message);

	public int delete(UMessage message);

	public UMessage findById(String id);

	public int findCountByReceiverFlag(String receiverId, int flag);

	public List findByReceiverFlag(String receiverId, int flag, int pageNum,
			int pageSize);

	public int findCountBySenderFlag(String senderId, int flag);

	public List findBySenderFlag(String senderId, int flag, int pageNum,
			int pageSize);
	
	public UMessage getByAppkey(String appkey);
}
