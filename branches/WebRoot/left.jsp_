<%@ page import="cn.com.atblue.common.util.StringUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/css.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/ext/resources/css/ext-all.css"/>
    <link id="theme" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/ext/resources/css/xtheme-gray.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
    <title>菜单</title>
</head>
<%
    String id = StringUtil.parseNull(request.getParameter("id"),"");
    String name = StringUtil.parseNull(request.getParameter("name"),"");
    String path = StringUtil.parseNull(request.getParameter("path"),"");
%>
<script>
    var contextPath = "<%=request.getContextPath()%>";
    Ext.BLANK_IMAGE_URL = '<%=request.getContextPath()%>/js/ext/resources/images/default/s.gif';
    Ext.onReady(function() {
        Ext.layout.CustomHeightLayout = Ext.extend(Ext.layout.FitLayout, {
            setItemSize : function(item, size) {
                if (item && size.height > 0) {
                    item.setHeight(size.height);
                }
            }
        });
        Ext.Container.LAYOUTS['customheight'] = Ext.layout.CustomHeightLayout;
        var viewport = new Ext.Viewport({
            layout:'border',
            items:[
                {
                    region:'center',
                    id:'west-panel',
                    title:'菜单树',
                    width: 160,
//                    collapsible: true,
                    layout:'customheight',
                    layoutConfig:{
                        animate:true
                    },
                    items: [
                        {
                            html: "<div id=\"tree-div\" style=\"overflow:auto; height:100%;width:100%;border:1px solid #c3daf9\"></div>",
                            autoScroll:true,
                            border:false,
                            iconCls:'nav'
                        }
                    ]
                }
            ]
        });
        var Tree = Ext.tree;
        var tree = new Tree.TreePanel({
            useArrows: true,
            autoScroll: true,
            animate: true,
            enableDD: true,
            containerScroll: true,
            border: false,
            rootVisible:false,
            loader: new Ext.tree.TreeLoader({
                url: 'treeLoader.jsp',
                createNode: function(attr) {
                    return Ext.tree.TreeLoader.prototype.createNode.call(this, attr);
                }
            }),
            root: {
                nodeType: 'async',
                text: '<%=name%>',
                draggable: false,
                id: '<%=id%>'
            },
            listeners: {
                'render': function(tp) {
                    tp.getSelectionModel().on('selectionchange', function(tree, node) {
                        node.expanded = true;
                    })
                },
                click: function(n) {
                    if (n.id.indexOf("#") != -1) {
                        var s = n.id.split("#");
                        if (s[1] != '/')window.open('<%=request.getContextPath() %>'+s[1], 'mainFrame');
                    }
                }
            }
        });
        tree.render('tree-div');
        tree.getRootNode().expand(true);
        <%--window.open(encodeURI(encodeURI('<%=request.getContextPath()+url %>')), 'rightFrame');--%>
    });
</script>
<body>
</body>
</html>