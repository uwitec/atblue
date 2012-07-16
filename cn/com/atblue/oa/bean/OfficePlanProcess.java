package cn.com.atblue.oa.bean;

import java.util.Date;

/**
* 
* @newtime 2012-04-06 22:26:37
*/
public class OfficePlanProcess {
	private String pkid;
	private String sqr;
	private String sqzt;
	private String processId;
	private String connectId;
	private String dxtx;
	private String bm;
	private String bt;
	private String mc;
	private Date lrsj;
	public String getBm() {
		return bm;
	}
	public void setBm(String bm) {
		this.bm = bm;
	}
	public String getBt() {
		return bt;
	}
	public void setBt(String bt) {
		this.bt = bt;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public Date getLrsj() {
		return lrsj;
	}
	public void setLrsj(Date lrsj) {
		this.lrsj = lrsj;
	}
	public String getPkid() {
		return pkid;
	}
	public void setPkid(String pkid) {
		this.pkid = pkid;
	}
	public String getSqr() {
		return sqr;
	}
	public void setSqr(String sqr) {
		this.sqr = sqr;
	}
	public String getSqzt() {
		return sqzt;
	}
	public void setSqzt(String sqzt) {
		this.sqzt = sqzt;
	}
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getConnectId() {
		return connectId;
	}
	public void setConnectId(String connectId) {
		this.connectId = connectId;
	}
	public String getDxtx() {
		return dxtx;
	}
	public void setDxtx(String dxtx) {
		this.dxtx = dxtx;
	}
}
