<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List"%>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<html>
<head>
    <link rel="StyleSheet" href="<%=request.getContextPath() %>/js/dtree/default/dtree.css" type="text/css"/>
    <link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/dtree/dtree.js"></script>
<title>菜单url树状列表</title>
</head>
<body>
<form name="moveUrl" method="post" action="moveUrlProcess.jsp">
<table width="100%"  border="0" cellspacing="0">
<input type="hidden" name="sourceResId" value="" />
<input type="hidden" name="targetResId" value="" />
  <tr  class="bgdh">
    <td width="28%" height="25">&nbsp;</td>
    <td width="5%" height="25">节点类型</td>
    <td width="12%" height="25"><select name="nodeType" id="nodeType">
      <option value="1" selected>子节点</option>
      <option value="2">兄弟节点</option>
            </select></td>
    <td width="5%" id="obj">移动方向</td>
    <td width="9%" id="object"><select name="direction" id="direction">
      <option value="1">向前</option>
      <option value="2" selected>向后</option>
            </select></td>
    <td width="11%"><input type="button"  class="button" name="Submit" value="调  整"  onClick="submitform()"></td>
    <td width="30%" height="25">&nbsp;</td>
  </tr>
  <tr>
    <td height="25">URL目录树</td>
    <td height="25" colspan="5">&nbsp;</td>
    <td height="25">URL目录树</td>
  </tr>
  <tr>
    <td>
	<table width="100%" border="0"   >
  <tr>
  	<td>
	<div class="dtree">
	<script>
		var leftSelectedId = null;
		leftTree = new dTree('leftTree','../js/dtree/default/images/');
		leftTree.add('0','-1','','');
        <%
Dao dao = (Dao)SpringFactory.instance.getBean("dao");
List list = dao.getAllMenus();
if(null != list && list.size() > 0){
    for(int i=0;i<list.size();i++){
        Map res = (Map)list.get(i);
        String resId = StringUtil.parseNull(res.get("RES_ID"),"");
        String resName = StringUtil.parseNull(res.get("RES_NAME"),"");
        String parentId = StringUtil.parseNull(res.get("PARENT_ID"),"");
        %>
        leftTree.add('<%= resId%>', '<%= parentId%>', '<%= resName%>', "javascript:leftOperate('<%= resId%>')");
        <%
                    }
                }
        %>
		leftTree.setCookie('leftUrlTree', null);
		leftTree.newroot = new Node(0);
		document.write(leftTree);
		leftTree.setCookie('leftUrlTree', null);
		<%
		if(null == request.getParameter("leftSelectedId")){
			%>
			leftSelectedId = leftTree.getSelected();
			<%
		}else{
			%>
			leftTree.setCookie('leftUrlTree', null);
			<%
		}
		%>
		function leftOperate(arg){
			leftSelectedId = arg;
			document.all.sourceResId.value =leftSelectedId ;
		}
	</script>
	</div>
	</td>
  </tr>

</table>
	</td>
    <td colspan="5">&nbsp;</td>
    <td>
	<table width="100%" border="0"   >
  <tr>
  	<td>
	<div class="dtree">
	<script>
		var rightSelectedId = null;
		rightTree = new dTree('rightTree','../js/dtree/default/images/');
		rightTree.add('0','-1','','');
        <%
if(null != list && list.size() > 0){
    for(int i=0;i<list.size();i++){
        Map res = (Map)list.get(i);
        String resId = StringUtil.parseNull(res.get("RES_ID"),"");
        String resName = StringUtil.parseNull(res.get("RES_NAME"),"");
        String parentId = StringUtil.parseNull(res.get("PARENT_ID"),"");
        %>
        leftTree.add('<%= resId%>', '<%= parentId%>', '<%= resName%>', "javascript:reghtOperate('<%= resId%>')");
        <%
                    }
                }
        %>
		
		//更新cookie中selectedId的值
		rightTree.setCookie('rightUrlTree', null);

		//节点展开位置
		rightTree.newroot = new Node(0);
		//tree输出
		document.write(rightTree);
		
		//更新cookie中selectedId的值
		rightTree.setCookie('rightUrlTree', null);
		
		<%
		if(null == request.getParameter("rightSelectedId")){
			%>
			//取cookie中获取缓存的selectedId
			rightSelectedId = rightTree.getSelected();
			<%
		}else{
			%>
			//更新cookie中selectedId的值
			rightTree.setCookie('rightUrlTree', null);
			<%
		}
		%>
		function reghtOperate(arg){
			rightSelectedId = arg;
			document.all.targetResId.value =rightSelectedId ;
		}
		
		function isSelected(){
			if(document.all.sourceResId.value == ''){
				alert('请首先选中您要调整的节点！');
				return false;
			}else{
			
				 if(document.all.targetResId.value == ''){
					alert('请首先选中您要移动到的节点！');
					return false;
				}else{
					return true;
				}
			}
		}
		
		function submitform(){
			if(isSelected()){
				document.all.moveUrl.submit();
			}
		}
		
	</script>
	</div>
	</td>
  </tr>

</table>
	</td>
  </tr>
</table>
</form>
</body>
</html>