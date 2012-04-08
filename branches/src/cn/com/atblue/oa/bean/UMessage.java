package cn.com.atblue.oa.bean;

import java.util.Date;

/**
 * model class generate from table U_MESSAGE
 * 
 * @table U_MESSAGE
 */
public class UMessage {
	private String id;
	private String sender;
	private String receiver;
	private String message;
	private Date sendtime;
	private Date receivetime;
	private int flag;
	private String appname;
	private String appkey;
	private String senderid;
	private String receiverid;
	private String type;
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 * @column ID
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public String getSender() {
		return sender;
	}

	/**
	 * @param sender
	 * @column SENDER
	 */
	public void setSender(String sender) {
		this.sender = sender;
	}

	/**
	 * @return
	 */
	public String getReceiver() {
		return receiver;
	}

	/**
	 * @param receiver
	 * @column RECEIVER
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	/**
	 * @return
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 * @column MESSAGE
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return
	 */
	public Date getSendtime() {
		return sendtime;
	}

	/**
	 * @param sendtime
	 * @column SENDTIME
	 */
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	/**
	 * @return
	 */
	public Date getReceivetime() {
		return receivetime;
	}

	/**
	 * @param receivetime
	 * @column RECEIVETIME
	 */
	public void setReceivetime(Date receivetime) {
		this.receivetime = receivetime;
	}

	/**
	 * @return
	 */
	public int getFlag() {
		return flag;
	}

	/**
	 * @param flag
	 * @column FLAG
	 */
	public void setFlag(int flag) {
		this.flag = flag;
	}

	/**
	 * @return
	 */
	public String getAppname() {
		return appname;
	}

	/**
	 * @param appname
	 * @column APPNAME
	 */
	public void setAppname(String appname) {
		this.appname = appname;
	}

	/**
	 * @return
	 */
	public String getAppkey() {
		return appkey;
	}

	/**
	 * @param appkey
	 * @column APPKEY
	 */
	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	/**
	 * @return
	 */
	public String getSenderid() {
		return senderid;
	}

	/**
	 * @param senderid
	 * @column SENDERID
	 */
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}

	/**
	 * @return
	 */
	public String getReceiverid() {
		return receiverid;
	}

	/**
	 * @param receiverid
	 * @column RECEIVERID
	 */
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}

	@Override
	public String toString() {
		return "UMessage{" + "id='" + id + '\'' + ", sender='" + sender + '\''
				+ ", receiver='" + receiver + '\'' + ", message='" + message
				+ '\'' + ", sendtime=" + sendtime + ", receivetime="
				+ receivetime + ", flag=" + flag + ", appname='" + appname
				+ '\'' + ", appkey='" + appkey + '\'' + ", senderid='"
				+ senderid + '\'' + ", receiverid='" + receiverid + '\'' + '}';
	}
}
