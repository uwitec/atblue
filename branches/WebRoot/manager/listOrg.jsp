<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/css/css.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
<%
String path = request.getContextPath();
%>
<title>组织机构树状列表</title>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  class="bgdh">
  <tr>
    <td align="left">
    <input class="button" name="addOrg" type="button" id="addOrg" value="添加组织" onClick="popUpAdd();">
    <input class="button" name="modOrg" type="button" id="modOrg" value="修改组织" onClick="popUpMod();">
    <input class="button" name="delOrg" type="button" id="delOrg" value="删除组织" onClick="delOrg()">
    <input class="button" name="root" type="button" id="root" value="添加根组织" onClick="addRoot()">&nbsp;&nbsp;&nbsp;
    
    </td>
  </tr>
</table>

<div id="tree-div"></div>
<script>
//定义全局变量：被选中的orgId
var selectedId = null;

//定义全局变量：被选中的Userid
var selectedUserId = null;
var selectedUserName = null;
		
Ext.BLANK_IMAGE_URL = '<%=request.getContextPath()%>/js/ext/resources/images/default/s.gif';
//异步加载部门树 <%=request.getContextPath()%>/jszy/xmgl/treegrid-data.json
var loaderOrg1 = new Ext.tree.TreeLoader({
	dataUrl : 'orgnization_treeLoader.d?action=org'
});

loaderOrg1.on('beforeload', function(treeloader, node) {
	treeloader.baseParams = {
		id : node.id,
		method : 'tree'
	}
}, this);
	
//全部展开的按钮事件
function onItemToggle(item) {
	if (item.text == '全部收缩') {
		item.setText('全部展开');
		item.setIconClass('expand-all');
		treeOrg1.collapseAll();
	} else {
		item.setText('全部收缩');
		item.setIconClass('collapse-all');
		treeOrg1.expandAll();
	}
}

//主部门树
var treeOrg1 = new Ext.tree.TreePanel({
	region : 'west',// 目标div容器
	width: '100%',  
	id : 'treeOrg1',
    lines: true,            //显示虚线
    autoScroll:true,        //True to use overflow:'auto' on the panel's body element and show scroll bars automatically when necessary
    split: true,   // True to display a Ext.SplitBar between this region and its neighbor, allowing the user to resize the regions dynamically 
    margins: '10 0 10 5',    
    height: 450,        //高度
    animate :true,      //true to enable animated expand/collapse 
    minSize: 175,       //最小宽度值
    maxSize:500,        //最大宽度值
	loader : loaderOrg1,
	root : new Ext.tree.AsyncTreeNode({
		nodeType : 'async', //节点类型，动态加载
		text : '黄河钻井三公司',
		draggable : false,  //不可拖拽
		id : '1',
		expanded : false     //true to start the node expanded 
	}),
	tbar : [{id:'expandorcollapse',text: '全部展开', iconCls:'expand-all', handler: onItemToggle }],
	listeners : { 
	   'click' : function(node, event) {
           operate(node.id, node.text);
		}
	}
});
treeOrg1.render('tree-div');
treeOrg1.getRootNode().expand(false);
        

</script>

<table width="100%" border="0" >
  <tr>
  	<td>
	<script>
		var text = "";
		function operate(arg,txt){
			selectedId = arg;
            text = txt;
		}
		
		function operateUser(arg, txt){
			selectedUserId = arg;
			selectedUserName = txt;
		}
		
		function popUpAdd(){
			if(isSelected()){
				window.location.href="orgnization_add.d?parentId="+selectedId;
			}
		}
		function popUpMod(){
			if(isSelected()){
				if(selectedId=="1"){
					alert("根组织机构不允许修改.");
				}else{
					window.location.href="orgnization_mod.d?orgId="+selectedId;
				}
				
			}
		}
		function delOrg(){
			if(isSelected()){
				if(confirm("该操作执行时，将会删除所有的子组织机构，确定要删除吗？")){
					window.location.href="orgnization_del.d?orgId="+selectedId;
				}
			}
		}
		
		function addRoot(){
			alert("请不要重复添加根组织机构");
			return false;
		}
		
		function addMember(){
			window.location.href="addMember.jsp";
		}
		
		function addCfg(){
			if(isSelected()){
				window.location.href="modModuleByCfg.jsp?cfgType=组织机构模块&orgId="+selectedId;
			}
		}
		
		function moveOrg(){
			window.location.href="moveOrg.jsp";
		}
		
		function isSelected(){
			if(null == selectedId){
				alert('请首先选中您要操作的组织机构！');
				return false;
			}else{
				return true;
			}
		}
		
		function isUserSelected(){
			if(null == selectedUserId || isNaN(selectedUserId)){
				alert('请首先选中您要操作的用户！');
				return false;
			}else{
				return true;
			}
		}
		function popUpAdmin(){
			if(isUserSelected()){
				window.location.href="addUserAdminProcess4Org.jsp?userId="+selectedUserId;
			}
		}
		function popDownAdmin(){
			if(isUserSelected()){
				window.location.href="delUserAdminProcess4Org.jsp?userId="+selectedUserId;
			}
		}
		function syncUserByOrg(){
            if(isSelected()){
                if(confirm("确定要同步["+text+"]的用户数据么?")){
                     window.location.href="syncUserByOrg.jsp?orgId="+selectedId+"&orgName="+text;
                }
			}
        }
        
        function selectOrg() {
        	if(isUserSelected()){
				window.open("selectOrg.jsp?userId="+selectedUserId,'组织机构选择列表','height=450,width=400,top=200,left=450'); 
			}       
        }
        
        function selectXmz() {
        	if(isUserSelected()) {
        		window.location.href="selectXmz.jsp?userId="+selectedUserId;
        	}
        }
	</script>
	</td>
  </tr>

</table>
</body>
</html>