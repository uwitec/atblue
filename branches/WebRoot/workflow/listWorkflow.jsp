<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>工作流定义维护列表</title>
    <link href="<%=request.getContextPath()%>/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/css/web.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/js/common.js"
            type="text/javascript" defer="true"></script>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="workflow_list.d" method="post">
<input type="hidden" name="flowId" value="${flowId}"/>
<input type="hidden" name="name" value=""/>
<table cellpadding="0" cellspacing="0" align="center" width="100%">
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
                       <td style="text-align: center" nowrap class="form_th" >
                           <s:property value="#status.index+1"/>
                       </td>
                       <td style="text-align: left" nowrap class="form_th">
                       <a href="#" onclick="doView('${FLOW_NAME}');"> ${FLOW_NAME}</a>
                      &nbsp;</td>
                       <%--<td style="text-align: left" nowrap>${FLOW_DESC}&nbsp;</td>--%>
                       <td style="text-align: center" nowrap class="form_th">
                               ${CREATE_TIME}&nbsp;
                       </td>
                       <td style="text-align: center" nowrap class="form_th">${UPDATE_TIME}&nbsp;</td>
                       <td style="text-align: center" nowrap class="form_th">${RELEASE_STATUS}&nbsp;</td>
                       <td style="text-align: center" nowrap class="form_th">
                           <%
                                String status = StringUtil.parseNull(request.getAttribute("RELEASE_STATUS"),"");
                               if(!"已发布".equals(status)){
                           %>
                           <input  type="button" class="button" onClick="doEdit('${FLOW_NAME}');" value="修改">
                           <input  type="button" class="button" onClick="doDelete('${FLOW_ID}');" value="删除">
                           <input  type="button" class="button" onClick="doRelease('${FLOW_ID}');" value="发布">
                           <%   }else{  %>
                           <input  type="button" class="button" onClick="doEdit('${FLOW_NAME}');" value="修改">
                           <input  type="button" class="button" onClick="doReRelease('${FLOW_ID}');" value="重新发布">
                           <% }
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
function doView(name) {
    document.all.name.value = name;
    document.forms[0].action = "workflow_view.d";
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
function doReRelease(id){
    var release = confirm("确认需要重新发布该流程吗?发布后原来的流程都会受影响。");
    if(release) {
        window.location = "workflow_rerelease.d?flowId="+id;
    }
}
</script>
</body>
</html>