<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
        String MC = StringUtil.parseNull(request.getParameter("MC"),"");
        String BM = StringUtil.parseNull(request.getParameter("BM"),"");
        String BT = StringUtil.parseNull(request.getParameter("BT"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        String dxtx = StringUtil.parseNull(request.getParameter("dxtx"),"");
         OfficePlanProcess officePlanProcess = new  OfficePlanProcess();
         officePlanProcess.setBt(BT);
         officePlanProcess.setBm(BM);
         officePlanProcess.setMc(MC);
         officePlanProcess.setPkid(StringUtil.getUUID());
         officePlanProcess.setLrsj(DateUtil.getDate());
         officePlanProcess.setSqzt("已保存");//保存状态
         officePlanProcess.setSqr(cUser.getUserId());
        officePlanProcess.setDxtx(dxtx);
         if("startup".equals(flag)){
            officePlanProcess.setSqzt("已申请");
            //创建流程代码在这里
//             Status status = workflow.startWorkflow("5a06a28b-133f-44d7-99da-fc5f209fbc19",cUser.getUserId());
             Status status = workflow.startWorkflow("21aac430-1b8c-43aa-9406-eba4a1931082",cUser.getUserId());
            officePlanProcess.setProcessId(status.getProcessId());
            officePlanProcess.setConnectId(status.getConnectId());
        }
         officePlanProcessDAO.addOfficePlanProcess(officePlanProcess);
        String XMS[] = request.getParameterValues("XM");
        String XMMXS[] = request.getParameterValues("XMMX");
        String GGS[] = request.getParameterValues("GG");
        String DWS[] = request.getParameterValues("DW");
        String DJS[] = request.getParameterValues("DJ");
        String SLS[] = request.getParameterValues("SL");
        String DJYJS[] = request.getParameterValues("DJYJ");
        String TJFWCSS[] = request.getParameterValues("TJFWCS");
        String YWSCZRZS[] =request.getParameterValues("YWSCZRZ");
        String TJFWCS2S[] = request.getParameterValues("TJFWCS2");
        String YWSCZRZ2S[] = request.getParameterValues("YWSCZRZ2");
        String BZS[] = request.getParameterValues("BZ");
        String NYS[] = request.getParameterValues("NY");
        String DJ_WS[] = request.getParameterValues("DJ_W");
        String FYS[] = request.getParameterValues("FY");
        String MCS[] = request.getParameterValues("MC");
        if(XMS!=null&&XMS.length>0){
        for(int j = 0;j<XMS.length;j++){
        OfficePlan officePlan = new  OfficePlan();
        officePlan.setPkid(StringUtil.getUUID());
        officePlan.setBz(BZS[j]);
        officePlan.setMc(MCS[j]);
        officePlan.setXm(XMS[j]);
        officePlan.setXmmx(XMMXS[j]);
        if(!StringUtil.isBlankOrEmpty(SLS[j])){
            officePlan.setSl(Double.valueOf(SLS[j]));
        }
        if(!StringUtil.isBlankOrEmpty(DJS[j])){
            officePlan.setDj(Double.valueOf(DJS[j]));
        }
         if(!StringUtil.isBlankOrEmpty(DJ_WS[j])){
            officePlan.setDj_w(Double.valueOf(DJ_WS[j]));
        }
         if(!StringUtil.isBlankOrEmpty(FYS[j])){
            officePlan.setFy(Double.valueOf(FYS[j]));
        } 
        officePlan.setDw(DWS[j]);
        officePlan.setGg(GGS[j]);
        officePlan.setDjyj(DJYJS[j]);
        officePlan.setTjfwcs(TJFWCSS[j]);
        officePlan.setTjfwcs2(TJFWCS2S[j]);
        officePlan.setYwsczrz(YWSCZRZS[j]);
        officePlan.setYwsczrz2(YWSCZRZ2S[j]);
        officePlan.setNy(NYS[j]);
        officePlan.setFkid(officePlanProcess.getPkid());
        officePlanDAO.addOfficePlan(officePlan);
        }
        }
%>
		<script>
		    window.location='index.jsp';
		</script>
<%	}%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
            }

			function CheckDateTime(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			   }
			   return true;
			}
			function CheckDate(object){
			   var rr=/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/
			   if(!rr.test(object.value)){
			    	object.focus();
			 		return false;
			  }
			  return true;
			}		
			function checkForm(){
				if(document.form1.MC.value==""){
					document.form1.MC.focus();
					alert("请输入费用名称!");
					return;
				}
				//if(document.getElementById("checked").checked){
                //	 document.all.dxtx.value="1";
               // }else if(!document.getElementById("checked").checked){
                //	document.all.dxtx.value="0";
               // }
				document.form1.submit();
			}
            function startup(){
                if(document.form1.MC.value==""){
                    document.form1.MC.focus();
                    alert("请输入费用名称!");
                    return;
                }
                //if(document.getElementById("checked").checked){
               // 	 document.all.dxtx.value="1";
               // }else if(!document.getElementById("checked").checked){
              //  	document.all.dxtx.value="0";
              //  }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>
	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="frmRd" method="post">
            <input type="hidden" name="flag" value=""/>
            <input type="hidden" name="dxtx" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						新建预计划费用支出
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="insert();" value="保存">
										&nbsp;
										 <input type="button" class="button"
                                               onclick="startup();" value="创建流程并启动">
										&nbsp;
										<input type="button" class="button" id="button1"
											onclick="history.back()" value="返回">
									
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
						<%--固定表头DIV--%>
						<div id="scrollDiv"
							style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="mtabtab" id="mtabtab">
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										费用标题
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="text" name="BT" value=""  style="width:500px"/>
                                        <input type="checkbox" name="checked" id="checked" value="1">短信提醒
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" width="120" class="head_left">
										负责部门
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="hidden" name="BM" value="<%=StringUtil.parseNull(orgId,"")%>"/><%=StringUtil.parseNull(cOrgnization.getOrgnaName(),"")%>
									</td>
								</tr>
							</table>
							<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" id="tab_id" class="mtabtab">
						<tr class="form_th">
					<th  nowrap="nowrap" width="80">
						费用名称
					</th>
					<th  nowrap="nowrap" width="80">
						费用项目
					</th>
					<th  nowrap="nowrap" width="80">
						项目明细
					</th>
					<th  nowrap="nowrap" width="80">
						型号规格
					</th>
					<th nowrap="nowrap"  width="80">
						单位
					</th>
					<th nowrap="nowrap"  width="40">
						单价<br>(元)
					</th>
					<th nowrap="nowrap"  width="50">
						单价<br>(万元)
					</th>
					<th nowrap="nowrap"  width="40">
						数量
					</th>
					<th nowrap="nowrap"  width="50">
						预计划<br>费用
					</th>
					<th nowrap="nowrap"  width="80">
						定价依据
					</th>
					<th nowrap="nowrap"  width="80">
						推荐服务厂商1
					</th>
					<th nowrap="nowrap"  width="80">
						有无市场准入证
					</th>
					<th nowrap="nowrap"  width="80">
						推荐服务厂商2
					</th>
					<th nowrap="nowrap"  width="80">
						有无市场准入证
					</th>
					<th nowrap="nowrap"  width="80">
						发生<br>年月
					</th>
					<th nowrap="nowrap"  width="80">
						备注
					</th>
					<th nowrap="nowrap"  width="80">
						操作
					</th>
					</tr>
				</table>
				 <table align="right"><tr>
                <td>
                <span style="color: red" id="warn"></span>
                <input type="button" class="button" name="b_xj" value="增加" onClick="addRow();">
                <input type="button" class="button" name="b_qx" value="取消" onClick="history.go(-1);">
                </td>
                </tr></table>
			</div>
		</form>
	</body>
</html>
<script>
function insert(){
		if(document.all.BT.value==''){
		alert("请录入费用标题！");
		document.all.BT.focus();
		return;
		}
		if(document.all.MC.value==''){
		alert("请录入费用名称！");
		document.all.MC.focus();
		return;
		}
		 if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
          }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
         }
    document.getElementById("warn").innerText="";
    document.all.flag.value="";
    document.frmRd.submit();
    return ;
		var _tab = document.getElementById("tab_id");
		var _rows = _tab.rows;
			if(_rows.length<=1){
				alert("请添加预计划明细！");
				addRow();
				return;
			}else{
				var _first = chkNeed(["MC","XM","XMMX","GG","DW","DJ","SL","DJYJ","NY"]);
				if(_first){
					_first.focus();
					document.getElementById("warn").innerText="有未填写的必填项";
					return;
				}else{
					document.getElementById("warn").innerText="";
					 document.all.flag.value="";
					document.frmRd.submit();
				}
		}
	}
	function startup(){
		if(document.all.BT.value==''){
		alert("请录入费用标题！");
		document.all.BT.focus();
		return;
		}
		if(document.all.MC.value==''){
		alert("请录入费用名称！");
		document.all.MC.focus();
		return;
		}
		 if(document.getElementById("checked").checked){
                	 document.all.dxtx.value="1";
          }else if(!document.getElementById("checked").checked){
                	document.all.dxtx.value="0";
         }
        document.getElementById("warn").innerText="";
        document.all.flag.value="startup";
        document.frmRd.submit();
        return ;
		var _tab = document.getElementById("tab_id");
		var _rows = _tab.rows;
			if(_rows.length<=1){
				alert("请添加预计划明细！");
				addRow();
				return;
			}else{
				var _first = chkNeed(["MC","XM","XMMX","GG","DW","DJ","SL","DJYJ","NY"]);
				if(_first){
					_first.focus();
					document.getElementById("warn").innerText="有未填写的必填项";
					return;
				}else{
					document.getElementById("warn").innerText="";
					 document.all.flag.value="startup";
					document.frmRd.submit();
				}
		}
	}
	function turn(seq){
		var DJ_W = document.getElementById("DJ_W"+seq).value;
		var DJ = document.getElementById("DJ"+seq).value;
		document.getElementById("DJ_W"+seq).value=Math.round(DJ)/10000;
	}
	function turn1(seq){
		var DJ_W = document.getElementById("DJ_W"+seq).value;
		var SL = document.getElementById("SL"+seq).value;
		document.getElementById("FY"+seq).value=DJ_W*SL;
	}
var seq = 1;
function addRow(){
		var _tab = document.getElementById("tab_id");
		var _rows = _tab.rows;
		var _newRow = _tab.insertRow(_rows.length);
		var _td; 
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="MC" id="MC'+seq+'" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="XM" id="XM'+seq+'" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="XMMX" id="XMMX'+seq+'" style="width:100%" type="text" size="15">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="GG" id="GG'+seq+'" style="width:100%"  type="text" size="20">';
		_td=_newRow.insertCell(_newRow.cells.length);	
		_td.innerHTML='<input name="DW" id="DW'+seq+'" style="width:100%"  type="text" size="3">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="DJ" id="DJ'+seq+'" type="text" size="6" style="width:100%" onkeyup="FloatInput1(this);turn('+seq+');"  onkeyup="FloatInput1(this);turn('+seq+');" onkeydown="FloatInput1(this);">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="DJ_W" id="DJ_W'+seq+'" type="text" size="6" style="width:100%"  onkeyup="FloatInput1(this);" onkeydown="FloatInput1(this);" readonly>';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="SL" id="SL'+seq+'" type="text" size="6" style="width:100%"  onkeyup="FloatInput1(this);turn1('+seq+');" onkeydown="FloatInput1(this);">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="FY" id="FY'+seq+'" type="text" size="6" style="width:100%"  onkeyup="FloatInput1(this);" onkeydown="FloatInput1(this);" readonly>';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="DJYJ" id="DJYJ'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="TJFWCS" id="TJFWCS'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="YWSCZRZ" id="YWSCZRZ'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="TJFWCS2" id="TJFWCS2'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="YWSCZRZ2" id="YWSCZRZ2'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="NY" id="NY'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input name="BZ" id="BZ'+seq+'" type="text" size="6" style="width:100%">';
		_td=_newRow.insertCell(_newRow.cells.length);
		_td.innerHTML='<input type="button" value="删除" class="button" onclick="delRow(this)"/>';
			seq = seq + 1;
	}
function delRow(v){
		_tr= v.parentNode.parentNode;
		_tbody = _tr.parentNode;
		_tbody.removeChild(_tr);
	}
	function FloatInput1(obj){
 var str=obj.value;
 if(event.keyCode==18){
 alert("非法字符！");
 obj.value=str.substr(0,str.length);
 event.returnValue=false;
}
 if(event.keyCode>228) event.returnValue=false;
 
 var str=obj.value;
 /*var invalStr=["!","@","#","$","%","^","&","&","*","(",")"];
	var i=0;
	for( i=0;i<11;i++){
	 if(str.indexOf(invalStr[i])>=0){
	 obj.value=str.substr(0,str.length-1);
	 event.returnValue=false;
	 }
	}*/
if (event.keyCode==34 || event.keyCode==39) event.returnValue = false;
	
	key=event.keyCode.toString()
  
	if (key=="89") event.returnValue=false; 

	var strkey="8,9,37,39,46,48,49,50,51,52,53,54,55,56,57,86,96,97,98,99,100,101,102,103,104,105,110,190,229"
	if(parseInt(obj.vmin)!=0) strkey+=",109,189"
  
	if(strkey.indexOf(key)==-1)//在允许符号内
		event.returnValue=false;
    else if((key=="110" || key=="190")&&obj.value.indexOf(".")>-1) //不重复.号
		event.returnValue=false;
	else if((key=="109" || key=="189")&&obj.value.indexOf("-")>-1){//不重复-号,如重复移去-号
	    obj.value=str.substr(1)
		event.returnValue=false;
	}
    else if(key=="109" || key=="189"){//-号处理,加在最前面
	    obj.value=str+"-"
		event.returnValue=false;
	}
	else if(str.indexOf("-")>0){//-号处理,不能在中间,如在中间则移去
	    obj.value=str.substr(1)
		event.returnValue=false;
	}
	
  try{
	var floatval=parseFloat(eval(str));
  }catch(err){
	alert("非法字符！");
	obj.value=str.substr(0,str.length-1);
  }
}
function IntInput1(obj){
	var str=obj.value;
 if(event.keyCode==18){
 alert("非法字符！");
 obj.value=str.substr(0,str.length);
 event.returnValue=false;
}
  key=event.keyCode.toString();
  /*
  var invalStr=["!","@","#","$","%","^","&","&","*","(",")"];
	var i=0;
	for( i=0;i<11;i++){
	 if(str.indexOf(invalStr[i])>=0){
	 obj.value=str.substr(0,str.length-1);
	 event.returnValue=false;
	 }
	}*/
  var strkey="8,9,37,39,46,48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105"

	if(parseInt(obj.vmin)!=0) strkey+=",109,189"

	if(key=="89" || strkey.indexOf(key)==-1) {//在允许符号内
		event.returnValue=false;
	}
	else if(key=="109"&&obj.value.indexOf("-")>-1){//不重复-号,如重复移去-号
	    obj.value=str.substr(1)
		event.returnValue=false;
	}
    else if(key=="109"||key=="189"){//-号处理,加在最前面
	    obj.value="-"+str
		event.returnValue=false;
	}
	else if(str.indexOf("-")>0){//-号处理,不能在中间,如在中间则移去
	    obj.value=str.substr(1)
		event.returnValue=false;
	}else if(key=="89"|| key=="90"){
	 obj.value=str.substr(1);
	 event.returnValue=false;
	}
	try{
	var floatval=parseInt(eval(str));
  }catch(err){
	alert("非法字符！");
	obj.value=str.substr(0,str.length-1);
  }
  }
      function chkNeed(_items){//看必填项是否已经填好
		var _objs = []; 
		for(var i=0;i<_items.length;i++){ 
			var _tmp = document.all[_items[i]]; 
			//alert(_tmp.options[_tmp.selectedIndex].text);
			if(_tmp.value!=undefined) 
				_tmp=[_tmp];
			_objs[i]=_tmp;
		}
		var _first;
		for(var i =0;i<_objs[0].length;i++){
			for(var j=0;j<_objs.length;j++){  
				var _current = _objs[j][i]; 
				if(_current.value==""){
					_current.style.border="red 1px solid";
					_first=_first||_current;
				}else{
					_current.style.border="silver 1px solid";
				}
			}
		}
		return _first;
	}
</script>