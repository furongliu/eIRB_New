<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_05_02_visit.aspx.cs" Inherits="eIRB_new._01_05_02_visit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script src="bootstrap/js/jquery.min.js" type="text/ecmascript"></script>
    <!-- We support more than 40 localizations -->
    <script src="bootstrap/js/trirand/i18n/grid.locale-tw.js" type="text/ecmascript"></script>
    <!-- This is the Javascript file of jqGrid -->
    <script src="bootstrap/js/trirand/src/jquery.jqGrid.js"></script>
    <!-- A link to a Boostrap  and jqGrid Bootstrap CSS siles-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="bootstrap/css/trirand/ui.jqgrid-bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
    <script>
        $.jgrid.defaults.width = $('#main').width() - 10;
        $.jgrid.defaults.responsive = true;
        $.jgrid.defaults.styleUI = 'Bootstrap';
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link href="Content/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <meta charset="utf-8" />
    <title></title>
    <style>
        body {
            font-family: 'Microsoft JhengHei';
        }
        
    </style>
</head>
<body>
    <div style="margin-left: 0px;margin-bottom: 10%;">
        <table id="jqGrid"></table>
        <div id="jqGridPager"></div>
    </div>
    
    <script type="text/javascript">
        var PageWidth = $('#main').width() - 10;
        datePick = function (elem) {
            $(elem).datepicker({ format: 'yyyy/mm/dd' });
        }
        $("#jqGrid").jqGrid({
            url: 'HandlerVisit.ashx',
            // we set the changes to be made at client side using predefined word clientArray
            datatype: "json",
            colNames: ['登入帳號', '登入姓名', '登入身分', '登入日期', '登入IP'],
            colModel: [
                {
                    index: 'account',
                    name: 'account',
                    align: "left",
                    width: PageWidth * (1 / 5),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'name',
                    name: 'name',
                    align: "left",
                    width: PageWidth * (1 / 5),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'identity',
                    name: 'identity',
                    align: "left",
                    width: PageWidth * (1 / 5),
                    sortable: true,
                    search: true,
                    stype: 'select',
                    searchoptions: {
                        value: getAllSelectOptions,
                        sopt: ['eq']
                    },
                    editable: true,
                    edittype: 'select',
                    formatter: 'text',
                    editoptions: {
                        value: getAllSelectOptions,
                        defaultValue: '尚未指定'
                    },
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'date',
                    name: 'date',
                    align: "left",
                    width: PageWidth * (1 / 5),
                    sortable: true,
                    sorttype: 'date',
                    datefmt:'Y/m/d',
                    search: true,
                    stype:'text',
                    searchoptions: {
                        dataInit:datePick,
                        sopt: ['eq','lt','le','gt','ge']
                    },
                    searchrules: {
                        required: true,
                        date:true,
                    },
                    formatter: 'date',
                    formatoptions: { srcformat: "Y/m/d", newformat: "Y/m/d" },
                },
                {
                    index: 'ip',
                    name: 'ip',
                    align: "left",
                    width: PageWidth * (1 / 5),
                    editable: true, //true就會出現在edit form
                    edittype: "text", //http://www.trirand.com/jqgridwiki/doku.php?id=wiki:common_rules
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
            ],
            sortname: 'date',
            sortorder: 'desc',
            loadonce: true, //是否只載入一次
            //onSelectRow: editRow, // the javascript function to call on row click. will ues to to put the row in edit mode
            viewrecords: true, //是否要顯示總筆數
            height: '100%', //jqGrid的高度
            //width: '100%',
            rowNum: 10, //jqGrid預設顯示筆數
            rowList: [10, 20, 50, 100], //jqGrid可選擇每頁顯示幾筆
            altRows: true, //竒偶行顏色區分
            caption: "登入資訊", //jqGrid標題欄顯示的文字
            editurl: 'HandlerVisit.ashx',
            mtype: 'GET',
            jsonReader: { repeatitems: false },
            pager: "#jqGridPager" //這是對應到<div>的id，會透過<div>變成分頁的相關UI
        });

        

        $('#jqGrid').navGrid('#jqGridPager',
            // the buttons to appear on the toolbar of the grid
            {
                edit: false, add: false, del: false, search: true, refresh: true, view: false, position: "left", cloneToTop: false,
                searchtext: "尋找", addtext: "新增", edittext: "編輯", deltext: "刪除", refreshtext:"重新整理"
            },
            // options for the Edit Dialog
            {},
            // options for the Add Dialog
            {},
            // options for the Delete Dailog
            {
            },
            // options for the Search Dailog
        {
        }
        );

        function getAllSelectOptions() {
            var states = {
                '尚未指定': '尚未指定',
                '秘書': '秘書',
                '執行秘書': '執行秘書',
                '主任委員': '主任委員',
                '委託廠商': '委託廠商',
                '醫師': '醫師',
                '委託機構': '委託機構',
                '研究護理師': '研究護理師',
                '研究人員': '研究人員',
                'CTO管理': 'CTO管理'
            };
            return states;
        };

        $(document).ready(function () {
            $('.ui-th-div').attr('style', 'text-align:center');
            $('.ui-jqgrid-titlebar-close').hide();
            $('#jqGridPager_center').css('width', 'auto');
        });
    </script>


</body>
</html>