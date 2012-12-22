<%@ page import="java.net.InetAddress" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../import.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>电子签章维护列表</title>
    <link href="<%=request.getContextPath()%>/images/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/web.css" type="text/css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/js/common.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        function SetStore() {
            var separator = "::";  // 分隔符
            document.all.DWebSignSeal.SetSignData("-");
            document.all.DWebSignSeal.SetSignData("+DATA:");
        }
        function LoadSignData() {
            var separator = "::";  // 分隔符
            DWebSignSeal.ShowWebSeals();
            var strObjectName ;
            strObjectName = DWebSignSeal.FindSeal("",0);
            while(strObjectName  != ""){
                DWebSignSeal.SetSealSignData(strObjectName);
                strObjectName = DWebSignSeal.FindSeal(strObjectName,0);
            }
        }
        function addSealB(userid){
            var sealURL='<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+"/"+request.getContextPath()+"/servlet/sealDown?userId="%>'+userid;
            document.all.DWebSignSeal.DelSeal("");
            document.all.DWebSignSeal.SetPosition(60,-40,"seal");
            document.all.DWebSignSeal.AddSeal(sealURL, "");
        }
    </script>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="seal_list.d" method="post">
    <input type="hidden" name="flowId" value="${flowId}"/>
    <input type="hidden" name="sealId" value=""/>
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
                                用户姓名：
                                <input type="text" name="realName" value="${realName}"  class="textinput" />&nbsp;&nbsp;&nbsp;&nbsp;
                                用户名：
                                <input type="text" name="userName" value="${userName}" class="textinput" />&nbsp;&nbsp;&nbsp;&nbsp;
                                单位：
                                <select name="orgnaId" id="orgnaId" style="width:160px;" value="">
                                    <option value="">请选择</option>
                                    <s:iterator value="orgTreeList">
                                        <option value="${ORGNA_ID}">${ORGNA_NAME}</option>
                                    </s:iterator>
                                </select>
                                &nbsp;&nbsp;<input type="submit" class="button" style="width:50px" onClick="doQuery();" value="查询">
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
                        <td style="text-align: right">
                            <input id="lookBut" name="lookBut" type="button" class="button" style="width:50px"  onClick="doAdd();" value="新建">
                            <input id="editBut" name="editBut" type="button" class="button" style="width:50px" onClick="doEdit();" value="修改">
                            <input id="deleteBut" name="deleteBut" type="button" class="button" style="width:50px" onClick="doDelete();" value="删除">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" id="tab_id" align="center" cellpadding="0" cellspacing="0" class="mtabtab">
                    <tr class="form_th">
                        <th width="2%" nowrap="nowrap" class="head">序号</th>
                        <th class="head">用户姓名</th>
                        <th class="head">用户名</th>
                        <th class="head">用户单位</th>
                        <th class="head">查看印章</th>
                    </tr>
                    <s:iterator value="dataList" status="status">
                        <tr onclick="setSelected(this,'tab_id','tr_head','${SEAL_ID}')">
                            <td class="form_th" style="text-align: center;border-left: 1px solid #01a0fe;" nowrap>
                                <s:property value="#status.index+1"/>
                            </td>
                            <td class="form_th" style="text-align: left" nowrap>${REAL_NAME}&nbsp;</td>
                            <td class="form_th" style="text-align: left" nowrap>${USER_NAME}&nbsp;</td>
                            <td class="form_th" style="text-align: left" nowrap>
                                    ${ORGNA_NAME}&nbsp;
                            </td>
                            <td class="form_th" style="text-align: center" nowrap>
                                <input type="button" class="button" value="查看印章" onClick="addSealB('${USER_ID}')"/>&nbsp;</td>
                        </tr>
                    </s:iterator>
                </table>
            </td>
        </tr>
    </table>
    <table id="itable" align="center" width="100%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#A5CAFE" bordercolordark="#FFFFFF">
        <tr>
            <td align="right" nowrap="nowrap"><div align="center">预览签名</div></td>
        </tr>
        <tr>
            <td id="seal" style="height:100px">&nbsp;
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>
<script type="text/javascript">
    function doAdd(){
        document.forms[0].action = "seal_add.d";
        document.forms[0].submit();
    }
    function doEdit() {
        if(getSelected()) {
            document.all["sealId"].value = selectedId;
            document.forms[0].action="seal_mod.d";
            document.forms[0].submit();
        }
    }

    function doDelete() {
        if(getSelected()) {
            var del = confirm("确认删除该条记录吗?");
            if(del) {
                document.all["sealId"].value = selectedId;
                document.forms[0].action="seal_del.d";
                document.forms[0].submit();
            }
        }
    }
</script>
</body>
</html>