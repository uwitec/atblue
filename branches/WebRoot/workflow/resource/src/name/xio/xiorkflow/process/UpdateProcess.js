
/**
 * <p>Title:  </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) xio.name 2006</p>
 * @author xio
 */
function UpdateProcess(wrapper, toolbar) {
    this.base = Ajax;
    this.base();
    this.wrapper = wrapper;
    this.toolbar = toolbar;
}
UpdateProcess.prototype = new Ajax();
UpdateProcess.prototype.setButtonEnable = function (b) {
    if (this.toolbar) {
        this.toolbar.setButtonEnable(b);
    }
};
UpdateProcess.prototype.updateProcess = function () {
    var model = this.wrapper.getModel();
    var name = model.getName();
    if (!name) {
        this.name = null;
    	//工作流程图名字为空！
        alert("\u5de5\u4f5c\u6d41\u7a0b\u56fe\u540d\u5b57\u4e3a\u7a7a\uff01");
        return false;
    }

    //
    this.setButtonEnable(false);

    //
    var doc = XiorkFlowModelConverter.convertModelToXML(model);
    if (!doc) {
    	//将工作流程图转化成xml时出错！
        alert("\u5c06\u5de5\u4f5c\u6d41\u7a0b\u56fe\u8f6c\u5316\u6210xml\u65f6\u51fa\u9519\uff01");
        this.setButtonEnable(true);
        return false;
    }

    //
    var url = XiorkFlowWorkSpace.URL_UPDATE_PROCESS;
    var method = "POST";
    var params = "name=" + name;
    params += "&xml=" + doc.xml;

    //
    this.loadXMLHttpRequest(url, method, params);
};
UpdateProcess.prototype.onReadyStateChange = function (httpRequest) {
    if (httpRequest.readyState == 4) {
        if (httpRequest.status == 200) {
            this.processXMLHttpRequest(httpRequest);
        } else {
        	//处理过程出现错误！
            alert("\u5904\u7406\u8fc7\u7a0b\u51fa\u73b0\u9519\u8bef\uff01");
            this.setButtonEnable(true);
        }
    }
};
UpdateProcess.prototype.processXMLHttpRequest = function (httpRequest) {
    var doc = httpRequest.responseXML;
    if (!doc) {
    	//操作结束，未知服务器处理结果！
        alert("\u64cd\u4f5c\u7ed3\u675f\uff0c\u672a\u77e5\u670d\u52a1\u5668\u5904\u7406\u7ed3\u679c\uff01");
        this.setButtonEnable(true);
        return false;
    }

    alertStr = "\u4fdd\u5b58\u6210\u529f\u3002";
    
    this.wrapper.setChanged(false);
        
    this.setButtonEnable(true);
    alert(alertStr);
    window.close();
};

