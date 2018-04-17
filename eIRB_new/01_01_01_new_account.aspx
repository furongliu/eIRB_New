<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_01_01_new_account.aspx.cs" Inherits="eIRB_new._01_01_01_new_account" %>

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
        <button type="button" data-toggle="modal" data-target="#SetRole" id="ClickSetRole" hidden="hidden"></button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="SetRole" role="dialog">
        <div class="modal-dialog modal-sm">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">新增會員帳號與身分</h4>
                </div>
                <div class="modal-body">
                    <input type="text" value="" id="PlusAccount" hidden="hidden" />
                    <div class="form-group" id="SelectRole">
                        <label for="sel1">請選擇此人身分：</label>
                        <select class="form-control" id="sel1">
                            <option value="秘書">秘書</option>
                            <option value="執行秘書">執行秘書</option>
                            <option value="主任委員">主任委員</option>
                            <option value="委託廠商">委託廠商</option>
                            <option value="醫師">醫師</option>
                            <option value="委託機構">委託機構</option>
                            <option value="研究護理師">研究護理師</option>
                            <option value="研究人員">研究人員</option>
                            <option value="CTO管理">CTO管理</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="ClickAdd">新增</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        var PageWidth = $('#main').width() - 10;
        datePick = function (elem) {
            $(elem).datepicker({ format: 'yyyy/mm/dd' });
        }
        $("#jqGrid").jqGrid({
            url: 'HandlerAccountNew.ashx',
            // we set the changes to be made at client side using predefined word clientArray
            datatype: "json",
            colNames: ['核准', '登記日期', '姓名', '帳號', 'Email', '單位廠商名稱', '職稱', '手機', '辦公室電話', '地址', '備註', '刪除'],
            colModel: [
                {
                    index: 'id',
                    name: 'id',
                    align: "center",
                    width: PageWidth * (3 / 84),
                    sortable: false,
                    search:false,
                    formatter: CheckButton
                },
                {
                    index: 'date',
                    name: 'date',
                    align: "left",
                    width: PageWidth * (5 / 84),
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
                    index: 'name',
                    name: 'name',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'account',
                    name: 'account',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'email',
                    name: 'email',
                    align: "left",
                    width: PageWidth * (10 / 84),
                    editable: true, //true就會出現在edit form
                    edittype: "text", //http://www.trirand.com/jqgridwiki/doku.php?id=wiki:common_rules
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'office',
                    name: 'office',
                    align: "left",
                    width: PageWidth * (10 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'job',
                    name: 'job',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'phone1',
                    name: 'phone1',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    sorttype: "float",
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'phone2',
                    name: 'phone2',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    sorttype: "float",
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'address',
                    name: 'address',
                    align: "left",
                    width: PageWidth * (23 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'note',
                    name: 'note',
                    align: "left",
                    width: PageWidth * (5 / 84),
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
            {
                index: 'id',
                name: 'id',
                align: "center",
                width: PageWidth * (3 / 84),
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
            caption: "申請者帳號資料", //jqGrid標題欄顯示的文字
            editurl: 'HandlerAccountNew.ashx',
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
            {
                errorTextFormat: function (data) {
                    return 'Error: ' + data.responseText
                },
            },
            // options for the Search Dailog
        {
        }
        );

        function CheckButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="CheckButtonClick(' + cellvalue + ')" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-ok"></span></button>';
        }

        function CheckButtonClick(id) {
            $('#PlusAccount').val(id);
            $('#ClickSetRole').click();
            //alert(id);
        }

        function RemoveButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="RemoveButtonClick(' + cellvalue + ')" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>';
        }

        function RemoveButtonClick(id) {
            var r = confirm("確定要刪除?");
            if (r == true) {
                a = { 'id': id };
                $.ajax(
                {
                    type: "POST",
                    url: "01_01_01_new_account.aspx/RemoveAccount",
                    data: JSON.stringify(a),
                    datatype: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success:
                        function (data) {
                            alert('刪除成功!');
                            $('#child00').click();//強制刷新頁面
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

            $('#ClickAdd').click(function () {
                a = { 'id': $('#PlusAccount').val(), 'identity': $('#SelectRole :selected').text() };
                $.ajax(
                {
                    type: "POST",
                    url: "01_01_01_new_account.aspx/AddAccount",
                    data: JSON.stringify(a),
                    datatype: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success:
                        function (data) {
                            alert('新增成功!');
                            $('#child00').click();//強制刷新頁面
                        },
                    failure:
                        function () {
                            alert('Insert Error');
                        }
                });
            });
        })
    </script>


</body>
</html>
