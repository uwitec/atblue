<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ include file="../../import.jsp"%>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("orgnaId",orgId);
    COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
    cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
	if (request.getMethod().equals("POST")) {
        String FZBM = StringUtil.parseNull(request.getParameter("FZBM"),"");
        String JD = StringUtil.parseNull(request.getParameter("JD"),"");
        String FYMC = StringUtil.parseNull(request.getParameter("FYMC"),"");
        String FYXM = StringUtil.parseNull(request.getParameter("FYXM"),"");
        String XMMX = StringUtil.parseNull(request.getParameter("XMMX"),"");
        String XHGZ = StringUtil.parseNull(request.getParameter("XHGZ"),"");
        String DW = StringUtil.parseNull(request.getParameter("DW"),"");
        String DJ = StringUtil.parseNull(request.getParameter("DJ"),"");
        String DJ2 = StringUtil.parseNull(request.getParameter("DJ2"),"");
        String SL = StringUtil.parseNull(request.getParameter("SL"),"");
        String YJFY = StringUtil.parseNull(request.getParameter("YJFY"),"");
        String DJYJ = StringUtil.parseNull(request.getParameter("DJYJ"),"");
        String TJFWCS1 = StringUtil.parseNull(request.getParameter("TJFWCS1"),"");
        String YWZRZ1 = StringUtil.parseNull(request.getParameter("YWZRZ1"),"");
        String TJFWCS2 = StringUtil.parseNull(request.getParameter("TJFWCS2"),"");
        String YWZRZ2 = StringUtil.parseNull(request.getParameter("YWZRZ2"),"");
        String FSYF = StringUtil.parseNull(request.getParameter("FSYF"),"");
        String BZ = StringUtil.parseNull(request.getParameter("BZ"),"");
        String flag = StringUtil.parseNull(request.getParameter("flag"),"");
        JyglYjhfy bean = new JyglYjhfy();
        bean.setSqid(StringUtil.getUUID());
        bean.setFzbm(FZBM);
        bean.setJd(JD);
        bean.setFymc(FYMC);
        bean.setFyxm(FYXM);
        bean.setXmmx(XMMX);
        bean.setXhgz(XHGZ);
        bean.setDw(DW);
        if(!StringUtil.isBlankOrEmpty(DJ))
            bean.setDj(Double.valueOf(DJ.trim()));
        if(!StringUtil.isBlankOrEmpty(DJ2))
            bean.setDj(Double.valueOf(DJ2.trim()));
        if(!StringUtil.isBlankOrEmpty(SL))
            bean.setSl(Double.valueOf(SL.trim()));
        if(!StringUtil.isBlankOrEmpty(YJFY))
            bean.setYjfy(Double.valueOf(YJFY.trim()));
        bean.setDjyj(DJYJ);
        bean.setTjfwcs1(TJFWCS1);
        bean.setTjfwcs2(TJFWCS2);
        bean.setYwzrz1(YWZRZ1);
        bean.setYwzrz2(YWZRZ2);
        bean.setFsyf(FSYF);
        bean.setBz(BZ);
        bean.setSqzt("已保存");
        bean.setSqr(cUser.getUserId());
        bean.setSqsj(new java.util.Date());
        if("startup".equals(flag)){
            bean.setSqzt("已申请");
            //创建流程代码在这里
//            Status status = workflow.startWorkflow("f0819b2e-e86e-489f-be89-85f997fcfd93",cUser.getUserId());
            Status status = workflow.startWorkflow("9a847e46-bbd0-42b7-a8c7-57a88d384b07",cUser.getUserId());
            bean.setProcessId(status.getProcessId());
            bean.setConnectId(status.getConnectId());
        }
        jyglYjhfyDAO.addJyglYjhfy(bean);
%>
		<script>
		    window.location='index.jsp';
		</script>
<%	}%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/images/css.css" rel="stylesheet"  type="text/css">
		<link href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" charset="GB2312"
			src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="true"></script>

		
		<script type="text/javascript">
            function _resizeNoPage() {
                document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
                document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
            }
			function checkForm(){
                if(document.form1.FZBM.value==""){
                    document.form1.FZBM.focus();
                    alert("请输入负责部门");
                    return;
                }
                if(document.form1.JD.value==""){
                    document.form1.JD.focus();
                    alert("请输入季度");
                    return;
                }
                if(document.form1.FYMC.value==""){
                    document.form1.FYMC.focus();
                    alert("请输入费用名称");
                    return;
                }
				document.form1.submit();
			}
            function startup(){
                if(document.form1.FZBM.value==""){
                    document.form1.FZBM.focus();
                    alert("请输入负责部门");
                    return;
                }
                if(document.form1.JD.value==""){
                    document.form1.JD.focus();
                    alert("请输入季度");
                    return;
                }
                if(document.form1.FYMC.value==""){
                    document.form1.FYMC.focus();
                    alert("请输入费用名称");
                    return;
                }
                document.all.flag.value="startup";
                document.form1.submit();
            }
		</script>

	</head>
	<body onload="_resizeNoPage();">
		<form action="add.jsp" name="form1" method="post">
            <input type="hidden" name="flag" value=""/>
			<table width="100%" height="25" border="0" cellpadding="0"
				cellspacing="0"
				background="<%=request.getContextPath()%>/images/mhead.jpg">
				<tr>
					<td width="3%" align="center">
						<img src="<%=request.getContextPath()%>/images/mlogo.jpg" width="11"
							height="11">
					</td>
					<td width="15%" class="mhead">
						新建预计划费用申请单
					</td>
					<td width="74%" align="left" class="mhead">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										<input type="button" class="button" id="button"
											onclick="checkForm();" value="保存">
										&nbsp;
                                        <input type="button" class="button"
                                               onclick="startup();" value="创建流程并启动">
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
									<td nowrap="nowrap" width="200" class="head_left">
                                        负责部门<span style="color: red">&nbsp;*</span>
									</td>
									<td class="head_right" style="text-align: left">
                                        <input type="text" name="FZBM" value=""  style="width:100%"/>
									</td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        季度<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="JD" value=""  style="width:100%"/>
                                    </td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用名称<span style="color: red">&nbsp;*</span>
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FYMC" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        费用项目
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FYXM" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        项目明细
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <textarea rows="4" cols="20" name="XMMX" style="width:100%"></textarea>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        型号规格
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="XHGZ" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单位
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DW" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DJ" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        单价（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DJ2" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        数量
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="SL" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        预计费用（万元）
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YJFY" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        定价依据
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="DJYJ" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TJFWCS1" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YWZRZ1" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        推荐服务厂商
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="TJFWCS2" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        有无市场准入证
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="YWZRZ2" value=""  style="width:100%"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        发生月份
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <input type="text" name="FSYF" value=""  style="width:100%"/>
                                    </td>
                                    <td nowrap="nowrap" width="200" class="head_left">
                                        备注
                                    </td>
                                    <td class="head_right" style="text-align: left">
                                        <textarea rows="4" cols="20" name="BZ" style="width:100%"></textarea>
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