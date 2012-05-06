<%@ page import="org.codehaus.xfire.spring.SpringUtils" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>工作流定义查看</title>
    <link href="<%=request.getContextPath()%>/css/css.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
    <script charset="UTF-8" src="<%=request.getContextPath()%>/js/XiorkFlow/XiorkFlowWorkSpace.js"  language="javascript"></script>
</head>
<body onload="init()" onselectstart="return false;" style="margin: 0px;overflow: hidden;">
<div id="designer" style="width: 100%;height: 100%;border: #e0e0e0 1px solid;"></div>
</body>
<script type="text/javascript">
    XiorkFlowWorkSpace.build();
    function init() {
        var xiorkFlowViewPattern = new XiorkFlowViewPattern(Toolkit.getElementByID("designer"));
        xiorkFlowViewPattern.getWrapper().getModel().setEditable(false);
        var getProcess = new GetProcess(xiorkFlowViewPattern.getWrapper(), xiorkFlowViewPattern.getTableViewer(), xiorkFlowViewPattern.getToolBar());
        getProcess.getProcess("${name}");
    }
</script>
</html>
