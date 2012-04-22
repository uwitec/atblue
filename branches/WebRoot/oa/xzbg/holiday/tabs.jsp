<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
 	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>机笼信息</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/ext/resources/css/ext-all.css" />
    <link id="theme" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/ext/resources/css/xtheme-gray.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/ext/ext-all.js"></script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script type="text/javascript">
//定义主框架中tab控件
var tabpanel;

Ext.onReady(function(){
	tabpanel = new Ext.TabPanel({
	   region:'center',
	   renderTo: document.body,
	   enableTabScroll:true,
	   activeTab:0,
	   items:[
	   {
	       'id': '待审批',
	       autoScroll: true,   //溢出时显示滚动条
	       'title': '待审批', //tab标签的标题
	       closable: false,     //允许关闭
	       //通过html载入目标页
	       html: '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="wait.jsp"  name="frame"></iframe>'
	   } ,
	{
	    'id': '已审批',
	    autoScroll: true,   //溢出时显示滚动条
	    'title': '已审批', //tab标签的标题
	    closable: false,     //允许关闭
	    //通过html载入目标页
	        html: '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="already.jsp"  name="frame" id="frame" ></iframe>'
	}
       ]
    });
    tabpanel.on('activate', function() {
        var selid = tabpanel.getActiveTab().getId();
    });
    var viewport = new Ext.Viewport({
        layout: 'border',           //布局类型
        items: [tabpanel]         //items
    });

});
</script>
<%--<div id="content">--%>
    <%--<iframe scrolling="auto" name="contentframe"   frameborder="0" width="100%" height="100%" src ="" />--%>
<%--</div>--%>
</body>
</html>
