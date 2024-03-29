<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0062)http://www.mxgraph.com/demo/mxgraph/editors/diagrameditor.html -->
<HTML><HEAD><TITLE>mxDraw Example</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<STYLE type=text/css media=screen>#page {
    BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BACKGROUND: url(images/draw/drawbg.jpg) repeat-y 50% top; BORDER-TOP: medium none; BORDER-RIGHT: medium none
}
</STYLE>

<SCRIPT type=text/javascript>
    mxBasePath = 'js/mxGraph/src';
</SCRIPT>

<SCRIPT type=text/javascript
        src="js/mxGraph/client.js"></SCRIPT>

<SCRIPT type=text/javascript
        src="js/mxGraph/mxApplication.js"></SCRIPT>

<SCRIPT type=text/javascript>
// Program starts here. The document.onLoad executes the
// mxApplication constructor with a given configuration.
// In the config file, the mxEditor.onInit method is
// overridden to invoke this global function as the
// last step in the editor constructor.
function onInit(editor)
{
    // Crisp rendering in SVG except for connectors, actors, cylinder, ellipses
    mxShape.prototype.crisp = true;
    mxActor.prototype.crisp = false;
    mxCylinder.prototype.crisp = false;
    mxEllipse.prototype.crisp = false;
    mxDoubleEllipse.prototype.crisp = false;
    mxConnector.prototype.crisp = false;

    // Enables guides
    mxGraphHandler.prototype.guidesEnabled = true;

    // Alt disables guides
    mxGuide.prototype.isEnabledForEvent = function(evt)
    {
        return !mxEvent.isAltDown(evt);
    };

    // Enables snapping waypoints to terminals
    mxEdgeHandler.prototype.snapToTerminals = true;

    // Defines an icon for creating new connections in the connection handler.
    // This will automatically disable the highlighting of the source vertex.
    mxConnectionHandler.prototype.connectImage = new mxImage('images/connector.gif', 16, 16);

    // Enables connections in the graph and disables
    // reset of zoom and translate on root change
    // (ie. switch between XML and graphical mode).
    editor.graph.setConnectable(true);

    // Clones the source if new connection has no target
    editor.graph.connectionHandler.setCreateTarget(true);

    // Displays information about the session
    // in the status bar
    editor.addListener(mxEvent.SESSION, function(editor, evt)
    {
        var session = evt.getProperty('session');

        if (session.connected)
        {
            var tstamp = new Date().toLocaleString();
            editor.setStatus(tstamp+':'+
                    ' '+session.sent+' bytes sent, '+
                    ' '+session.received+' bytes received');
        }
        else
        {
            editor.setStatus('Not connected');
        }
    });

    // Updates the title if the root changes
    var title = document.getElementById('title');

    if (title != null)
    {
        var f = function(sender)
        {
            title.innerHTML = 'mxDraw - ' + sender.getTitle();
        };

        editor.addListener(mxEvent.ROOT, f);
        f(editor);
    }

    // Changes the zoom on mouseWheel events
    mxEvent.addMouseWheelListener(function (evt, up)
    {
        if (!mxEvent.isConsumed(evt))
        {
            if (up)
            {
                editor.execute('zoomIn');
            }
            else
            {
                editor.execute('zoomOut');
            }

            mxEvent.consume(evt);
        }
    });

    // Defines a new action to switch between
    // XML and graphical display
    var textNode = document.getElementById('xml');
    var graphNode = editor.graph.container;
    var sourceInput = document.getElementById('source');
    sourceInput.checked = false;

    var funct = function(editor)
    {
        if (sourceInput.checked)
        {
            graphNode.style.display = 'none';
            textNode.style.display = 'inline';

            var enc = new mxCodec();
            var node = enc.encode(editor.graph.getModel());

            textNode.value = mxUtils.getPrettyXml(node);
            textNode.originalValue = textNode.value;
            textNode.focus();
        }
        else
        {
            graphNode.style.display = '';

            if (textNode.value != textNode.originalValue)
            {
                var doc = mxUtils.parseXml(textNode.value);
                var dec = new mxCodec(doc);
                dec.decode(doc.documentElement, editor.graph.getModel());
            }

            textNode.originalValue = null;

            // Makes sure nothing is selected in IE
            if (mxClient.IS_IE)
            {
                mxUtils.clearSelection();
            }

            textNode.style.display = 'none';

            // Moves the focus back to the graph
            textNode.blur();
            editor.graph.container.focus();
        }
    };

    editor.addAction('switchView', funct);

    // Client-side code for new image export
    var newExportImage = function(editor)
    {
        var scale = 1;
        var bounds = editor.graph.getGraphBounds();

        // Creates XML node to hold output
        var xmlDoc = mxUtils.createXmlDocument();
        var root = xmlDoc.createElement('output');
        xmlDoc.appendChild(root);

        // Creates interface for rendering output
        var xmlCanvas = new mxXmlCanvas2D(root);
        xmlCanvas.scale(scale);
        xmlCanvas.translate(Math.round(-bounds.x * scale), Math.round(-bounds.y * scale));

        // Renders output to interface
        var imgExport = new mxImageExport();
        imgExport.drawState(editor.graph.getView().getState(editor.graph.model.root), xmlCanvas);

        // Puts request data together
        var filename = 'export.png';
        var format = 'png';
        var bg = '#FFFFFF';
        var w = Math.round((bounds.width + 4) * scale);
        var h = Math.round((bounds.height + 4) * scale);
        var xml = mxUtils.getXml(root);

        // Compression is currently not used in this example
        // Requires base64.js and redeflate.js
        // xml = encodeURIComponent(Base64.encode(RawDeflate.deflate(xml), true));

        new mxXmlRequest('/New' + editor.urlImage.substring(1), 'filename=' + filename +
                '&format=' + format + '&bg=' + bg + '&w=' + w + '&h=' + h + '&xml=' +
                encodeURIComponent(xml)).simulate(document, '_blank');
    };

    editor.addAction('newExportImage', newExportImage);

    // Defines a new action to switch between
    // XML and graphical display
    mxEvent.addListener(sourceInput, 'click', function()
    {
        editor.execute('switchView');
    });

    // Create select actions in page
    var node = document.getElementById('mainActions');
    var buttons = ['group', 'delete', 'undo', 'print'];

    for (var i = 0; i < buttons.length; i++)
    {
        var button = document.createElement('button');
        mxUtils.write(button, mxResources.get(buttons[i]));

        var factory = function(name)
        {
            return function()
            {
                editor.execute(name);
            };
        };

        mxEvent.addListener(button, 'click', factory(buttons[i]));
        node.appendChild(button);
    }

    var select = document.createElement('select');
    var option = document.createElement('option');
    mxUtils.writeln(option, 'More Actions...');
    select.appendChild(option);

    var items = ['redo', 'ungroup', 'cut', 'copy', 'paste', 'show', 'exportImage', 'newExportImage'];

    for (var i=0; i<items.length; i++)
    {
        var option = document.createElement('option');
        mxUtils.writeln(option, mxResources.get(items[i]));
        option.setAttribute('value', items[i]);
        select.appendChild(option);
    }

    mxEvent.addListener(select, 'change', function(evt)
    {
        if (select.selectedIndex > 0)
        {
            var option = select.options[select.selectedIndex];
            select.selectedIndex = 0;

            if (option.value != null)
            {
                editor.execute(option.value);
            }
        }
    });

    node.appendChild(select);

    // Create select actions in page
    var node = document.getElementById('selectActions');
    mxUtils.write(node, 'Select: ');
    mxUtils.linkAction(node, 'All', editor, 'selectAll');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'None', editor, 'selectNone');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'Vertices', editor, 'selectVertices');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'Edges', editor, 'selectEdges');

    // Create select actions in page
    var node = document.getElementById('zoomActions');
    mxUtils.write(node, 'Zoom: ');
    mxUtils.linkAction(node, 'In', editor, 'zoomIn');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'Out', editor, 'zoomOut');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'Actual', editor, 'actualSize');
    mxUtils.write(node, ', ');
    mxUtils.linkAction(node, 'Fit', editor, 'fit');
}

window.onbeforeunload = function() { return mxResources.get('changesLost'); };
</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<BODY onload="new mxApplication('config/diagrameditor.xml');">
<DIV id=page>
    <DIV id=header>
        <DIV style="OVERFLOW: hidden" id=headerimg>
            <H1 id=title>mxDraw</H1></DIV></DIV>
    <DIV
            style="PADDING-BOTTOM: 8px; PADDING-LEFT: 24px; WIDTH: 100%; PADDING-TOP: 8px"
            id=mainActions></DIV>
    <DIV style="PADDING-BOTTOM: 4px; PADDING-LEFT: 54px; WIDTH: 100%"
         id=selectActions></DIV>
    <TABLE border=0 width=730>
        <TBODY>
        <TR>
            <TD style="PADDING-LEFT: 20px; WIDTH: 12px" id=toolbar vAlign=top><!-- Toolbar Here --></TD>
            <TD
                    style="BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-RIGHT: black 1px solid"
                    vAlign=top>
                <DIV
                        style="POSITION: relative; WIDTH: 684px; HEIGHT: 480px; OVERFLOW: hidden; CURSOR: default"
                        id=graph><!-- Graph Here -->
                    <CENTER style="PADDING-TOP: 230px" id=splash>
                    </CENTER></DIV><TEXTAREA style="BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; WIDTH: 684px; DISPLAY: none; BORDER-TOP-STYLE: none; HEIGHT: 480px; BORDER-LEFT-STYLE: none" id=xml></TEXTAREA>
            </TD></TR></TBODY></TABLE><SPAN style="PADDING-RIGHT: 36px; FLOAT: right"><INPUT
        id=source type=checkbox>Source </SPAN>
    <DIV style="PADDING-LEFT: 54px; WIDTH: 100%; PADDING-TOP: 4px"
         id=zoomActions></DIV>
    <DIV id=footer>
        <P id=status><!-- Status Here -->Loading... </P><BR></DIV></DIV></BODY></HTML>
