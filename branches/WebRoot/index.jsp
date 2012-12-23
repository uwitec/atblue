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
                      <tr>
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
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
                      <tr>
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
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
                          <td height="31"><img src="images2/index_55.gif" width="476" height="31" alt=""></td>
                      </tr>
                      <tr>
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                          </table></td>
                      </tr>
                      <tr>
                          <td height="6"><img src="images2/index_53.gif" width="476" height="6" alt=""></td>
                      </tr>
                  </table></td>
                  <td width="6"></td>
                  <td width="476"><table width="476" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td height="31"><img src="images2/index_56.jpg" width="476" height="31" alt=""></td>
                      </tr>
                      <tr>
                          <td height="150" align="center" background="images2/index_46.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
                              <tr>
                                  <td width="15"><img src="images2/index_50.gif" width="5" height="5" alt=""></td>
                                  <td height="25" class="txtmain">中海油公布新油田渤中19-4产量中海油公布新油</td>
                                  <td width="60" height="25" class="txtmain">12-31</td>
                              </tr>
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
