<%@ page import="org.codehaus.xfire.spring.SpringUtils" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>工作流定义修改</title>
    <link href="<%=request.getContextPath()%>/css/css.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
    <script charset="UTF-8" src="<%=request.getContextPath()%>/js/XiorkFlow/js/XiorkFlowWorkSpace.js"
            language="javascript"></script>
</head>

<body onload="init()" onselectstart="return false;" style="margin: 0px;overflow: hidden;">

<div id="designer" style="width: 100%;height: 100%;border: #e0e0e0 1px solid;"></div>
</body>
<script type="text/javascript">
    XiorkFlowWorkSpace.build();
    function init() {
        var xiorkFlow = new XiorkFlow(document.getElementById("designer"));
        document.body.onbeforeunload = function () {
            if (xiorkFlow.getWrapper().isChanged()) {
                //您对工作流程图的编辑尚未保存，离开该页面将退出系统!
                window.event.returnValue = "\u60a8\u5bf9\u5de5\u4f5c\u6d41\u7a0b\u56fe\u7684\u7f16\u8f91\u5c1a\u672a\u4fdd\u5b58\uff0c\u79bb\u5f00\u8be5\u9875\u9762\u5c06\u9000\u51fa\u7cfb\u7edf!";
            }
        };
        xiorkFlow.getToolBar().setButtonEnable(false);
        var getProcess = new GetProcess(xiorkFlow.getWrapper(), xiorkFlow.getTableViewer(), xiorkFlow.getToolBar());

        getProcess.getProcess("${name}");
    }
</script>
</html>
