<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="WEB-INF/runqianReport4.tld" prefix="report" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Test jsp.
	<report:html
           name="rpt"
           saveAsName="test"
           reportFileName="/JspPluginDemo_1.0.0/test.raq"
           params=""
           width="-1"
           height="-1"
           needScroll="yes"
    />
</body>
</html>