<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var  contextPath = "<%=request.getContextPath()%>";
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body onload="MM_preloadImages('images/index/banner_sys_home2.png','images/index/banner_sys_noce2.png','images/index/banner_sys_help2.png','images/index/banner_sys_ex2.png')">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="400"><img src="images/index/banner_left.jpg" width="512" height="62" /></td>
	    <td background="images/index/banner_line.jpg">&nbsp;</td>
	    <td width="576" background="images/index/banner_right.jpg"><table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr>
	        <td width="124"><a href="javascript:parent.location.reload()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','images/index/banner_sys_home2.png',1)"><img src="images/index/banner_sys_home.png" name="Image2" width="124" height="25" border="0" id="Image2" /></a></td>
	        <td width="92"><a href="#" onclick="showNotice();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','images/index/banner_sys_noce2.png',1)"><img src="images/index/banner_sys_noce.png" name="Image3" width="92" height="25" border="0" id="Image3" /></a></td>
	        <td width="67"><a href="#" onclick="showHelp();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','images/index/banner_sys_help2.png',1)"><img src="images/index/banner_sys_help.png" name="Image4" width="67" height="25" border="0" id="Image4" /></a></td>
	        <td><a href="#" onclick="logout();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','images/index/banner_sys_ex2.png',1)"><img src="images/index/banner_sys_ex.png" name="Image5" width="121" height="25" border="0" id="Image5" /></a></td>
	      </tr>
	    </table></td>
	  </tr>
	</table> 
</body>

<script type="text/javascript">
	function showHelp(){
		var obj = parent.window.document.getElementById("contentFrame").src = "<%=request.getContextPath()%>/help.jsp";
	}
	function showNotice(){
		var role = "";
		if("ok"==role){
			var obj = parent.window.document.getElementById("contentFrame").src = "<%=request.getContextPath()%>/yyxt/notice/notice_admin.vs";
		}else{
			var obv = parent.window.document.getElementById("contentFrame").src = "<%=request.getContextPath()%>/yyxt/notice/notice_list.vs";
		}
	}
	function logout() {
	    if (window.parent != null) {//如果页面在框架页面内，
	        window.parent.name = "";
	        window.parent.location.href = contextPath + "/login.jsp";
	    } else {
	        window.location.href = contextPath + "/login.jsp";
	    }
	}
</script>
</html>