<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<link href="<%=request.getContextPath() %>/css/css.css" type="text/css" rel="stylesheet"/>
<title>签批单表单列表</title>
</head>
<body>        
<form name="listQpd" method="post" action="" onsubmit="formTrim();">
<table width="60%" border="0" cellpadding="0" cellspacing="0" class="" align="center">
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgdh">
			<tr>
			  <td width="">
                    <input class="button"  style="width:40px" type="Button" onclick="doAdd();"  value="添加" />
					<input class="button" style="width:40px" type="Button" onclick="doMod();" value="修改" />
					<input class="button" style="width:40px" type="Button" onclick="doDel();"   value="删除" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="form_th" >
				<tr>
					<td class="tdadd">表单名称：</td>
					<td class="tdadd"><input type="text" name="formName" value="${formName}"/></td>
					<td align="right"><input class="button" name="query" style="width:40px"  type="button" value="查询" onclick="doQuery();"></td>
				</tr>
			</table>
		</td>
	</tr>		
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tab_id" name="tab_id" class="mtabtab" style="BORDER-COLLAPSE: collapse">
			<tr id="tr_head">
				<th class="head"><div align="center"><strong>序号</strong></div></th>
				<th class="head"><div align="center"><strong>表单名称</strong></div></th>
				<th class="head"><div align="center"><strong>表单标题</strong></div></th>
				<th class="head"><div align="center"><strong>录入时间</strong></div></th>
			</tr>
			<s:iterator value="dataList" status="status" >
				<tr onclick="setSelected(this,'tab_id','tr_head','${FORM_ID}')">
					<td class="form_th" nowrap style="text-align: center; width: 50px;"><s:property value="#status.index+1"/></td>
					<td class="form_th" nowrap style="text-align: left">${FORM_NAME}</td>
					<td class="form_th" nowrap style="text-align: left">${FORM_TITLE}</td>
					<td class="form_th" nowrap style="text-align: left">${LRSJ}</td>
				</tr>
			</s:iterator>
		</table>
		</td>
	</tr>
     <tr><td colspan="11" align="center">
	    <!-- 分页组件 -->      
     	<tags:pagination />
    </td></tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<script>

function doQuery(){
	document.forms[0].action = "qpd_list.d";
	document.forms[0].submit();
}

function doAdd(){
	self.location.href="qpd_add.d";
}

function doMod(){
	if(getSelected()){
		self.location.href="qpd_mod.d?formId="+selectedId;
	}
}

function doDel(){
	if(getSelected()){
		if(confirm("确定要删除吗？")){
			window.location.href = "qpd_del.d?formId="+selectedId;
		}
	}
}

function formTrim(){
	document.forms[0].userName.value = trim(document.forms[0].userName.value);
}

function trim(str1){
	var strSource,strDest="";
	var i=0,iLength=0;
	strSource=str1.toString();
	strDest=strSource;
	iLength=strSource.length;
	for(i=0;i<=iLength-1&&strSource.substr(i,1)==" ";i++)
	{
		strDest=strSource.substr(i);
	}
	if(strDest.substr(0,1)==" ") strDest=strDest.substr(1);
	strSource=strDest;
	iLength=strSource.length;
	for(i=iLength-1;i>=0&&strSource.substr(i,1)==" ";i--)
	{
		strDest=strSource.substr(0,i);
	}
	return(strDest);
}
//选中的行变量
var selectedId = null;

//设置某个表的某一行被选中
function setSelected(tr,tab_id,tr_head,selectedId_,rowClass,curClass){

    //循环表格中所有的行
    var tab = document.getElementById(tab_id);
    if(tab){
        for(var i=0;i<tab.rows.length;i++){
            var row = tab.rows[i];
            //除去表头
            if(row.id != tr_head){
                if(rowClass){
                    row.style.background = rowClass;
                }else{
                    row.style.background = "white";
                }
            }
        }
    }
    if (curClass) {
        tr.style.background = curClass;
    } else {
        tr.style.background = "#fff4a8";
    }
    selectedId = selectedId_;
}

function getSelected(){
    if(null == selectedId){
        alert("请选择您要操作的项目！");
        return false;
    }else{
        return true;
    }
}
</script></form>
</body>
</html>
