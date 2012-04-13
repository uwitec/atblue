<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List"%>
<%@ page import="cn.com.atblue.manager.dao.Dao" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page import="cn.com.atblue.common.SpringFactory" %>
<html>
<head>
<link rel="StyleSheet" href="<%=request.getContextPath() %>/js/dtree/default/dtree.css" type="text/css"/>
<link href="<%=request.getContextPath() %>/manager/css.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/dtree/dtree.js"></script>
<title>将url权限赋给角色</title>
</head>
<body onload="getSelected(),changeArrayToString()">
<form name="modRoleByUrl" id="modRoleByUrl" method="post" action = "role_save.d">
<input type="hidden" name="action" value="url"/>
<input type="hidden" name="roleId" value="${roleId}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bgdh" >
  <tr>
    <td  style="BORDER-COLLAPSE: collapse" width="5%"><input class="button" name="save" type="submit"
					id="save" value="确定" onclick="setSelectedIds();"/></td>
    <td  style="BORDER-COLLAPSE: collapse"width="70%"><input class="button" name="ret" type="button"
					id="ret" value="返回" onclick="returnList()"/></td>
    <td  style="BORDER-COLLAPSE: collapse" width="25%">&nbsp;
    				<input name="resIds" id="resIds" type="hidden" />
    </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
  	<td>
	<div class="dtree">
	<script>
		var len;
		var initResIds;
		urlTree = new dTree('urlTree','../js/dtree/default/images/');
		urlTree.add('0','-1','','');
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
        urlTree.add('<%= resId%>', '<%= parentId%>', "<input type='checkbox' disabled name='ck_<%= resId%>' id='ck_<%= resId%>'/><%= resName%>", "javascript:setChecked('<%= resId%>')");
        <%
                    }
                }
        %>
		len = <%= list.size()%>;
		initResIds = [${resIds}];

//		urlTree.newroot = new Node(0);
		document.write(urlTree);
		function getSelected(){
			var resIds = initResIds;
			for(var i=0;i<urlTree.aNodes.length;i++){
				var resId = urlTree.aNodes[i].id;
				var ck_obj = document.getElementById('ck_'+resId);
				for(var j=0;j<resIds.length;j++){
					if(resIds[j] == resId){
						ck_obj.checked = "checked";
					}
				}
			}
		}
		function setChecked(obj){
			var ck_obj = document.getElementById('ck_'+obj);
			if(ck_obj){
				ck_obj.checked = !ck_obj.checked;				
			}
			var node = urlTree.aNodes[urlTree.selectedNode];
			setChildDisChecked2(node.id,ck_obj);
			setParentChecked(node,ck_obj);
		}
		var urlArray = urlTree.aNodes;
		var length = urlArray.length;
		var urlStr = null;

		function setChildDisChecked(node,ck_obj){
			var id = node.id;
			for(var i=0;i<length;i++){
			    var nodes = urlArray[i];
			    var pid = nodes.pid;
			    var ck_child = document.getElementById('ck_'+nodes.id);
				if(id == pid){
					if(!ck_obj.checked){					
						ck_child.checked = null;	
					}else{
						ck_child.checked = "checked";
					}
					setChildDisChecked(nodes,ck_child);
				}
			}
		}
		function changeArrayToString(){
			var strArray = new Array(length);
	    	for(var i=0;i<length;i++){
				var id = urlArray[i].id;
				var pid = urlArray[i].pid;
				strArray[i] = pid + ";" + id;
			}
			urlStr = strArray.toString();
		}
		function setChildDisChecked2(id,ck_obj){
			if(urlStr != null && urlStr != ''){
				var reg = new RegExp(","+ id + ";","g");
				
				var show;
				while((show = reg.exec(urlStr)) != null){
					var index = show.lastIndex;
					var sub = urlStr.substring(index,urlStr.length);
					var lastIndex = sub.indexOf(",");
					var id_ = sub.substring(0,lastIndex);
					//"，"末端处理
					if(-1 == lastIndex){
						id_ = sub;
					}
					
					var ck_child = document.getElementById('ck_'+id_);
					if(!ck_obj.checked){					
						ck_child.checked = null;	
					}else{
						ck_child.checked = "checked";
					}
					setChildDisChecked2(id_,ck_child);
				}
				
				
			}
		}
		function setParentChecked(node,ck_obj){
			for(var i=0;i<urlTree.aNodes.length;i++){
				var nodes = urlTree.aNodes[i];
				if(node.pid == nodes.id){
					if(ck_obj.checked){
						var ck_parent = document.getElementById('ck_'+nodes.id);
                        if(ck_parent)ck_parent.checked = "checked";
						//递归下去
						var node_ = nodes;
						setParentChecked(node_,ck_parent);
					}
				}
			}
		}
		function setSelectedIds(){
			var resIds = '';
			for(var i=0;i<urlTree.aNodes.length;i++){
				var resId = urlTree.aNodes[i].id;
				var ck_obj = document.getElementById('ck_'+resId);
				if(ck_obj && ck_obj.checked){
					resIds = ('' == resIds) ? resId :(resIds + ','+resId);
				}
			}
			document.getElementById('resIds').value = resIds;
			
		}
		function returnList(){
			window.location.href="role_list.d";
		}
	</script>
	</div>
	</td>
  </tr>
</table>
</form>
</body>
</html>