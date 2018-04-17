<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02_02_02_edit_plan.aspx.cs" Inherits="eIRB_new._02_02_02_edit_plan" %>

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
            url: 'HandlerEditPlan.ashx',
            // we set the changes to be made at client side using predefined word clientArray
            datatype: "json",
            colNames: ['編輯', '案件類別', '案件編號', '中文計畫名稱', '計畫主持人', '協同主持人', '權限', '刪除'],
            colModel: [
                {
                    index: 'CaseNo',
                    name: 'CaseNo',
                    align: "center",
                    width: PageWidth * (2 / 48),
                    sortable: false,
                    search:false,
                    formatter: EditButton
                },
                {
                    index: 'CaseType',
                    name: 'CaseType',
                    align: "center",
                    width: PageWidth * (5 / 48),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'CaseNo',
                    name: 'CaseNo',
                    align: "center",
                    width: PageWidth * (6 / 48),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'CHName',
                    name: 'CHName',
                    align: "left",
                    width: PageWidth * (15 / 48),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'PI',
                    name: 'PI',
                    align: "center",
                    width: PageWidth * (4 / 48),
                    editable: true, 
                    edittype: "text", 
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'CorPI',
                    name: 'CorPI',
                    align: "left",
                    width: PageWidth * (10 / 48),
                    editable: true,
                    edittype: "text", 
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'Authority',
                    name: 'Authority',
                    align: "center",
                    width: PageWidth * (4 / 48),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
            {
                index: 'CaseNo',
                name: 'CaseNo',
                align: "center",
                width: PageWidth * (2 / 48),
                sortable: false,
                search: false,
                formatter: RemoveButton
            },
            ],
            sortname: 'id',
            sortorder: 'asc',
            loadonce: true, //是否只載入一次
            //onSelectRow: editRow, // the javascript function to call on row click. will ues to to put the row in edit mode
            viewrecords: true, //是否要顯示總筆數
            height: '100%', //jqGrid的高度
            //width: '100%',
            rowNum: 10, //jqGrid預設顯示筆數
            rowList: [10, 20, 50, 100], //jqGrid可選擇每頁顯示幾筆
            altRows: true, //竒偶行顏色區分
            caption: "編輯中的案件清單", //jqGrid標題欄顯示的文字
            editurl: 'HandlerEditPlan.ashx',
            mtype: 'GET',
            jsonReader: { repeatitems: false },
            pager: "#jqGridPager" //這是對應到<div>的id，會透過<div>變成分頁的相關UI
        });

        $('#jqGrid').navGrid('#jqGridPager',
            // the buttons to appear on the toolbar of the grid
            {
                edit: false, add: false, del: false, search: true, refresh: true, view: false, position: "left", cloneToTop: false,
                searchtext: "尋找", addtext: "新增", edittext: "編輯", deltext: "刪除", refreshtext: "重新整理"
            },
            // options for the Edit Dialog
            {},
            // options for the Add Dialog
            {},
            // options for the Delete Dailog
            {},
            // options for the Search Dailog
        {
        }
        );

        function EditButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="EditButtonClick(' + cellvalue + ')" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span></button>';
        }

        function EditButtonClick(CaseNo) {
            $('#main').load('02_02_01_new_plan.aspx');//載入主畫面
            $('#location3').html('<span class="glyphicon glyphicon-forward"></span>' + CaseNo);//案件編號
        }

        function RemoveButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="RemoveButtonClick(' + cellvalue + ')" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>';
        }

        function RemoveButtonClick(CaseNo) {
            var r = confirm("確定要刪除?");
            if (r == true) {
                a = { 'CaseNo': CaseNo };
                $.ajax(
                {
                    type: "POST",
                    url: "02_02_02_edit_plan.aspx/RemoveCase",
                    data: JSON.stringify(a),
                    datatype: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success:
                        function (data) {
                            alert('刪除成功!');
                            $('#child11').click();//強制刷新頁面
                        },
                    failure:
                        function () {
                            alert('Insert Error');
                        }
                });
            }
        }

        $(document).ready(function () {
            $('.ui-th-div').attr('style', 'text-align:center');
            $('.ui-jqgrid-titlebar-close').hide();
            //$("#jqGrid").hideCol(['id']);
            $('#jqGridPager_center').css('width', 'auto');
            $('#alertmod_jqGrid').hide();//警告 請選擇列跳出來隱藏
        })
    </script>


</body>
</html>