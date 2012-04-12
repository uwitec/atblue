
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) xio.name 2006</p>
 * @author xio
 */
function NullNodeModel() {
    this.base = MetaNodeModel;
    this.base();

    //
    this.setText("空节点");

    //
    this.setSize(new Dimension(80, 30));
}
NullNodeModel.prototype = new MetaNodeModel();

//
NullNodeModel.prototype.toString = function () {
	//节点
    return "[空节点:" + this.getText() + "]";
};

//
NullNodeModel.prototype.type = MetaNodeModel.TYPE_NULL_NODE;

