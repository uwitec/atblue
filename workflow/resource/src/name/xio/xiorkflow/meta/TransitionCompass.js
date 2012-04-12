
/**
 * <p>Title:  </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) xio.name 2006</p>
 * @author xio
 */
function TransitionCompass() {
}
TransitionCompass.getOffset = function (fromMetaNodeModel, toMetaNodeModel, v) {
    if ((!fromMetaNodeModel) || (!toMetaNodeModel)) {
        return null;
    }

    //
    var fromPoint = fromMetaNodeModel.getPosition();
    var fromX = fromPoint.getX();
    var fromY = fromPoint.getY();
    var fromSize = fromMetaNodeModel.getSize();
    var fromWidth = fromSize.getWidth();
    var fromHeight = fromSize.getHeight();
    var fromMinX = fromX;
    var fromMinY = fromY;
    var fromMaxX = fromX + fromWidth;
    var fromMaxY = fromY + fromHeight;

    //
    var toPoint = toMetaNodeModel.getPosition();
    var toX = toPoint.getX();
    var toY = toPoint.getY();
    var toSize = toMetaNodeModel.getSize();
    var toWidth = toSize.getWidth();
    var toHeight = toSize.getHeight();
    var toMinX = toX;
    var toMinY = toY;
    var toMaxX = toX + toWidth;
    var toMaxY = toY + toHeight;

	//
    if (fromMaxY <= toMinY) {
        if ((fromMaxX >= toMinX) && (fromMinX <= toMaxX)) {
            var min = Math.max(fromMinX, toMinX);
            var max = Math.min(fromMaxX, toMaxX);
            var x = Math.round((min + max) / 2);
            //alert(1);
            return [new Point(x - fromX, fromMaxY - fromY - v), new Point(x - toX, toMinY - toY - v)];
            //return [new Point(x - fromX, fromMaxY - fromY), new Point(x - toX, toMinY - toY)];
        } else {
            if (fromMinX > toMaxX) {
            	//alert(2);
                return [new Point(fromMinX - fromX + v, fromMaxY - fromY - 2), new Point(toMaxX - toX - 2, toMinY - toY + 5)];
                //return [new Point(fromMinX - fromX, fromMaxY - fromY), new Point(toMaxX - toX, toMinY - toY)];
            } else {
                if (fromMaxX < toMinX) {
                	//alert(3);
                    return [new Point(fromMaxX - fromX - v - 2, fromMaxY - fromY), new Point(toMinX - toX - v + 2, toMinY - toY + v)];
                    //return [new Point(fromMaxX - fromX, fromMaxY - fromY), new Point(toMinX - toX, toMinY - toY)];
                }
            }
        }
    } 

    //
    if (fromMinY >= toMaxY) {
        if ((fromMaxX >= toMinX) && (fromMinX <= toMaxX)) {
            var min = Math.max(fromMinX, toMinX);
            var max = Math.min(fromMaxX, toMaxX);
            var x = Math.round((min + max) / 2);
            //alert(4);
            return [new Point(x - fromX + v, fromMinY - fromY - v), new Point(x - toX + v, toMaxY - toY - v)];
            //return [new Point(x - fromX, fromMinY - fromY), new Point(x - toX, toMaxY - toY)];
        } else {
            if (fromMinX > toMaxX) {
            	//alert(5);
                return [new Point(fromMinX - fromX, fromMinY - fromY), new Point(toMaxX - toX, toMaxY - toY)];
                //return [new Point(fromMinX - fromX, fromMinY - fromY), new Point(toMaxX - toX, toMaxY - toY)];
            } else {
                if (fromMaxX < toMinX) {
                	//alert(6);
                    return [new Point(fromMaxX - fromX - v, fromMinY - fromY + 2), new Point(toMinX - toX + 2, toMaxY - toY - 5)];
                    //return [new Point(fromMaxX - fromX, fromMinY - fromY), new Point(toMinX - toX, toMaxY - toY)];
                }
            }
        }
    }

    //
    if ((fromMaxY > toMinY) && (fromMinY < toMaxY)) {
        var min = Math.max(fromMinY, toMinY);
        var max = Math.min(fromMaxY, toMaxY);
        var y = Math.round((min + max) / 2);
        if ((fromMaxX >= toMinX) && (fromMinX <= toMaxX)) {
            var min = Math.max(fromMinX, toMinX);
            var max = Math.min(fromMaxX, toMaxX);
            var x = Math.round((min + max) / 2);
            //alert(7);
            return [new Point(x - fromX, y - fromY), new Point(x - toX, y - toY)];
            //return [new Point(x - fromX, y - fromY), new Point(x - toX, y - toY)];
        } else {
            if (fromMinX > toMaxX) {
            	//alert(8);
                return [new Point(fromMinX - fromX, y - fromY), new Point(toMaxX - toX, y - toY)];
                //return [new Point(fromMinX - fromX, y - fromY), new Point(toMaxX - toX, y - toY)];
            } else {
                if (fromMaxX < toMinX) {
                	//alert(9);
                    return [new Point(fromMaxX - fromX, y - fromY - v), new Point(toMinX - toX, y - toY - v)];
                    //return [new Point(fromMaxX - fromX, y - fromY), new Point(toMinX - toX, y - toY)];
                }
            }
        }
    }

    //
    
    //alert(Math.round(fromWidth / 2 + 10));
    return [new Point(Math.round(fromWidth / 2 + 10), fromHeight), new Point(Math.round(toWidth / 2 + 10), 0)];
};
TransitionCompass.getFromOffset = function (fromMetaNodeModel, toMetaNodeModel) {
    if ((!fromMetaNodeModel) || (!toMetaNodeModel)) {
        return null;
    }

    //
    var size = fromMetaNodeModel.getSize();
    return new Point(size.getWidth() / 2, size.getHeight());
};
TransitionCompass.getToOffset = function (fromMetaNodeModel, toMetaNodeModel) {
    if ((fromMetaNodeModel == null) || (toMetaNodeModel == null)) {
        return null;
    }
    var size = toMetaNodeModel.getSize();
    return new Point(size.getWidth() / 2, 0);
};
TransitionCompass.convertOffsetToPoint = function (metaNodeModel, offset) {
    var point = metaNodeModel.getPosition();
    //alert(point.getX());
    return new Point(point.getX() + offset.getX(), point.getY() + offset.getY());
};

//chivas 
TransitionCompass.convertOffsetToPoint = function (metaNodeModel, offset, v) {
    var point = metaNodeModel.getPosition();
    //alert(point.getX());
    return new Point(point.getX() + offset.getX(), point.getY() + offset.getY() + v);
};

