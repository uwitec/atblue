<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="import.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    CUser cUser = (CUser) session.getAttribute("cUser");
    cUser = cUser == null ? new CUser() : cUser;
    List announceList = oDao.getLatestAnnounce(5);
//    List announceList = null;
    announceList = announceList == null ? new ArrayList() : announceList;
    PageBean pageBean = new PageBean();
    pageBean.setPageSize(5);
    pageBean.setTotalRows(5);
    List list = oDao.getLatestNotice(cUser.getUserId(),5);
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
    List list7 = officeSuppliesDAO.getWaitPagedList(pageBean,paramMap);
    list7 = list7 == null ? new ArrayList() : list7;
    List list10 = oDao.getWaitPagedDjfyjsList(pageBean,paramMap);
    list10 = list10 == null ? new ArrayList() : list10;
    //上级文件管理 
	 List list8 = oDao.getWaitPagedOfficeCirculationList(pageBean,paramMap);
	 list8 = list8 == null ? new ArrayList() : list8; 
	 OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
	 List list9 = officeCirculationDAO.getBeanByNbr("0",_user.getUserId(),pageBean);
    OfficeDocumentsDAO officeDocumentsDAO = (OfficeDocumentsDAO)SpringFactory.instance.getBean("officeDocumentsDAO");
    StringBuilder sb = new StringBuilder();
    sb.append(" where documentid in(select documentid from office_documents_check where checkman='");
    sb.append(_user.getUserId()).append("' and checkflag='0') and status='1'");
    sb.append(" order by cjrq desc");
    List list6 = officeDocumentsDAO.getByFreeSql(sb.toString(),pageBean);
    list6 = list6 == null ? new ArrayList() : list6;
    List list11 = officePlanDAO.getWaitPagedList(pageBean,paramMap);
    list11 = list11 == null ? new ArrayList() : list11;
    paramMap.put("orgid",cUser.getOrgnaId());
    List list12 = officeSuppliesDAO.getPagedListByOrg(pageBean,paramMap);
    list12 = list12 == null ? new ArrayList() : list12;
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
  <table width="958" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
      <tr>
          <td><table width="958" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="476"><table width="476" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td height="31"><img src="images2/index_43.gif" width="476" height="31" alt=""></td>
                      </tr>
                      <tr valign="top">
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <%
                                  for(int i=0; i<announceList.size();i++){
                                      Map map = (Map)announceList.get(i);
                                      java.util.Date date = (java.util.Date)map.get("RLSDATE");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/notice/view.jsp?noticeid=<%=StringUtil.parseNull(map.get("NOTICEID"),"")%>">
                                      <%=StringUtil.cutString(StringUtil.parseNull(map.get("NOTITITLE"),""),30)%></a></td>
                                  <td width="60" height="25" class="txtmain">><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list.size();i++){
                                      Map map = (Map)list.get(i);
                                      java.util.Date date = (java.util.Date)map.get("RLSDATE");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/xzbg/notice/sign.jsp?noticeid=<%=StringUtil.parseNull(map.get("NOTICEID"),"")%>">
                                      <%=StringUtil.cutString(StringUtil.parseNull(map.get("NOTITITLE"),""),30)%></a></td>
                                  <td width="60" height="25" class="txtmain">><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                          </table></td>
                      </tr>
                      <tr>
                          <td height="6"><img src="images2/index_53.gif" width="476" height="6" alt=""></td>
                      </tr>
                  </table></td>
                  <td width="6"></td>
                  <td width="476"><table width="476" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td height="31"><img src="images2/index_61.jpg" width="476" height="31" alt=""></td>
                      </tr>
                      <tr valign="top">
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <%
                                  for(int i=0; i<list8.size();i++){
                                      Map map = (Map)list8.get(i);
                                      java.util.Date date = (java.util.Date)map.get("LWSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/xzbg/circulation/sp.jsp?pkid=<%=StringUtil.parseNull(map.get("CYID"),"") %>">
                                      【上级文件管理】<%=StringUtil.cutString(StringUtil.parseNull(map.get("WJMC"),""),23)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list2.size();i++){
                                      Map map = (Map)list2.get(i);
                                      java.util.Date date = (java.util.Date)map.get("QFRQ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/wjsp/sp.jsp?documentid=<%=StringUtil.parseNull(map.get("DOCUMENTID"),"") %>">
                                      【文件审批】<%=StringUtil.cutString(StringUtil.parseNull(map.get("BT"),""),23)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list3.size();i++){
                                      Map map = (Map)list3.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/hysq/sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>">
                                      【会议申请】<%=StringUtil.cutString(StringUtil.parseNull(map.get("HYMC"),""),23)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list4.size();i++){
                                      Map map = (Map)list4.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/yysq/sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>">
                                      【用印申请】<%=StringUtil.cutString(StringUtil.parseNull(map.get("YYMC"),""),23)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list5.size();i++){
                                      Map map = (Map)list5.get(i);
                                      java.util.Date date = (java.util.Date)map.get("KSSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/xzbg/holiday/sp.jsp?holidayid=<%=StringUtil.parseNull(map.get("HOLIDAYID"),"") %>">
                                      【请假申请】<%=StringUtil.cutString(StringUtil.parseNull(map.get("XM"),""),23)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list7.size();i++){
                                      Map map = (Map)list7.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/xzbg/supplies/sp.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"") %>">
                                      【其它申请】关于<%=StringUtil.cutString(StringUtil.parseNull(map.get("MC"),""),23)%>的请示</a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list10.size();i++){
                                      Map map = (Map)list10.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                                      String dh = StringUtil.parseNull(map.get("DH"),"");
                                      String jh = StringUtil.parseNull(map.get("JH"),"");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/jygl/sp2.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"") %>">
                                      【单井费用审批】<%=dh+""+jh%>单井费用结算待审批</a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list11.size();i++){
                                      Map map = (Map)list11.get(i);
                                      java.util.Date date = (java.util.Date)map.get("LRSJ");
                                      String bt = StringUtil.parseNull(map.get("BT"),"");
                                      String mc = StringUtil.parseNull(map.get("MC"),"");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"> <a href="<%=request.getContextPath()%>/oa/xzbg/plan/sp.jsp?pkid=<%=StringUtil.parseNull(map.get("PKID"),"") %>">
                                      【预计划费用支出】<%=bt+"-"+mc%>待审批</a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                          </table></td>
                      </tr>
                      <tr>
                          <td height="6"><img src="images2/index_53.gif" width="476" height="6" alt=""></td>
                      </tr>
                  </table></td>
              </tr>
          </table></td>
      </tr>
      <tr>
          <td height="5"></td>
      </tr>
      <tr>
          <td><table width="958" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="476"><table width="476" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td height="31"><img src="images2/index_60.jpg" width="476" height="31" alt=""></td>
                      </tr>
                      <tr valign="top">
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <%
                                  for(int i=0; i<list6.size();i++){
                                      OfficeDocuments document = (OfficeDocuments)list6.get(i);
                                      java.util.Date date = (java.util.Date)document.getQfrq();
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/documents/signView.jsp?pkid=<%=document.getDocumentid() %>">
                                      <%=StringUtil.cutString(StringUtil.parseNull(document.getBt(),""),30)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                              <%
                                  for(int i=0; i<list9.size();i++){
                                      OfficeCirculation document = (OfficeCirculation)list9.get(i);
                                      java.util.Date date = (java.util.Date)document.getLwsj();
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/circulation/sign.jsp?pkid=<%=document.getCyid()%>">
                                      <%=StringUtil.cutString(StringUtil.parseNull(document.getWjmc(),""),30)%></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                          </table></td>
                      </tr>
                      <tr>
                          <td height="6"><img src="images2/index_53.gif" width="476" height="6" alt=""></td>
                      </tr>
                  </table></td>
                  <td width="6"></td>
                  <td width="476"><table width="476" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td height="31"><img src="images2/index_45.gif" width="476" height="31" alt=""></td>
                      </tr>
                      <tr valign="top">
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <%
                                  for(int i=0; i<list12.size();i++){
                                      Map map = (Map)list12.get(i);
                                      java.util.Date date = (java.util.Date)map.get("SQSJ");
                              %>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain"><a href="<%=request.getContextPath()%>/oa/xzbg/supplies/index_bmzx.jsp?sqid=<%=StringUtil.parseNull(map.get("SQID"),"")%>">
                                      <%=StringUtil.cutString(StringUtil.parseNull(map.get("MC"),""),30)%></a></td>
                                  <td width="60" height="25" class="txtmain"><%=date ==null?"":DateUtil.format(date,"MM-dd")%></td>
                              </tr>
                              <% }
                              %>
                          </table></td>
                      </tr>
                      <tr>
                          <td height="6"><img src="images2/index_53.gif" width="476" height="6" alt=""></td>
                      </tr>
                  </table></td>
              </tr>
          </table></td>
      </tr>
  </table>
  </body>
</html>
