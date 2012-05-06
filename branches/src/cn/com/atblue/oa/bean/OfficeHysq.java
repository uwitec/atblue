package cn.com.atblue.oa.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
* 
* @newtime 2012-04-11 23:51:14
*/
public class OfficeHysq {

private String sqid;
private String hymc;
private String sqbm;
private String hynr;
private String bz;
private Date sqsj;
private Timestamp sqkssj;
private Timestamp sqjssj;
private Timestamp sjjssj;
private String sqzt;
private String processId;
private String connectId;
private String sqr;
private String dxtx;
private String dzyj;

public String getSqid(){
return this.sqid;
}

public void setSqid(String sqid){
this.sqid=sqid;
}

public String getHymc(){
return this.hymc;
}

public void setHymc(String hymc){
this.hymc=hymc;
}

public String getSqbm(){
return this.sqbm;
}

public void setSqbm(String sqbm){
this.sqbm=sqbm;
}

public String getHynr(){
return this.hynr;
}

public void setHynr(String hynr){
this.hynr=hynr;
}

public String getBz(){
return this.bz;
}

public void setBz(String bz){
this.bz=bz;
}

public Date getSqsj(){
return this.sqsj;
}

public void setSqsj(Date sqsj){
this.sqsj=sqsj;
}

public Timestamp getSqkssj(){
return this.sqkssj;
}

public void setSqkssj(Timestamp sqkssj){
this.sqkssj=sqkssj;
}

public Timestamp getSqjssj(){
return this.sqjssj;
}

public void setSqjssj(Timestamp sqjssj){
this.sqjssj=sqjssj;
}

public Timestamp getSjjssj(){
return this.sjjssj;
}

public void setSjjssj(Timestamp sjjssj){
this.sjjssj=sjjssj;
}

public String getSqzt(){
return this.sqzt;
}

public void setSqzt(String sqzt){
this.sqzt=sqzt;
}

public String getProcessId(){
return this.processId;
}

public void setProcessId(String processId){
this.processId=processId;
}

public String getConnectId(){
return this.connectId;
}

public void setConnectId(String connectId){
this.connectId=connectId;
}

public String getSqr(){
return this.sqr;
}

public void setSqr(String sqr){
this.sqr=sqr;
}

public String getDxtx() {
	return dxtx;
}

public void setDxtx(String dxtx) {
	this.dxtx = dxtx;
}

public String getDzyj() {
	return dzyj;
}

public void setDzyj(String dzyj) {
	this.dzyj = dzyj;
}
}
