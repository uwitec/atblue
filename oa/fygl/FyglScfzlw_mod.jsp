<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../import.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
CUser cUser = (CUser)session.getAttribute("cUser");
cUser = cUser == null?new CUser():cUser;
String orgId = cUser.getOrgnaId();
Map paramMap = new HashMap();
paramMap.put("orgnaId",orgId);
COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
    <script type="text/javascript" charset="GB2312"
            src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>

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
            document.form1.submit();
        }
    </script>
</head>
<body onload="_resizeNoPage();">
<form action="FyglScfzlw_save.d" name="form1" method="post">
    <input type="hidden" name="action" value="save"/>
    <input type="hidden" name="scfzlwbm" value="<s:property value="scfzlwbm"/>"/>
    <input type="hidden" name="bean.scfzlwbm" value="<s:property value="bean.scfzlwbm"/>"/>
    <table width="100%" height="25" border="0" cellpadding="0"
           cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
                     height="11">
            </td>
            <td width="15%" class="mhead">
                修改生产辅助劳务
            </td>
            <td width="74%" align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <input type="submit" class="button" id="button"
                                   value="保存">
                            &nbsp;
                            <input type="button" class="button" id="button1"
                                   onclick="history.back()" value="返回">
                            &nbsp;
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <%--固定表头DIV--%>
                <div id="scrollDiv"
                     style="width: 1000px; overflow: auto; cursor: default; display: inline; position: absolute; height: 200px;">
                    <table width="100%" border="0" align="center" cellpadding="0"
                           cellspacing="0" class="mtabtab" id="mtabtab">

                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                月度
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.yd" value="<s:property value="bean.yd"/>"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM'})"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                单位
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.dw" value="<s:property value="bean.dw"/>"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                日常运费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.rcyf" value="<s:property value="bean.rcyf"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                固定车辆
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gdcl" value="<s:property value="bean.gdcl"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                修理费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.xlf" value="<s:property value="bean.xlf"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                安技费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.ajf" value="<s:property value="bean.ajf"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>

                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                板房维修
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.bfwx" value="<s:property value="bean.bfwx"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                平板劳务
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.pblw" value="<s:property value="bean.pblw"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                外部劳务费
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.wblwf" value="<s:property value="bean.wblwf"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                软化水
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.rhs" value="<s:property value="bean.rhs"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                奥凯龙劳务
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.akllw" value="<s:property value="bean.akllw"/>" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>

                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                备注
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                <textarea rows="5" cols="40" style="width: 100%" name="bean.bz"><s:property value="bean.bz"/></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>

    </table>
</form>
</body>
</html>
