<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../import.jsp"%>
<jsp:useBean id="pageBean" class="cn.com.atblue.common.bean.PageBean"
	scope="page">
	<jsp:setProperty name="pageBean" property="*" />
</jsp:useBean>
<%
    CUser cUser = (CUser)session.getAttribute("cUser");
    String curRole = request.getParameter("curRole");
    String kssj = request.getParameter("kssj")==null?DateUtil.format(DateUtil.addDate(DateUtil.getDate(),-20),"yyyy-MM-dd"):request.getParameter("kssj");
    String jssj = request.getParameter("jssj")==null?DateUtil.format(DateUtil.addDate(DateUtil.getDate(),0),"yyyy-MM-dd"):request.getParameter("jssj");
    cUser = cUser == null?new CUser():cUser;
    String orgId = cUser.getOrgnaId();
    Map paramMap = new HashMap();
    paramMap.put("roleflag",curRole);
    paramMap.put("sqr",cUser.getUserId());
    paramMap.put("kssj",kssj);
    paramMap.put("jssj",jssj);
	pageBean.setPageSize(pageSize);
	int totalRow =officeHolidayDAO.getPagedCount(paramMap); 
	pageBean.setTotalRows(totalRow); 
	List list = officeHolidayDAO.getPagedList(pageBean,paramMap);
	String formId="";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <script src="<%=request.getContextPath()%>/js/common.js"
                type="text/javascript" defer="defer"></script>
        <link href="<%=contentPath%>/css/css.css" rel="stylesheet" type="text/css">
        <link href="<%=contentPath%>/images/css.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" charset="GB2312"
                src="<%=request.getContextPath()%>/js/date/WdatePicker.js" defer="defer"></script>
		<script type="text/javascript">
		function onDelete(url){
			if(window.confirm("确认删除该会议申请?")){
				window.location=url;
			}
			return;
		}
        function tj(sid,pid,cid,id){
            var selUserId = document.getElementsByName(id+"nextUserId")[0].value;
            if(selUserId == null || selUserId == ''){
                alert("请先选择进行审批的用户！");
                document.all[id+"nextUserId"].focus();
                return ;
            }
            window.location = "tj.jsp?selUserId="+selUserId+"&connectId="+cid+"&documentid="+sid+"&processId="+pid+"&varValue=1"+"&holidayid="+sid;
        }
        function qz(formId,processId,connectId,holidayid){
            window.open(
                    "<%=request.getContextPath()%>/oa/qpd/view.jsp?formId="+formId+"&curRole=<%=curRole%>&connectId="+connectId+"&processId="+processId+"&holidayid="+holidayid,
                    "mywindow",
                    "height="
                            + 500
                            + ",width="
                            + 700
                            + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                            + 0
                            + ",left="
                            + 0
                            + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
        }
        function xj(id,role){
            if(confirm("确定要进行销假？")){
                window.location = "xj.jsp?holidayid="+id+"&curRole="+role;
            }
        }
         function qz1(formId,processId,connectId,holidayid){
                window.open(
                        "<%=request.getContextPath()%>/oa/qpd/qpd.jsp?formId="+formId+"&connectId="+connectId+"&processId="+processId+"&holidayid="+holidayid,
                        "mywindow",
                        "height="
                                + 500
                                + ",width="
                                + 700
                                + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                                + 0
                                + ",left="
                                + 0
                                + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
            }
         function print(processId,connectId,holidayid,roleFlag,sfbr){
            var formId= "";
            if("1" == roleFlag&&"1"==sfbr){
                formId="95cd282c-0a52-443f-82f8-9939d954af54";
            }else if("1" == roleFlag&&"0"==sfbr){
                formId="7e7220a8-1423-4db5-b4ee-90ef33b0c0ab";
            }else if("2" == roleFlag&&"1"==sfbr){
                formId="78c3cf78-a89a-4103-8d88-59578ce0fea7";
            }else if("2" == roleFlag&&"0"==sfbr){
                formId="e39db318-02c6-474e-a4cb-21f8914cb900";
            }
            window.open(
                    "./ybgbqpd.jsp?formId="+formId+"&curRole="+roleFlag+"&connectId="+connectId+"&processId="+processId+"&holidayid="+holidayid,
                    "mywindow",
                    "height="
                            + 500
                            + ",width="
                            + 700
                            + ",status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="
                            + 0
                            + ",left="
                            + 0
                            + ",resizable=yes,modal=yes,dependent=yes,dialog=yes,minimizable=no");
        }
		</script>
	</head>
	<body>
    <form name="form1" action=""  style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
    <input type="hidden" name="curRole" value="<%=curRole%>">
    <table width="100%" align="center" height="25" border="0"
           cellpadding="0" cellspacing="0"
           background="<%=contentPath%>/images/mhead.jpg">
        <tr>
            <td width="3%" align="center">
                <img src="<%=contentPath%>/images/mlogo.jpg" width="11" height="11"
                     alt="">
            </td>
            <td width="15%" class="mhead">
                 请销假审批
            </td>
            <td align="left" class="mhead">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td align="left">
                            <font style="font-size: 14px">外出时间
                        <input type="text" name="kssj" class="Wdate" onClick="WdatePicker()" value="<%=kssj %>">
						至
						<input type="text" name="jssj" class="Wdate" onClick="WdatePicker()" value="<%=jssj%>">
                            <input type="submit" class="button"  style="width:40px" value='查询'> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" onclick="window.location = 'add.jsp?curRole=<%=curRole%>';" style="width:40px"  value='新增'>
                        </td>  </font>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
        </form>
		<table width="100%" align="center" height="25" border="0"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="mtabtab" id="tab_id">
						<tr class="form_th">
							<th nowrap="nowrap"  width="40">
								序号
							</th>
							<th nowrap="nowrap" >
								姓名
							</th>
							<th  nowrap="nowrap">
								单位
							</th>
							<th  nowrap="nowrap">
								外出时间
							</th>
							<th  nowrap="nowrap">
								外出地点
							</th>
							<th  nowrap="nowrap">
								外出事由
							</th>
                            <th  nowrap="nowrap">
								销假时间
							</th>
                            <th nowrap="nowrap" >
                                状态
                            </th>
							<th nowrap="nowrap" >
								操作
							</th>
						</tr>
						<%
							for (int i = 0; i < list.size(); i++) {
								Map map = (Map) list.get(i);
								String sfbr = map.get("SFBR")+"";
								String roleFlag = StringUtil.parseNull(map.get("ROLEFLAG"),"");
								if("1".equals(curRole)&&"1".equals(sfbr)){//基层正职干部请销假
									formId="95cd282c-0a52-443f-82f8-9939d954af54";
								}else if("1".equals(curRole)&&"0".equals(sfbr)){ //基层干部职工请销假
									formId="7e7220a8-1423-4db5-b4ee-90ef33b0c0ab";
								}else if("2".equals(curRole)&&"1".equals(sfbr)){ //机关科室长请销假
									formId="78c3cf78-a89a-4103-8d88-59578ce0fea7";
								}else if("2".equals(curRole)&&"0".equals(sfbr)){ //机关普通干部请销假
									formId="e39db318-02c6-474e-a4cb-21f8914cb900";
								}

						%>
						<tr onclick="setSelected(this,'tab_id','tr_head','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>')">
							<td  align="center">
								<%=pageBean.getPageSize()
						* (pageBean.getCurrentPage() - 1) + i + 1%>
							</td>
							<td  align="center" style="text-align: left">
								<a href="view.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>"><%=StringUtil.parseNull(map.get("XM"),"") %></a>
							</td>
							<td  align="center">
								<%=StringUtil.parseNull(map.get("DW"),"")%>&nbsp;
							</td>
							<td  align="center">
								<%=map.get("KSSJ")+"至"+map.get("JSSJ")%>&nbsp;
							</td>
							<td  align="left" style="text-align: left">
                                <%=StringUtil.parseNull(map.get("WCDD"),"")%>&nbsp;
							</td>
							<td  align="left" style="text-align: left">
								<%=StringUtil.parseNull(map.get("WCSY"),"")%>&nbsp;
							</td>
                            <td  align="left" style="text-align: center">
                                <%=StringUtil.parseNull(map.get("XJSJ"),"")%>&nbsp;
                            </td>
                            <td  align="center" nowrap="nowrap">
                                <%String sqzt = StringUtil.parseNull(map.get("SQZT"),"");
                                    if("已完成".equals(sqzt)){ %>
                                <font color="green"><%=sqzt%></font>
                                <%}else if("正在审批".equals(sqzt)) { %>
                                <font color="red"><%=sqzt%></font>
                                <%}else{  %>
                                <%=sqzt%>
                                <% }
                                %>&nbsp;
                            </td>
							<td  align="center" nowrap="nowrap">
                                 <%
                                    String processId = StringUtil.parseNull(map.get("PROCESS_ID"),"");
                                    String connectId = StringUtil.parseNull(map.get("CONNECT_ID"),"");
                                    if("已申请".equals(StringUtil.parseNull(map.get("SQZT"),""))){
                                     String nextRole = workFlow.getNextRoleName(connectId,"1");
                                     String options = workFlow.getNextUserSelectOptions(nextRole,orgId);
                                %>
                                 <a href="#" onclick="qz1('<%=formId%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>');">[签字]</a>
                                     发送给&nbsp;<%=nextRole%>
                                <select name="<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>nextUserId">
                                <%=StringUtil.parseNull(options,"")%>
                                </select>审批<input type="button" class="button"  style="width:40px" value="提交" onclick="tj('<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>');"/>
                                <% }else if("已保存".equals(StringUtil.parseNull(map.get("SQZT"),""))){%>
                                <a href="./edit.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>&curRole=<%=curRole%>">[编辑]</a>&nbsp;
                                <a href="javascript:onDelete('./delete.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>');">[删除]</a>&nbsp;
                                <%   }else if("已完成".equals(StringUtil.parseNull(map.get("SQZT"),""))){ %>
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="print('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>','<%=roleFlag%>','<%=sfbr%>');">[打印]</a>
                                <a href="#" onclick="xj('<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>','<%=curRole%>');">[销假登记]</a>
                                <%    }else{ %>
                                <a href="./flow.jsp?processId=<%=StringUtil.parseNull(map.get("PROCESS_ID"),"")%>">[查看流程]</a>&nbsp;
                                <a href="#" onclick="qz('<%=formId%>','<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>');">[签批单]</a>
                                <a href="#" onclick="print('<%=processId%>','<%=connectId%>','<%=StringUtil.parseNull(map.get("HOLIDAYID"),"")%>','<%=roleFlag%>','<%=sfbr%>');">[打印]</a>
                                <%  }
                                %>
							</td>
						</tr>
						<%
							}
						%>

					</table>
				</td>
			</tr>
			<tr align="center">
				<td align="center">
					<%=pageBean.getHtml(paramMap)%>
				</td>
			</tr>
		</table>
	</body>
</html>