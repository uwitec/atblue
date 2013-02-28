<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../import.jsp" %>
<%
    String documentid = StringUtil.parseNull(request.getParameter("documentid"), "");
    String processId  = StringUtil.parseNull(request.getParameter("processId"),"");
    Map map1 = new HashMap();
    map1.put("documentid", documentid);
    OfficeWjsp wjsp = officeWjspDAO.queryForBean(map1);
    wjsp = wjsp == null ? new OfficeWjsp() : wjsp;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 15">
<link rel=File-List href="文件行文单2.files/filelist.xml">
<style id="文件行文单_30235_Styles">
<!--table
{mso-displayed-decimal-separator:"\.";
    mso-displayed-thousand-separator:"\,";}
.font530235
{color:black;
    font-size:22.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.font630235
{color:black;
    font-size:22.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;}
.font730235
{color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.font830235
{color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;}
.font930235
{color:windowtext;
    font-size:9.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;}
.xl1530235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:bottom;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6330235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:18.0pt;
    font-weight:700;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6430235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:justify;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6530235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6630235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:22.0pt;
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
.xl6730235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6830235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl6930235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:justify;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7030235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:none;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7130235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    border-top:1.0pt solid windowtext;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7230235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7330235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
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
.xl7430235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:general;
    vertical-align:bottom;
    border-top:.5pt solid windowtext;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7530235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7630235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7730235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7830235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;
    mso-number-format:General;
    text-align:center;
    vertical-align:middle;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl7930235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8030235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8130235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8230235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8330235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;
    mso-number-format:General;
    text-align:left;
    vertical-align:middle;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8430235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:"Times New Roman", serif;
    mso-font-charset:0;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8530235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8630235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8730235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8830235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl8930235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:11.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:center;
    vertical-align:bottom;
    border-top:.5pt solid windowtext;
    border-right:none;
    border-bottom:1.0pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9030235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
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
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9130235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9230235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:none;
    border-right:none;
    border-bottom:.5pt solid windowtext;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9330235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:none;
    border-right:.5pt solid windowtext;
    border-bottom:none;
    border-left:none;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9430235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
    font-size:16.0pt;
    font-weight:400;
    font-style:normal;
    text-decoration:none;
    font-family:宋体;
    mso-generic-font-family:auto;
    mso-font-charset:134;
    mso-number-format:General;
    text-align:left;
    vertical-align:top;
    border-top:none;
    border-right:none;
    border-bottom:none;
    border-left:.5pt solid windowtext;
    mso-background-source:auto;
    mso-pattern:auto;
    white-space:nowrap;}
.xl9530235
{padding-top:1px;
    padding-right:1px;
    padding-left:1px;
    mso-ignore:padding;
    color:black;
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
    border-top:1.0pt solid windowtext;
    border-right:none;
    border-bottom:none;
    border-left:none;
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
    .Noprint {
        display: none;
    }
</style>
<script type="text/javascript">
    // --- 为控件设置要签名的数据
    function SetStore() {
        var str;
        var separator = "::";  // 分隔符
        str = "";
        document.all.DWebSignSeal.SetSignData("-");
        document.all.DWebSignSeal.SetSignData("+DATA:" + str);
    }
    function LoadSignData() {
        <%
            Map spyjMap = oDao.getSpyjByItemIdAndProcessId("12b8822d-9f55-4cf6-82aa-4463ceb317f7",processId);   //
            String spyj = StringUtil.parseNull(spyjMap.get("SPYJ"),"");
            String LRR = StringUtil.parseNull(spyjMap.get("LRR"),"");
            java.util.Date lrsj = (java.util.Date)spyjMap.get("LRSJ");
            String rq = "";
            if(lrsj != null){
                rq = DateUtil.format(lrsj,"yyyy年MM月dd日");
            }
            Map spyjMap1 = oDao.getSpyjByItemIdAndProcessId("8c4218ad-072d-45f2-a9c3-e0a4c5c1ce0d",processId);
            String spyj1 = StringUtil.parseNull(spyjMap1.get("SPYJ"),"");
            String LRR1 = StringUtil.parseNull(spyjMap1.get("LRR"),"");
            java.util.Date lrsj1 = (java.util.Date)spyjMap1.get("LRSJ");
            String rq1 = "";
            if(lrsj1 != null){
                rq1 = DateUtil.format(lrsj1,"yyyy年MM月dd日");
            }

            String ngr = wjsp.getSqr();
        %>
        addSealB("<%=0%>","<%=LRR%>");
        addSealB("<%=1%>","<%=LRR1%>");
        addSealB("<%=2%>","<%=ngr%>");
    }
    var qz = 0;
    function addSealB(index, userid) {
        SetStore();
        var shr = 'shr' + index;
        if(index == '0'){
            document.all.DWebSignSeal.SetPosition(-50, 0, shr);
        }else if(index == '1'){
            document.all.DWebSignSeal.SetPosition(-200, 0, shr);
        }else{
            document.all.DWebSignSeal.SetPosition(0, 0, shr);
        }

        var sealURL = '<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="%>' + userid;
        document.all.DWebSignSeal.AddSeal(sealURL, "");
    }
</script>
</head>

<body onload="LoadSignData()">
<!--[if !excel]>　　<![endif]-->
<!--下列信息由 Microsoft Excel 的发布为网页向导生成。-->
<!--如果同一条目从 Excel 中重新发布，则所有位于 DIV 标记之间的信息均将被替换。-->
<!----------------------------->
<!--“从 EXCEL 发布网页”向导开始-->
<!----------------------------->
<object id="factory" viewastext style="display:none"
        classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()%>/soft/smsx.cab#Version=7,0,0,8">
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
<div id="文件行文单_30235" align=center x:publishsource="Excel">
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
    <table border=0 cellpadding=0 cellspacing=0 width=693 style='border-collapse:
 collapse;table-layout:fixed;width:520pt'>
        <col width=128 style='mso-width-source:userset;mso-width-alt:4096;width:96pt'>
        <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
        <col width=176 style='mso-width-source:userset;mso-width-alt:5632;width:132pt'>
        <col width=72 style='width:54pt'>
        <col width=97 style='mso-width-source:userset;mso-width-alt:3104;width:73pt'>
        <col width=135 style='mso-width-source:userset;mso-width-alt:4320;width:101pt'>
        <col width=72 style='width:54pt'>
        <tr height=30 style='height:22.5pt'>
            <td height=30 class=xl6330235 width=128 style='height:22.5pt;width:96pt'></td>
            <td class=xl1530235 width=13 style='width:10pt'></td>
            <td class=xl1530235 width=176 style='width:132pt'></td>
            <td class=xl1530235 width=72 style='width:54pt'></td>
            <td class=xl1530235 width=97 style='width:73pt'></td>
            <td class=xl1530235 width=135 style='width:101pt'></td>
            <td class=xl1530235 width=72 style='width:54pt'></td>
        </tr>
        <tr height=36 style='height:27.0pt'>
            <td colspan=7 height=36 class=xl6630235 style='height:27.0pt'>行<font
                    class="font630235"><span
                    style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font
                    class="font530235">文</font><font class="font630235"><span
                    style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font
                    class="font530235">纸</font></td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td height=27 class=xl6430235 style='height:20.25pt'>记录表式：</td>
            <td class=xl1530235></td>
            <td class=xl1530235></td>
            <td class=xl1530235></td>
            <td class=xl1530235></td>
            <td class=xl1530235></td>
            <td class=xl1530235></td>
        </tr>
        <tr height=28 style='height:21.0pt'>
            <td colspan=6 height=28 class=xl7030235 style='height:21.0pt'>编号：钻三党发[201
                ]<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>号</td>
            <td class=xl6730235>　</td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=6 height=27 class=xl7130235 style='height:20.25pt'>文号：<%=StringUtil.parseNull(wjsp.getWjbh(), "")%></td>
            <td class=xl6830235 style="text-align: left">&nbsp;</td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td height=27 class=xl6530235 style='height:20.25pt'>签发人：</td>
            <td colspan=6 class=xl8630235 id="shr0"></td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
            <td colspan=7 rowspan=4 height=108 class=xl8330235 style='height:81.0pt'><span
                    lang=EN-US><span
                    style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<%=spyj%>　
            </span></span></td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=3 height=27 class=xl8430235 style='height:20.25pt'>　</td>
            <td colspan=3 class=xl8130235><%=rq%></td>
            <td class=xl6830235>　</td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td height=27 class=xl6430235 style='height:20.25pt'>标题：</td>
            <td colspan=6 class=xl6430235><%=StringUtil.parseNull(wjsp.getBt(), "")%>&nbsp;　</td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
            <td colspan=7 rowspan=6 height=153 class=xl9130235 style='border-bottom:.5pt solid black;
  height:114.75pt'></td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=18 style='mso-height-source:userset;height:13.5pt'>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td height=27 class=xl6430235 style='height:20.25pt'>主办单位：</td>
            <td colspan=6 class=xl6430235>  <%
                Map paramMap = new HashMap();
                paramMap.put("orgnaId",wjsp.getNgbm());
                COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
                cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
            %>
                <%=StringUtil.parseNull(cOrgnization.getOrgnaName(), "")%>　</td>
        </tr>
        <tr height=28 style='height:21.0pt'>
            <td height=28 class=xl6430235 style='height:21.0pt'>拟<font class="font830235">
            </font><font class="font730235">稿</font><font class="font830235"> </font><font
                    class="font730235">人：</font></td>
            <td colspan=6 class=xl6430235><%
                Map paramMap1 = new HashMap();
                paramMap1.put("userId",wjsp.getSqr());
                CUser cUser1 = userDAO.queryForBean(paramMap1);
                cUser1 =cUser1 == null?new CUser():cUser1;
            %>
                <%=StringUtil.parseNull(cUser1.getRealName(), "")%></td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
            <td colspan=7 rowspan=3 height=81 class=xl9130235 style='height:60.75pt'  id="shr2"></td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt' >
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=3 height=27 class=xl9030235 style='height:20.25pt'>　</td>
            <td colspan=3 class=xl7930235>
                <%
                    java.util.Date qfrq = wjsp.getQfrq();

                %>
                <%=DateUtil.getYear(qfrq)%>年<%=DateUtil.getMonth(qfrq)%>月<%=DateUtil.getDay(qfrq)%>日</td>
            <td class=xl1530235></td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=2 height=27 class=xl7630235 style='height:20.25pt'>核稿：<font
                    class="font830235"><span
                    style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></td>
            <td class=xl7430235 style='border-top:none'> <%=StringUtil.parseNull(wjsp.getBgshg(), "")%>　</td>
            <td colspan=2 class=xl7530235 style='border-left:none'>主任审核：</td>
            <td colspan=2 class=xl8530235 id="shr1">　</td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
            <td colspan=3 rowspan=3 height=81 class=xl9130235 style='border-right:.5pt solid black;
  height:60.75pt'></td>
            <td colspan=4 rowspan=3 class=xl9130235 style="text-align: left"><%=spyj1%>　</td>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='mso-height-source:userset;height:20.25pt'>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=2 height=27 class=xl7730235 style='height:20.25pt'>　</td>
            <td class=xl7730235><%=rq1%></td>
            <td colspan=2 class=xl8830235 style='border-left:none'>　</td>
            <td class=xl7730235><%=rq1%></td>
            <td class=xl6830235>　</td>
        </tr>
        <tr height=28 style='height:21.0pt'>
            <td height=28 colspan=7 class=xl6930235 style='height:21.0pt;border-top:none'>发：<%=StringUtil.parseNull(wjsp.getFa(), "")%></td>
        </tr>
        <tr height=27 style='height:20.25pt'>
            <td colspan=5 height=27 class=xl9530235 style='height:20.25pt'>　</td>
            <td class=xl7330235>印<font class="font830235"><span
                    style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;<%=StringUtil.parseNull(wjsp.getGyfs(), "")%>&nbsp;&nbsp;&nbsp;&nbsp; </span></font><font
                    class="font730235">份</font></td>
            <td class=xl1530235></td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height=0 style='display:none'>
            <td width=128 style='width:96pt'></td>
            <td width=13 style='width:10pt'></td>
            <td width=176 style='width:132pt'></td>
            <td width=72 style='width:54pt'></td>
            <td width=97 style='width:73pt'></td>
            <td width=135 style='width:101pt'></td>
            <td width=72 style='width:54pt'></td>
        </tr>
        <![endif]>
    </table>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>

<!----------------------------->
<!--“从 EXCEL 发布网页”向导结束-->
<!----------------------------->
</body>

</html>
