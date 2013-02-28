<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../import.jsp" %>
<%
    String documentid = StringUtil.parseNull(request.getParameter("documentid"), "");
    String processId  = StringUtil.parseNull(request.getParameter("processId"),"");
    Map map1 = new HashMap();
    map1.put("documentid", documentid);
    OfficeWjsp wjsp = officeWjspDAO.queryForBean(map1);
    wjsp = wjsp == null ? new OfficeWjsp() : wjsp;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:w="urn:schemas-microsoft-com:office:word"
      xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
      xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List href="xwd/filelist.xml">
<link rel=Edit-Time-Data href="xwd/editdata.mso">
<!--[if !mso]>
<style>
    v\:* {
        behavior: url(#default#VML);
    }

    o\:* {
        behavior: url(#default#VML);
    }

    w\:* {
        behavior: url(#default#VML);
    }

    .shape {
        behavior: url(#default#VML);
    }
</style>
<![endif]-->
<title>中共黄河钻井总公司钻井三公司委员会文件签文</title>
<!--[if gte mso 9]>
<xml>
    <o:DocumentProperties>
        <o:Author>user</o:Author>
        <o:Template>Normal</o:Template>
        <o:LastAuthor>blue</o:LastAuthor>
        <o:Revision>2</o:Revision>
        <o:TotalTime>2833</o:TotalTime>
        <o:LastPrinted>2013-02-27T09:24:00Z</o:LastPrinted>
        <o:Created>2013-02-27T09:26:00Z</o:Created>
        <o:LastSaved>2013-02-27T09:26:00Z</o:LastSaved>
        <o:Pages>1</o:Pages>
        <o:Words>33</o:Words>
        <o:Characters>190</o:Characters>
        <o:Company>zj3domain</o:Company>
        <o:Lines>1</o:Lines>
        <o:Paragraphs>1</o:Paragraphs>
        <o:CharactersWithSpaces>222</o:CharactersWithSpaces>
        <o:Version>15.00</o:Version>
    </o:DocumentProperties>
    <o:OfficeDocumentSettings>
        <o:TargetScreenSize>800x600</o:TargetScreenSize>
    </o:OfficeDocumentSettings>
</xml><![endif]-->
<link rel=themeData href="xwd/themedata.thmx">
<link rel=colorSchemeMapping href="xwd/colorschememapping.xml">
<!--[if gte mso 9]>
<xml>
    <w:WordDocument>
        <w:GrammarState>Clean</w:GrammarState>
        <w:TrackMoves>false</w:TrackMoves>
        <w:TrackFormatting/>
        <w:PunctuationKerning/>
        <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>
        <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
        <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
        <w:ValidateAgainstSchemas/>
        <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
        <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
        <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
        <w:DoNotPromoteQF/>
        <w:LidThemeOther>EN-US</w:LidThemeOther>
        <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
        <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
        <w:Compatibility>
            <w:SpaceForUL/>
            <w:BalanceSingleByteDoubleByteWidth/>
            <w:DoNotLeaveBackslashAlone/>
            <w:ULTrailSpace/>
            <w:DoNotExpandShiftReturn/>
            <w:AdjustLineHeightInTable/>
            <w:BreakWrappedTables/>
            <w:SnapToGridInCell/>
            <w:WrapTextWithPunct/>
            <w:UseAsianBreakRules/>
            <w:UseWord2002TableStyleRules/>
            <w:UseWord2010TableStyleRules/>
            <w:DontUseIndentAsNumberingTabStop/>
            <w:FELineBreak11/>
            <w:WW11IndentRules/>
            <w:DontAutofitConstrainedTables/>
            <w:AutofitLikeWW11/>
            <w:HangulWidthLikeWW11/>
            <w:UseNormalStyleForList/>
            <w:DontVertAlignCellWithSp/>
            <w:DontBreakConstrainedForcedTables/>
            <w:DontVertAlignInTxbx/>
            <w:Word11KerningPairs/>
            <w:CachedColBalance/>
            <w:UseFELayout/>
        </w:Compatibility>
        <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
        <m:mathPr>
            <m:mathFont m:val="Cambria Math"/>
            <m:brkBin m:val="before"/>
            <m:brkBinSub m:val="&#45;-"/>
            <m:smallFrac m:val="off"/>
            <m:dispDef/>
            <m:lMargin m:val="0"/>
            <m:rMargin m:val="0"/>
            <m:defJc m:val="centerGroup"/>
            <m:wrapIndent m:val="1440"/>
            <m:intLim m:val="subSup"/>
            <m:naryLim m:val="undOvr"/>
        </m:mathPr>
    </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]>
<xml>
<w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
                DefSemiHidden="false" DefQFormat="false" LatentStyleCount="371">
<w:LsdException Locked="false" QFormat="true" Name="Normal"/>
<w:LsdException Locked="false" QFormat="true" Name="heading 1"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 2"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 3"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 4"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 5"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 6"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 7"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 8"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="heading 9"/>
<w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
                QFormat="true" Name="caption"/>
<w:LsdException Locked="false" QFormat="true" Name="Title"/>
<w:LsdException Locked="false" QFormat="true" Name="Subtitle"/>
<w:LsdException Locked="false" QFormat="true" Name="Strong"/>
<w:LsdException Locked="false" QFormat="true" Name="Emphasis"/>
<w:LsdException Locked="false" Priority="99" SemiHidden="true"
                Name="Placeholder Text"/>
<w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
<w:LsdException Locked="false" Priority="61" Name="Light List"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
<w:LsdException Locked="false" Priority="99" SemiHidden="true" Name="Revision"/>
<w:LsdException Locked="false" Priority="34" QFormat="true"
                Name="List Paragraph"/>
<w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
<w:LsdException Locked="false" Priority="30" QFormat="true"
                Name="Intense Quote"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
<w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
<w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
<w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
<w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
<w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
<w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
<w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
<w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
<w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
<w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
<w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
<w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
<w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
<w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
<w:LsdException Locked="false" Priority="19" QFormat="true"
                Name="Subtle Emphasis"/>
<w:LsdException Locked="false" Priority="21" QFormat="true"
                Name="Intense Emphasis"/>
<w:LsdException Locked="false" Priority="31" QFormat="true"
                Name="Subtle Reference"/>
<w:LsdException Locked="false" Priority="32" QFormat="true"
                Name="Intense Reference"/>
<w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
<w:LsdException Locked="false" Priority="37" SemiHidden="true"
                UnhideWhenUsed="true" Name="Bibliography"/>
<w:LsdException Locked="false" Priority="39" SemiHidden="true"
                UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
<w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
<w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
<w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
<w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
<w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
<w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
<w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
<w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
<w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 1"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 1"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 1"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 2"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 2"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 2"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 3"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 3"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 3"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 4"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 4"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 4"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 5"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 5"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 5"/>
<w:LsdException Locked="false" Priority="46"
                Name="Grid Table 1 Light Accent 6"/>
<w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
<w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
<w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
<w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
<w:LsdException Locked="false" Priority="51"
                Name="Grid Table 6 Colorful Accent 6"/>
<w:LsdException Locked="false" Priority="52"
                Name="Grid Table 7 Colorful Accent 6"/>
<w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
<w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
<w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 1"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 1"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 1"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 2"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 2"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 2"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 3"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 3"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 3"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 4"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 4"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 4"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 5"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 5"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 5"/>
<w:LsdException Locked="false" Priority="46"
                Name="List Table 1 Light Accent 6"/>
<w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
<w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
<w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
<w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
<w:LsdException Locked="false" Priority="51"
                Name="List Table 6 Colorful Accent 6"/>
<w:LsdException Locked="false" Priority="52"
                Name="List Table 7 Colorful Accent 6"/>
</w:LatentStyles>
</xml><![endif]-->
<style>
    <!--
        /* Font Definitions */
    @font-face {
        font-family: 宋 体;
        panose-1: 2 1 6 0 3 1 1 1 1 1;
        mso-font-alt: SimSun;
        mso-font-charset: 134;
        mso-generic-font-family: auto;
        mso-font-pitch: variable;
        mso-font-signature: 3 680460288 22 0 262145 0;
    }

    @font-face {
        font-family: "Cambria Math";
        panose-1: 2 4 5 3 5 4 6 3 2 4;
        mso-font-charset: 0;
        mso-generic-font-family: roman;
        mso-font-pitch: variable;
        mso-font-signature: -536870145 1107305727 0 0 415 0;
    }

    @font-face {
        font-family: "\@宋体";
        panose-1: 2 1 6 0 3 1 1 1 1 1;
        mso-font-charset: 134;
        mso-generic-font-family: auto;
        mso-font-pitch: variable;
        mso-font-signature: 3 680460288 22 0 262145 0;
    }

        /* Style Definitions */
    p.MsoNormal, li.MsoNormal, div.MsoNormal {
        mso-style-unhide: no;
        mso-style-qformat: yes;
        mso-style-parent: "";
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: none;
        font-size: 10.5pt;
        mso-bidi-font-size: 12.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋 体;
        mso-font-kerning: 1.0pt;
    }

    p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
        mso-style-noshow: yes;
        mso-style-unhide: no;
        margin: 0cm;
        margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: none;
        font-size: 9.0pt;
        font-family: "Times New Roman", "serif";
        mso-fareast-font-family: 宋 体;
        mso-font-kerning: 1.0pt;
    }

    span.GramE {
        mso-style-name: "";
        mso-gram-e: yes;
    }

    .MsoChpDefault {
        mso-style-type: export-only;
        mso-default-props: yes;
        mso-fareast-font-family: 宋 体;
    }

        /* Page Definitions */
    @page {
        mso-page-border-surround-header: no;
        mso-page-border-surround-footer: no;
    }

    @page WordSection1 {
        size: 595.3pt 841.9pt;
        margin: 72.0pt 90.0pt 72.0pt 90.0pt;
        mso-header-margin: 42.55pt;
        mso-footer-margin: 49.6pt;
        mso-paper-source: 0;
        layout-grid: 15.6pt;
    }

    div.WordSection1 {
        page: WordSection1;
    }

    -->
</style>
<!--[if gte mso 10]>
<style>
        /* Style Definitions */
    table.MsoNormalTable {
        mso-style-name: 普 通 表 格;
        mso-tstyle-rowband-size: 0;
        mso-tstyle-colband-size: 0;
        mso-style-noshow: yes;
        mso-style-unhide: no;
        mso-style-parent: "";
        mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;
        mso-para-margin: 0cm;
        mso-para-margin-bottom: .0001pt;
        mso-pagination: widow-orphan;
        font-size: 10.0pt;
        font-family: "Times New Roman", "serif";
    }

    table.MsoTableGrid {
        mso-style-name: 网 格 型;
        mso-tstyle-rowband-size: 0;
        mso-tstyle-colband-size: 0;
        mso-style-unhide: no;
        border: solid windowtext 1.0pt;
        mso-border-alt: solid windowtext .5pt;
        mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;
        mso-border-insideh: .5pt solid windowtext;
        mso-border-insidev: .5pt solid windowtext;
        mso-para-margin: 0cm;
        mso-para-margin-bottom: .0001pt;
        text-align: justify;
        text-justify: inter-ideograph;
        mso-pagination: none;
        font-size: 10.0pt;
        font-family: "Times New Roman", "serif";
    }
</style>

<![endif]--><!--[if gte mso 9]>
<xml>
    <o:shapedefaults v:ext="edit" spidmax="1062"/>
</xml><![endif]--><!--[if gte mso 9]>
<xml>
    <o:shapelayout v:ext="edit">
        <o:idmap v:ext="edit" data="1"/>
    </o:shapelayout>
</xml><![endif]-->
<style media=print>
    .Noprint {
        display: none;
    }
</style>
<script type="text/javascript">
    // --- 为控件设置要签名的数据
    function SetStore() {
        var str;
        var separator = "::";  // 分隔符
        str = "";
        document.all.DWebSignSeal.SetSignData("-");
        document.all.DWebSignSeal.SetSignData("+DATA:" + str);
    }
    function LoadSignData() {
<%
    Map spyjMap = oDao.getSpyjByItemIdAndProcessId("12b8822d-9f55-4cf6-82aa-4463ceb317f7",processId);   //
    String spyj = StringUtil.parseNull(spyjMap.get("SPYJ"),"");
    String LRR = StringUtil.parseNull(spyjMap.get("LRR"),"");
    java.util.Date lrsj = (java.util.Date)spyjMap.get("LRSJ");
    String rq = "";
    if(lrsj != null){
        rq = DateUtil.format(lrsj,"yyyy年MM月dd日");
    }
    Map spyjMap1 = oDao.getSpyjByItemIdAndProcessId("8c4218ad-072d-45f2-a9c3-e0a4c5c1ce0d",processId);
    String spyj1 = StringUtil.parseNull(spyjMap1.get("SPYJ"),"");
    String LRR1 = StringUtil.parseNull(spyjMap1.get("LRR"),"");
    java.util.Date lrsj1 = (java.util.Date)spyjMap1.get("LRSJ");
    String rq1 = "";
    if(lrsj1 != null){
        rq1 = DateUtil.format(lrsj1,"yyyy年MM月dd日");
    }
%>
        addSealB("<%=0%>","<%=LRR%>");
        addSealB("<%=1%>","<%=LRR1%>");
    }
    var qz = 0;
    function addSealB(index, userid) {
        SetStore();
        var shr = 'shr' + index;
        document.all.DWebSignSeal.SetPosition(-140, -20, shr);
        var sealURL = '<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()+"/servlet/sealDown?userId="%>' + userid;
        document.all.DWebSignSeal.AddSeal(sealURL, "");
    }
</script>
</head>

<body lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation' onload="LoadSignData()">
<object id="factory" viewastext style="display:none"
        classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="<%="http://"+sysConfig.getProperty("sealServer")+":"+request.getLocalPort()+request.getContextPath()%>/soft/smsx.cab#Version=7,0,0,8">
</object>
<script defer>
    //打印组件通用设置
    factory.printing.header = "";//页眉
    factory.printing.footer = "";//页脚
    factory.printing.leftMargin = 0;//左边距
    factory.printing.topMargin = 0;//上边距
    factory.printing.rightMargin = 0;//右边距
    factory.printing.bottomMargin = 0;//下边距
</script>
<div class=WordSection1 style='layout-grid:15.6pt'>
<table align="center">
    <tr>
        <td class="Noprint">
            <input name="button" type="button" class="button" value="打印预览" onClick="factory.printing.Preview();"/>
            <input name="submit" type="submit" class="button" value="关闭" onClick="window.close();">
            <!-- SignData隐藏域，用于将所有加密的数据提交到表单保存页面 -->
            <input type="hidden" id="signdata" name="signdata"/>
        </td>
    </tr>
</table>
<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:18.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:22.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>行</span></b><b
        style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:22.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></b><b
        style='mso-bidi-font-weight:normal'><span style='font-size:22.0pt;font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>文</span></b><b
        style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:22.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></b><b
        style='mso-bidi-font-weight:normal'><span style='font-size:22.0pt;font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>纸</span></b><b
        style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:22.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>记录表式：</span><span
        lang=EN-US style='font-size:16.0pt'><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>编号：<span
        class=GramE>公文-4</span></span><span
        style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>号</span><span lang=EN-US
                                                       style='font-size:16.0pt'><o:p></o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><!--[if gte vml 1]>
    <v:line
            id="_x0000_s1031" style='position:absolute;z-index:251654144' from="0,0" to="405pt,0"
            strokeweight="2.25pt"/>
    <br>
    <![endif]--><![if !vml]><span style='mso-ignore:vglayout;
position:relative;z-index:251654144'><span style='position:absolute;left:-2px;
top:-2px;width:544px;height:4px'><img width=544 height=4
                                      src="xwd/image001.gif" v:shapes="_x0000_s1031"></span></span><![endif]><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>文号：</span><span lang=EN-US
                                                         style='font-size:16.0pt'><o:p><%=StringUtil.parseNull(wjsp.getWjbh(), "")%>
    </o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><!--[if gte vml 1]>
    <v:line
            id="_x0000_s1058" style='position:absolute;z-index:251658240' from="0,0" to="405pt,0"/><![endif]--><![if
    !vml]><span
            style='mso-ignore:vglayout;position:relative;z-index:251658240'><span
            style='position:absolute;left:-1px;top:-1px;width:542px;height:2px'><img
            width=542 height=2 src="xwd/image002.gif" v:shapes="_x0000_s1058"></span></span><![endif]><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>签发人：</span><span lang=EN-US
                                                          style='font-size:16.0pt'><o:p></o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><span lang=EN-US
                                                            style='font-size:16.0pt'><o:p>&nbsp;<%=spyj%></o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt' id="shr0"><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[if gte vml 1]>
    <v:line id="_x0000_s1034" style='position:absolute;
 left:0;text-align:left;z-index:251655168;mso-position-horizontal-relative:text;
 mso-position-vertical-relative:text' from="0,23.4pt" to="414pt,23.4pt"/><![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:absolute;z-index:251655168;left:0px;
margin-left:-1px;margin-top:30px;width:554px;height:2px'><img width=554
                                                              height=2 src="xwd/image003.gif"
                                                              v:shapes="_x0000_s1034"></span><![endif]><span
            lang=EN-US style='font-size:16.0pt'><span
            style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'><%=rq%></span></p>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>标题：</span><span
        lang=EN-US style='font-size:16.0pt'><o:p><%=StringUtil.parseNull(wjsp.getBt(), "")%>
</o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><!--[if gte vml 1]>
    <v:line id="_x0000_s1059" style='position:absolute;
 left:0;text-align:left;z-index:251659264' from="0,20.85pt" to="414pt,20.85pt"/><![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:relative;z-index:251659264;left:-1px;
top:27px;width:554px;height:29px'><img width=554 height=2
                                       src="xwd/image004.gif" v:shapes="_x0000_s1059"></span><![endif]><span
            lang=EN-US style='font-size:16.0pt'><o:p>&nbsp;</o:p></span></p>

<br style='mso-ignore:vglayout' clear=ALL>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>主办单位：</span><span
        lang=EN-US style='font-size:16.0pt'><o:p>
    <%
        Map paramMap = new HashMap();
        paramMap.put("orgnaId",wjsp.getNgbm());
        COrgnization cOrgnization = orgnizationDAO.queryForBean(paramMap);
        cOrgnization = cOrgnization == null?new COrgnization():cOrgnization;
    %>
    <%=StringUtil.parseNull(cOrgnization.getOrgnaName(), "")%>
</o:p></span></p>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>拟</span><span
        style='font-size:16.0pt'> </span><span style='font-size:16.0pt;font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>稿</span><span
        style='font-size:16.0pt'> </span><span style='font-size:16.0pt;font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>人：</span><span
        lang=EN-US style='font-size:16.0pt'><o:p>  <%
    Map paramMap1 = new HashMap();
    paramMap1.put("userId",wjsp.getSqr());
    CUser cUser1 = userDAO.queryForBean(paramMap1);
    cUser1 =cUser1 == null?new CUser():cUser1;
%>
    <%=StringUtil.parseNull(cUser1.getRealName(), "")%></o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><o:p>&nbsp;
  </o:p></span></p>
  <%
      java.util.Date qfrq = wjsp.getQfrq();

  %>
<p class=MsoNormal style='text-indent:204.0pt;mso-char-indent-count:19.0'><span
        style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'><%=DateUtil.getYear(qfrq)%>年<%=DateUtil.getMonth(qfrq)%>月<%=DateUtil.getDay(qfrq)%>日</span><span lang=EN-US
                                                       style='font-size:16.0pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><!--[if gte vml 1]>
    <v:line
            id="_x0000_s1037" style='position:absolute;left:0;text-align:left;z-index:251656192;
 mso-position-horizontal-relative:text;mso-position-vertical-relative:text'
            from="0,23.4pt" to="414pt,23.4pt"/><![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:absolute;z-index:251656192;left:0px;
margin-left:-1px;margin-top:30px;width:554px;height:2px'><img width=554
                                                              height=2 src="xwd/image003.gif"
                                                              v:shapes="_x0000_s1037"></span><![endif]>
    <!--[if gte vml 1]>
    <v:line
            id="_x0000_s1049" style='position:absolute;left:0;text-align:left;z-index:251657216;
 mso-position-horizontal-relative:text;mso-position-vertical-relative:text'
            from="189pt,23.4pt" to="189pt,124.8pt"/><![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:absolute;z-index:251657216;left:0px;
margin-left:251px;margin-top:30px;width:2px;height:137px'><img width=2
                                                               height=137 src="xwd/image005.gif"
                                                               v:shapes="_x0000_s1049"></span><![endif]><span
            lang=EN-US style='font-size:16.0pt'><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>办公室核稿：</span><span
        lang=EN-US style='font-size:16.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%=StringUtil.parseNull(wjsp.getBgshg(), "")%>

</span></span><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;办公室主任审核：</span><span
        lang=EN-US style='font-size:16.0pt'><o:p></o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><o:p>&nbsp;<%=spyj1%></o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-size:16.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp; </span><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
        style='mso-spacerun:yes'>&nbsp;</span></span><span style='font-size:16.0pt;
font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'><%=rq1%></span><span lang=EN-US style='font-size:16.0pt'><span
        style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年</span><span
        lang=EN-US style='font-size:16.0pt'><span style='mso-spacerun:yes'>&nbsp;
</span><span style='mso-spacerun:yes'>&nbsp;</span></span><span
        style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>月</span><span lang=EN-US
                                                       style='font-size:16.0pt'><span
        style='mso-spacerun:yes'>&nbsp; </span><span
        style='mso-spacerun:yes'>&nbsp;</span></span><span style='font-size:16.0pt;
font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>日</span><span style='font-size:16.0pt'> <span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal><!--[if gte vml 1]>
    <v:line id="_x0000_s1060" style='position:absolute;
 left:0;text-align:left;z-index:251660288' from=".75pt,1.5pt" to="414.75pt,1.5pt"/>
    <br>
    <![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:absolute;z-index:251660288;left:0px;
margin-left:0px;margin-top:1px;width:554px;height:2px'><img width=554 height=2
                                                            src="xwd/image004.gif" v:shapes="_x0000_s1060"></span><![endif]><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>发：</span><span lang=EN-US
                                                        style='font-size:16.0pt'><o:p><%=StringUtil.parseNull(wjsp.getFa(), "")%>
    </o:p></span></p>

<p class=MsoNormal style='margin-left:336.0pt;text-indent:21.0pt'><!--[if gte vml 1]>
    <v:line
            id="_x0000_s1061" style='position:absolute;left:0;text-align:left;z-index:251661312'
            from=".55pt,4.8pt" to="414.55pt,4.8pt" strokeweight="2.25pt"/>
    <br>
    <![endif]--><![if !vml]><span
            style='mso-ignore:vglayout;position:absolute;z-index:251661312;left:0px;
margin-left:-1px;margin-top:4px;width:556px;height:4px'><img width=556
                                                             height=4 src="xwd/image006.gif"
                                                             v:shapes="_x0000_s1061"></span><![endif]><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>印</span><span lang=EN-US
                                                       style='font-size:16.0pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; <%=StringUtil.parseNull(wjsp.getGyfs(), "")%></span></span><span
            style='font-size:16.0pt;font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>份</span><span lang=EN-US
                                                       style='font-size:16.0pt'><o:p></o:p></span></p>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Loadwebsign.js"></script>
<script type="text/javascript">
    document.all.DWebSignSeal.SetCurrUser("");
</script>
</body>
</html>
