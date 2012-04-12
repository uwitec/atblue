<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>工作流定义维护列表</title>
    <link href="<%=request.getContextPath()%>/css/css.css" type="text/css" rel="stylesheet"/>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="workflow_list.d" method="post">
<input type="hidden" name="flowId" value="${flowId}"/>
<input type="hidden" name="name" value=""/>
<table cellpadding="0" cellspacing="0" align="center" width="80%">
    <tr>
      <td>
		<FIELDSET style="HEIGHT: 0px; OVERFLOW: visible" class=GroupBox>
			<LEGEND class=GroupBoxTitle>
				<TABLE>
					<TBODY>
						<TR>
							<TD>
								<LABEL style="WIDTH: 100%; WHITE-SPACE: nowrap; HEIGHT: 100%">
									查询条件
								</LABEL>
							</TD>
							<TD>
								<IMG class=GroupBoxExpandButton
									src="<%=request.getContextPath()%>/images/groupbox_expand.gif">
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</LEGEND>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			    <td style="text-align: left">
			    	名称：
			    	<input type="text" name="flowName" value="${flowName}" style="width:200px;" class="textinput" />
			    	&nbsp;&nbsp;<input name="selectBut" type="button" class="button" style="width:50px" onClick="doQuery();" value="查询">
                    &nbsp;&nbsp;<input id="lookBut" name="lookBut" type="button" class="button" style="width:50px"  onClick="doAdd();" value="新建">
                </td>
			  </tr>
			</table>
		</FIELDSET>      
		</td>
    </tr>
    <tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			  	<td style="text-align: left">
                      <tags:DataPilot/>
			  	</td>

			  </tr>
			</table>
		</td>
    </tr>    
	<tr>
      	<td>
      		<table width="100%" id="tab_id" align="center" cellpadding="0" cellspacing="0" class="mtabtab">
			    <tr class="form_th">
			    	<th width="2%" nowrap="nowrap">序号</th>
			        <th>工作流名称</th>
			        <%--<th>工作流描述</th>--%>
                    <th>创建时间</th>
			        <th>更新时间</th>
			        <th>状态</th>
			        <th>操作</th>
			    </tr>
			   <s:iterator value="dataList" status="status">
                   <tr onclick="setSelected(this,'tab_id','tr_head','${FLOW_NAME}','${FLOW_ID}')">
                       <td style="text-align: center" nowrap>
                           <s:property value="#status.index+1"/>
                       </td>
                       <td style="text-align: left" nowrap>${FLOW_NAME}&nbsp;</td>
                       <%--<td style="text-align: left" nowrap>${FLOW_DESC}&nbsp;</td>--%>
                       <td style="text-align: center" nowrap>
                               ${CREATE_TIME}&nbsp;
                       </td>
                       <td style="text-align: center" nowrap>${UPDATE_TIME}&nbsp;</td>
                       <td style="text-align: center" nowrap>${RELEASE_STATUS}&nbsp;</td>
                       <td style="text-align: center" nowrap>
                           <%
                                String status = StringUtil.parseNull(request.getAttribute("RELEASE_STATUS"),"");
                               if("尚未发布".equals(status)){
                           %>
                           <input  type="button" class="button" onClick="doEdit('${FLOW_NAME}');" value="修改">
                           <input  type="button" class="button" onClick="doDelete('${FLOW_ID}');" value="删除">
                           <input  type="button" class="button" onClick="doRelease('${FLOW_ID}');" value="发布">
                           <%   }
                           %>

                           &nbsp;</td>
                   </tr>
			    </s:iterator>
			</table>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
function doAdd(){
   	document.forms[0].action = "workflow_add.d";
	document.forms[0].submit();
}
function doQuery() {
	document.forms[0].submit();
}

//选中的行变量
var selectedId = null;
var selectedId1 = null;

//设置某个表的某一行被选中
function setSelected(tr,tab_id,tr_head,selectedId_,selectedId_2,rowClass,curClass){
	
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
    selectedId2 = selectedId_2;
}

function getSelected(){
	if(null == selectedId){
		alert("请选择您要操作的项目！");
	    return false;
	}else{
		return true;
	}
}

function doEdit(name) {
        document.all.name.value = name;
        document.forms[0].action = "workflow_mod.d";
        document.forms[0].submit();
}

function doDelete(id) {
		var del = confirm("确认删除该条记录吗?");
		if(del) {
            window.location = "workflow_del.d?flowId="+id;
		}
}
function doRelease(id){
    var release = confirm("确认需要发布该流程吗?发布后不能进行修改和删除操作。");
    if(release) {
        window.location = "workflow_release.d?flowId="+id;
    }
}
</script>
</body>
</html>