
function _resize() {
	document.getElementById("scrollDiv").style.width = document.body.clientWidth - 8;
	document.getElementById("scrollDiv").style.height = document.body.clientHeight - 80;
	document.getElementById("_page").style.top = document.body.clientHeight - 50;
	document.getElementById("_page").style.width = document.body.clientWidth - 8;
}
function _resizeNoPage() {
	document.getElementById("scrollDiv").style.width = document.body.clientWidth - 18;
	document.getElementById("scrollDiv").style.height = document.body.clientHeight - 50;
}
function _resizeOnlyPage() {
	document.getElementById("_page").style.width = document.body.clientWidth - 18;
	document.getElementById("_page").style.height = document.body.clientHeight - 50;
}
function onlyNumeric() {
	if (window.event.keyCode < 48 || window.event.keyCode > 57) {
		alert("\u53ea\u80fd\u8f93\u5165\u6570\u5b57");
		window.event.keyCode = 0;
		return false;
	}
	return true;
}
function checkInput(o, msg) {
	if (eval(o).value == "") {
		alert(msg);
		eval(o).focus();
		return false;
	}
	return true;
}
function openWin(url, width, height) {
	var iTop = (window.screen.availHeight - 30 - height) / 2;
	var iLeft = (window.screen.availWidth - 10 - width) / 2;
	window.open(url, "newwindow", "height=" + height + ",width=" + width + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
}
function GetO() {
	var ajax = false;
	try {
		ajax = new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch (e) {
		try {
			ajax = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch (E) {
			ajax = false;
		}
	}
	if (!ajax && typeof XMLHttpRequest != "undefined") {
		ajax = new XMLHttpRequest();
	}
	return ajax;
}
function findObj(theObj, theDoc) {
	var p, i, foundObj;
	if (!theDoc) {
		theDoc = document;
	}
	if ((p = theObj.indexOf("?")) > 0 && parent.frames.length) {
		theDoc = parent.frames[theObj.substring(p + 1)].document;
		theObj = theObj.substring(0, p);
	}
	if (!(foundObj = theDoc[theObj]) && theDoc.all) {
		foundObj = theDoc.all[theObj];
	}
	for (i = 0; !foundObj && i < theDoc.forms.length; i++) {
		foundObj = theDoc.forms[i][theObj];
	}
	for (i = 0; !foundObj && theDoc.layers && i < theDoc.layers.length; i++) {
		foundObj = findObj(theObj, theDoc.layers[i].document);
	}
	if (!foundObj && document.getElementById) {
		foundObj = document.getElementById(theObj);
	}
	return foundObj;
}
//选中的行变量
var selectedId = null;
var selectedId1 = null;

//设置某个表的某一行被选中
function setSelected(tr,tab_id,tr_head,selectedId_,selectedId_2,rowClass,curClass){

    //循环表格中所有的行
    var tab = document.getElementById(tab_id);
    if(tab){
        for(var i=0;i<tab.rows.length;i++){
            var row = tab.rows[i];
            //除去表头
            if(row.id != tr_head){
                if(rowClass){
                    row.style.background = rowClass;
                }else{
                    row.style.background = "white";
                }
            }
        }
    }
    if (curClass) {
        tr.style.background = curClass;
    } else {
        tr.style.background = "#fff4a8";
    }
    selectedId = selectedId_;
    selectedId2 = selectedId_2;
}

function getSelected(){
    if(null == selectedId){
        alert("请选择您要操作的项目！");
        return false;
    }else{
        return true;
    }
}

