<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="import.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    List announceList = oDao.getLatestAnnounce(5);
    announceList = announceList == null ? new ArrayList() : announceList;
    PageBean pageBean = new PageBean();
    pageBean.setPageSize(5);
    pageBean.setTotalRows(5);
    List list = officeNoticeDAO
            .getNowNotice(_user.getUserId(), pageBean);
    list = list == null ? new ArrayList() : list;
    Map paramMap = new HashMap();
    paramMap.put("userId", cUser.getUserId());
    List list2 = officeWjspDAO.getWaitPagedList(pageBean, paramMap);
    list2 = list2 == null ? new ArrayList() : list2;
    List list3 = oDao.getWaitPagedHysqList(pageBean,paramMap);
    list3 = list3 == null ? new ArrayList() : list3;
    List list4 = oDao.getWaitPagedYysqList(pageBean,paramMap);
    list4 = list4 == null ? new ArrayList() : list4;
    List list5 = officeHolidayDAO.getWaitPagedList(pageBean,paramMap);
    list5 = list5 == null ? new ArrayList() : list5;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <link href="<%=path%>/images/css.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css">
  </head>
  <body bgcolor="#eaf7ff">
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#eaf7ff">
  <tr>
      <td height="6" colspan="3"></td>
  </tr>
   <tr>
       <td>
               <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                       <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                               <td width="153"><img src="images/zxgg.jpg" width="153" height="25"></td>
                               <td background="images/index---home_02.jpg">&nbsp;</td>
                               <td width="51"><img src="images/index---home_04.jpg" width="51" height="25"></td>
                           </tr>
                       </table></td>
                   </tr>
                   <tr>
                       <td height="140" align="center" class="tab_main" valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                           <%
                            for(int i=0; i<announceList.size();i++){
                                Map map = (Map)announceList.get(i);
                                java.util.Date date = (java.util.Date)map.get("RLSDATE");
                           %>
                           <tr>
                               <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                               <td class="txt_home">
                                   <a href="<%=request.getContextPath()%>/oa/xzbg/notice/view.jsp?noticeid=<%=StringUtil.parseNull(map.get("NOTICEID"),"")%>">
                                   <%=StringUtil.parseNull(map.get("NOTITITLE"),"")%></a>
                               </td>
                               <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                           </tr>
                           <% }
                           %>
                       </table></td>
                   </tr>
               </table></td>
       <td width="6">&nbsp;</td>
       <td><table width="494" border="0" cellspacing="0" cellpadding="0">
           <tr>
               <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                       <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                               <td width="153"><img src="images/tzqs.jpg" width="153" height="25"></td>
                               <td background="images/index---home_02.jpg">&nbsp;</td>
                               <td width="51"><img src="images/index---home_04.jpg" width="51" height="25"></td>
                           </tr>
                       </table></td>
                   </tr>
                   <tr>
                       <td height="140" align="center" class="tab_main" valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                           <%
                               for(int i=0; i<list.size();i++){
                                   OfficeNotice map = (OfficeNotice)list.get(i);
                                   java.util.Date date = (java.util.Date)map.getRlsdate();
                           %>
                           <tr >
                               <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                               <td class="txt_home">
                                   <a href="<%=request.getContextPath()%>/oa/xzbg/notice/view.jsp?noticeid=<%=StringUtil.parseNull(map.getNoticeid(),"")%>">
                                   <%=StringUtil.parseNull(map.getNotititle(),"")%></a></td>
                               <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                           </tr>
                           <% }
                           %>
                       </table></td>
                   </tr>
               </table></td></td>
           </tr>
       </table></td>
   </tr>
           <tr>
               <td height="6" colspan="3"></td>
           </tr>
      <tr>
          <td>
          <td valign="top"><table width="494" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td width="153"><img src="images/wjcy.jpg" width="153" height="25"></td>
                          <td background="images/index---home_02.jpg">&nbsp;</td>
                          <td width="51"><img src="images/index---home_04.jpg" width="51" height="25"></td>
                      </tr>
                  </table></td>
              </tr>
              <tr>
                  <td height="140" align="center" class="tab_main"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                          <td class="txt_home">中海油公布新油田渤中19-4产量中海油公布新油田渤中19-4产</td>
                          <td width="50" class="txt_home">04-19</td>
                      </tr>
                      <tr>
                          <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                          <td><span class="txt_home">中海油公布新油田渤中19-4产量中海油公布新油田渤中19-4产</span></td>
                          <td width="50" class="txt_home">04-19</td>
                      </tr>
                      <tr>
                          <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                          <td><span class="txt_home">中海油公布新油田渤中19-4产量中海油公布新油田渤中19-4产</span></td>
                          <td width="50"><span class="txt_home">04-19</span></td>
                      </tr>
                      <tr>
                          <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                          <td><span class="txt_home">中海油公布新油田渤中19-4产量中海油公布新油田渤中19-4产</span></td>
                          <td width="50"><span class="txt_home">04-19</span></td>
                      </tr>
                      <tr>
                          <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                          <td><span class="txt_home">中海油公布新油田渤中19-4产量中海油公布新油田渤中19-4产</span></td>
                          <td width="50"><span class="txt_home">04-19</span></td>
                      </tr>
                  </table></td>
              </tr>
          </table></td>
          <td width="6">&nbsp;</td>
          <td valign="top"><table width="494" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td><table width="494" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td width="153"><img src="images/dsp.jpg" width="153" height="25"></td>
                                  <td background="images/index---home_02.jpg">&nbsp;</td>
                                  <td width="51"><img src="images/index---home_04.jpg" width="51" height="25"></td>
                              </tr>
                          </table></td>
                      </tr>
                      <tr>
                          <td align="center" class="tab_main" valign="top"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <%
                                  for(int i=0; i<list2.size();i++){
                                      Map map = (Map)list2.get(i);
                                      java.util.Date date = (java.util.Date)map.get("QFRQ");
                              %>
                              <tr>
                                  <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                                  <td class="txt_home">
                                      <a href="<%=request.getContextPath()%>/oa/xzbg/wjsp/sp.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>">
                                      【文件审批】<%=StringUtil.parseNull(map.get("BT"),"")%></a></td>
                                  <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list3.size();i++){
                                      Map map = (Map)list3.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                                  <td class="txt_home">
                                      <a href="<%=request.getContextPath()%>/oa/xzbg/hysq/sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>">
                                      【会议申请】<%=StringUtil.parseNull(map.get("HYMC"),"")%></a></td>
                                  <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list4.size();i++){
                                      Map map = (Map)list4.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                                  <td class="txt_home">
                                      <a href="<%=request.getContextPath()%>/oa/xzbg/yysq/sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>">
                                          【用印申请】<%=StringUtil.parseNull(map.get("YYMC"),"")%></a>
                                      </td>
                                  <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list5.size();i++){
                                      Map map = (Map)list5.get(i);
                                      java.util.Date date = (java.util.Date)map.get("KSSJ");
                              %>
                              <tr>
                                  <td width="25" height="24"><img src="images/index---home_12.jpg" width="5" height="5"></td>
                                  <td class="txt_home">
                                      <a href="<%=request.getContextPath()%>/oa/xzbg/holiday/sp.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>">
                                          【请假申请】<%=StringUtil.parseNull(map.get("XM"),"")%></a>
                                  </td>
                                  <td width="50" class="txt_home"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                          </table></td>
                      </tr>
                  </table></td></td>
              </tr>
          </table></td>
      </tr>
  </table>
  </body>
</html>
