<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../import.jsp"%>
<%
    OfficeCirculationDAO officeCirculationDAO = (OfficeCirculationDAO)SpringFactory.instance.getBean("officeCirculationDAO");
    OfficeCirculationCheckDAO officeCirculationCheckDAO = (OfficeCirculationCheckDAO)SpringFactory.instance.getBean("officeCirculationCheckDAO");
    String pkid = request.getParameter("pkid");
    String formItemId  = StringUtil.parseNull(request.getParameter("formItemId"),"");
    String processId  = StringUtil.parseNull(request.getParameter("processId"),"");
    List checkList = oDao.getOfficeCirculationCheckList(pkid);
    String[] checkmans = new String[1];
    checkmans[0] = "";
    String spyj = oDao.getSpyjByItemIdAndProcessId(formItemId,processId);

    OfficeCirculation document = null;
    try{
        document = officeCirculationDAO.selectByPrimaryKey(pkid);
    }catch(Exception e){
        e.printStackTrace();
    }
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 15">
<link rel=File-List href="文件传阅单.files/filelist.xml">
<style id="文件传阅单_20162_Styles">
<!--table
{mso-displayed-decimal-separator:"\.";
    mso-displayed-thousand-separator:"\,";}
.font520162
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.xl1520162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6520162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6620162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6720162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:right;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6820162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6920162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:18.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7020162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7120162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:10.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:right;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7220162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7320162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7420162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7520162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:justify;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7620162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7720162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7820162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7920162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8020162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8120162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8220162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8320162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8420162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8520162
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:windowtext;
    font-size:12.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
ruby
{ruby-align:left;}
rt
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-char-type:none;}
-->
</style>
<style media=print>
    .Noprint{display:none;}
</style>
<script type="text/javascript">
    // --- 为控件设置要签名的数据
    function SetStore() {
        var str;
        var separator = "::";  // 分隔符
        str="";
        document.all.DWebSignSeal.SetSignData("-");
        document.all.DWebSignSeal.SetSignData("+DATA:" + str);
    }
    function LoadSignData() {
      <%
       if(checkList != null && checkList.size() > 0){
       int cn = 0;
        checkmans = new String[checkList.size()];
        for(int i=0; i<checkList.size(); i++){
            Map map = (Map)checkList.get(i);
            String name = StringUtil.parseNull(map.get("CHECKMAN"),"");
            String checkflag = StringUtil.parseNull(map.get("CHECKFLAG"),"");
            if("1".equals(checkflag)){
                cn = cn + 1;
            %>
                   addSealB("<%=cn%>","<%=name%>");
        <% }else{
//                checkman = checkman + "<font color='red'>"+name +"</font>;";
         }
     }
 }
   %>
    }
    var qz = 0;
    function addSealB(index,userid){
        SetStore();
        var shr = 'shr'+index;
        document.all.DWebSignSeal.SetPosition(-140,-20,shr);
        var sealURL='<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="%>'+userid;
        document.all.DWebSignSeal.AddSeal(sealURL, "");
    }
</script>
</head>

<body onload="LoadSignData();">
<object id="factory" viewastext style="display:none"
        classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()%>/soft/smsx.cab#Version=7,0,0,8">
</object>
<script defer>
    //打印组件通用设置
    factory.printing.header = "";//页眉
    factory.printing.footer = "";//页脚
    factory.printing.leftMargin = 0;//左边距
    factory.printing.topMargin = 0;//上边距
    factory.printing.rightMargin = 0;//右边距
    factory.printing.bottomMargin = 0;//下边距
</script>
<!--[if !excel]>　　<![endif]-->
<!--下列信息由 Microsoft Excel 的发布为网页向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->

<div id="文件传阅单_20162" align=center x:publishsource="Excel">
    <table align="center">
        <tr>
            <td class="Noprint">
                <input name="button" type="button" class="button" value="打印预览" onClick="factory.printing.Preview();"/>
                <input name="submit" type="submit" class="button" value="关闭" onClick="window.close();">
                <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
                <input type="hidden" id="signdata" name="signdata"/>
            </td>
        </tr>
    </table>
    <table border=0 cellpadding=0 cellspacing=0 width=648 style='border-collapse:
 collapse;table-layout:fixed;width:486pt'>
        <col width=72 span=9 style='width:54pt'>
        <tr height=59 style='mso-height-source:userset;height:44.25pt'>
            <td colspan=9 height=59 class=xl6920162 width=648 style='height:44.25pt;
  width:486pt'>文 件 传 阅 单</td>
        </tr>
        <tr height=19 style='height:14.25pt'>
            <td height=19 class=xl6820162 style='height:14.25pt'>记录表式</td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td colspan=5 class=xl7120162>编号:<%=StringUtil.parseNull(document.getWjbh(),"")%></td>
        </tr>
        <tr height=94 style='mso-height-source:userset;height:70.5pt'>
            <td height=94 class=xl6620162 style='height:70.5pt'>文件名称</td>
            <td colspan=8 class=xl6620162 style='border-left:none;text-align: left'><%=StringUtil.parseNull(document.getWjmc(),"")%></td>
        </tr>
        <tr height=30 style='mso-height-source:userset;height:22.5pt'>
            <td height=30 class=xl6620162 style='height:22.5pt;border-top:none'>收文编号</td>
            <td class=xl6520162 style='border-top:none;border-left:none'><%=StringUtil.parseNull(document.getSwh(),"")%></td>
            <td class=xl6620162 style='border-top:none;border-left:none'>份数</td>
            <td class=xl6520162 style='border-top:none;border-left:none'><%=StringUtil.parseNull(document.getFs(),"")%></td>
            <td class=xl6620162 style='border-top:none;border-left:none'>密级</td>
            <td class=xl6520162 style='border-top:none;border-left:none'><%=StringUtil.parseNull(document.getMmcd(),"")%>　</td>
            <td colspan=3 class=xl7220162 style='border-right:.5pt solid black;
  border-left:none'>领导签名及时间</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=6 rowspan=10 height=360 class=xl7520162 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:276.0pt;text-align: left' valign="top" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                领 导 批 示<br>
                <%=StringUtil.parseNull(spyj,"")%>
            </td>
            <td colspan=3 class=xl7220162 style='border-right:.5pt solid black;
  border-left:none' id="shr1"> </td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr2">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr3">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr4">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr5">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr6">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr7">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr8">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr9">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr10">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td rowspan=5 height=180 class=xl8320162 style='border-bottom:.5pt solid black;
  height:138.0pt;border-top:none'>拟办意见</td>
            <td colspan=5 rowspan=5 class=xl6620162><%=StringUtil.parseNull(document.getNbyj(),"")%>　</td>
            <td colspan=3 class=xl7220162 style='border-right:.5pt solid black;
  border-left:none' id="shr11">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr12">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr13">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr14">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr15">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td rowspan=4 height=144 class=xl8320162 style='border-bottom:.5pt solid black;
  height:110.4pt;border-top:none'>备注</td>
            <td colspan=5 rowspan=4 class=xl6620162><%=StringUtil.parseNull(document.getBz(),"")%>　</td>
            <td colspan=3 class=xl7220162 style='border-right:.5pt solid black;
  border-left:none' id="shr16">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr17">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl7220162 style='border-right:.5pt solid black;
  height:27.6pt;border-left:none' id="shr18">　</td>
        </tr>
        <tr height=36 style='mso-height-source:userset;height:27.6pt'>
            <td colspan=3 height=36 class=xl6620162 style='height:27.6pt;border-left:
  none' id="shr19">　</td>
        </tr>
        <tr height=30 style='mso-height-source:userset;height:22.5pt'>
            <td height=30 class=xl1520162 colspan=3 style='height:22.5pt'>收文时间:<%java.util.Date swsj = document.getLwsj();
                if(swsj != null){   %>
                   <%= DateUtil.format(swsj)%>
                <% }
            %></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162 colspan=2>承办人:<%=dao.findUserById(document.getLrr()).getRealName()%></td>
            <td class=xl1520162></td>
        </tr>
        <tr height=19 style='height:14.25pt'>
            <td height=19 class=xl1520162 style='height:14.25pt'></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
        </tr>
        <tr height=19 style='height:14.25pt'>
            <td height=19 class=xl1520162 style='height:14.25pt'></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
        </tr>
        <tr height=19 style='height:14.25pt'>
            <td height=19 class=xl1520162 style='height:14.25pt'></td>
            <td class=xl6720162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
            <td class=xl1520162></td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height=0 style='display:none'>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=72 style='width:54pt'></td>
        </tr>
        <![endif]>
    </table>

</div>
<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>
<!-- ---------结束装载---------------->
</body>

</html>
