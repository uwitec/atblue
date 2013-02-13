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
<form action="FyglDjsrjzc_save.d" name="form1" method="post">
    <input type="hidden" name="action" value="add"/>
    <table width="100%" height="25" border="0" cellpadding="0"
           cellspacing="0"
           background="<%=request.getContextPath()%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
                     height="11">
            </td>
            <td width="15%" class="mhead">
                新建单井收入及成本支出
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
                                类别
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                  <select name="bean.yd">
                                      <option value="完成井">完成井</option>
                                      <option value="当月结算井">当月结算井</option>
                                      <option value="未结井">未结井</option>
                                  </select>
                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                井号
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.dfdw" value=""/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                队号
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.jdfwfy" value=""/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                交井日期
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.fwzlpj" value="" class="Wdate" onClick="WdatePicker()"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                结算日期
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.kk" value="" class="Wdate" onClick="WdatePicker()"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                实际周期
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.sjfy" value=""/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                迁装费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.qzfsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                迁装费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.qzfzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                工农费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gnfsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                工农费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gnfzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                井架费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.jjfsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                井架费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.jjfzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                土方费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tffsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                土方费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tffzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                钻前工农费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.zqgnsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                钻前工农费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.zqgnzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                拉工业用水收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gyyssr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                拉工业用水支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gyyszc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                钻后治理收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.zhzlsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                钻后治理支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.zhzlzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                机械费用收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.jxfysr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                机械费用支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.jxfyzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                管具井控收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjjksr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                管具井控支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjjkzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                管具钻具收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjzjsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                管具钻具支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjzjzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                套管收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tgsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                套管支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tgzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                套管头收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tgtsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                套管头支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.tgtzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                管具材料收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjclsr1" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                管具材料支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjclzc1" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                固井材料收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjclsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                固井材料支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjclzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                固井劳务收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjlwsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                固井劳务支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.gjlwzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                石粉收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.sfsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                石粉支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.sfzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                定向费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.dxfsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                定向费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.dxfzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                泥浆服务费收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.njfwsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>


                            <td nowrap="nowrap" width="120" class="head_left">
                                泥浆服务费支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.njfwzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                其他技术服务收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.qtjssr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                其他技术服务支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.qtjszc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                钻头收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.ztsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                钻头支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.ztzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                化工材料收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.hgclsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                化工材料支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.hgclzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                一般材料收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.ybclsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                一般材料支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.ybclzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                柴油收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.cysr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                柴油支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.cyzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                原油收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.yysr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                原油支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.yyzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                油料运费及劳务收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.yljlwsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                油料运费及劳务支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.yljlwzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                网电及劳务收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.wdjlwsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                网电及劳务支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.wdjlwzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                润滑油收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.rhysr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                润滑油支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.rhyzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                追加费用
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.zjfy" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                其他收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.qtsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                非正常开支
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.fzckz" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                单井收入
                            </td>
                            <td class="head_right" align="left" style="text-align: left">
                                    <input type="text" name="bean.djsr" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>

                            <td nowrap="nowrap" width="120" class="head_left">
                                单井支出
                            </td>
                            <td class="head_right" align="left" style="text-align: left" colspan="3">
                                    <input type="text" name="bean.djzc" value="" onKeyPress="if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>

                            </td>
                        </tr>

                        <tr>
                            <td nowrap="nowrap" width="120" class="head_left">
                                备注
                            </td>
                            <td class="head_right" align="left" style="text-align: left" colspan="5">
                                <textarea rows="5" cols="40" style="width: 100%" name="bean.bz"></textarea>
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
