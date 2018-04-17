<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_05_03_account.aspx.cs" Inherits="eIRB_new._01_05_03_account" %>

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

    <script type="text/javascript">
        var PageWidth = $('#main').width() - 10;
        $("#jqGrid").jqGrid({
            url: 'HandlerAccount.ashx',
            // we set the changes to be made at client side using predefined word clientArray
            datatype: "json",
            colNames: ['編輯', '身分', '姓名', '帳號', '密碼', 'Email', '單位廠商名稱', '職稱', '手機', '辦公室電話', '地址', '傳真', '狀態', '刪除'],
            colModel: [
                {
                    index: 'id',
                    name: 'id',
                    align: "center",
                    width: PageWidth * (3 / 107),
                    sortable: false,
                    search:false,
                    formatter: EditButton
                },
                {
                    index: 'identity',
                    name: 'identity',
                    align: "left",
                    width: PageWidth * (5 / 107),
                    sortable: true,
                    search: true,
                    stype: 'select',
                    searchoptions:{
                        value: getAllSelectOptions,
                        sopt:['eq']
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
                    index: 'name',
                    name: 'name',
                    align: "left",
                    width: PageWidth * (5 / 107),
                    editable: true,
                    edittype: "text",
                    search: true,
                    searchoptions:{
                        sopt:['eq','cn','nc']
                    },
                    sortable: true,
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'account',
                    name: 'account',
                    align: "left",
                    width: PageWidth * (5 / 107),
                    editable: true, //true就會出現在edit form
                    edittype: "text", //http://www.trirand.com/jqgridwiki/doku.php?id=wiki:common_rules
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editoptions: {
                        readonly: "readonly",
                        dataEvents: [{
                            type: 'change',
                            fn:
                              function (e) {
                                  $.ajax(
                                     {
                                         type: "POST",
                                         url: "01_05_03_account.aspx/AccountDataCheck",
                                         data: JSON.stringify({ 'account': $(e.target).val() }),
                                         datatype: 'json',
                                         contentType: 'application/json;charset=utf-8',
                                         success:
                                             function (data) {
                                                 var v = jQuery.parseJSON(data.d);
                                                 if (parseInt(v.Account) > 0) {
                                                     alert('資料重覆');
                                                     $(e.target).val('');
                                                 }
                                                 return data.d;
                                             },
                                         failure:
                                             function () {
                                                 alert('Insert Error');
                                             }
                                     });
                              }
                        }],
                    },
                    editrules: { //可做validation
                        required: true,
                        custom: true,
                        custom_func: AccountLength
                    }
                },
                {
                    index: 'password',
                    name: 'password',
                    align: "left",
                    width: PageWidth * (8 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: false,
                    editrules: { //可做validation
                        required: true,
                        custom: true,
                        custom_func: PasswordLength
                    }
                },
                {
                    index: 'email',
                    name: 'email',
                    align: "left",
                    width: PageWidth * (15 / 107),
                    editable: true, //true就會出現在edit form
                    edittype: "text", //http://www.trirand.com/jqgridwiki/doku.php?id=wiki:common_rules
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editrules: { //可做validation
                        email: true,
                        required: true,
                    }
                },
                {
                    index: 'office',
                    name: 'office',
                    align: "left",
                    width: PageWidth * (15 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'job',
                    name: 'job',
                    align: "left",
                    width: PageWidth * (5 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'phone1',
                    name: 'phone1',
                    align: "left",
                    width: PageWidth * (8 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    sorttype: "float",
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'phone2',
                    name: 'phone2',
                    align: "left",
                    width: PageWidth * (6 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    sorttype: "float",
                },
                {
                    index: 'address',
                    name: 'address',
                    align: "left",
                    width: PageWidth * (20 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                    editrules: { //可做validation
                        required: true,
                    }
                },
                {
                    index: 'fex',
                    name: 'fex',
                    align: "left",
                    width: PageWidth * (6 / 107),
                    editable: true,
                    edittype: "text",
                    sortable: true,
                    search: true,
                    searchoptions: {
                        sopt: ['eq', 'cn', 'nc']
                    },
                },
                {
                    index: 'status',
                    name: 'status',
                    align: "left",
                    width: PageWidth * (3 / 107),
                    editable: true,
                    edittype: "select",
                    sortable: true,
                    search: true,
                    stype: 'select',
                    searchoptions:{
                        value: {
                            '0': '停用',
                            '1': '啟用'
                        },
                        sopt:['eq']
                    },
                    editoptions: {
                        value: {
                            '0': '停用',
                            '1': '啟用'
                        },
                    },
                    editrules: { //可做validation
                        required: true,
                    },
                    formatter: StatusText
                },
            {
                index: 'id',
                name: 'id',
                align: "center",
                width: PageWidth * (3 / 107),
                sortable: false,
                search:false,
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
            caption: "使用者帳號資料", //jqGrid標題欄顯示的文字
            editurl: 'HandlerAccount.ashx',
            mtype: 'GET',
            jsonReader: { repeatitems: false },
            pager: "#jqGridPager" //這是對應到<div>的id，會透過<div>變成分頁的相關UI
        });

        $('#jqGrid').navGrid('#jqGridPager',
            // the buttons to appear on the toolbar of the grid
            {
                edit: true, add: true, del: true, search: true, refresh: true, view: false, position: "left", cloneToTop: false,
                searchtext: "尋找", addtext: "新增", edittext: "編輯", deltext: "刪除", refreshtext: "重新整理"
            },
            // options for the Edit Dialog
            {
                closeOnEscape: true,
                closeAfterEdit: true,
                reloadAfterSubmit: true,
                afterSubmit: function (response, postdata) {
                    if (response.responseText === "--資料處理完成--") {
                        $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                        return [true, response.responseText]
                    }
                    else {
                        $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                        return [false, response.responseText]                        
                    }
                },
            },
            // options for the Add Dialog
            {
                closeOnEscape: true,
                closeAfterAdd: true,
                reloadAfterSubmit: true,
                beforeShowForm: function (form) {
                    $('#account').removeAttr('readonly');//可新增帳號
                    $('#tr_status').hide();//預設狀態啟用
                },
                afterSubmit: function (response, postdata) {
                    if (response.responseText === "--資料處理完成--") {
                        $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                        return [true, response.responseText]
                    }
                    else {
                        $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                        return [false, response.responseText]
                    }
                },
            },
            // options for the Delete Dailog
            {
                closeOnEscape: true,
                closeAfterDelete: true,
                reloadAfterSubmit: true,
                errorTextFormat: function (data) {
                    return 'Error: ' + data.responseText
                },
                afterSubmit: function (response, postdata) {
                    if (response.responseText === "--資料處理完成--") {
                        $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                        return [true, response.responseText]
                    }
                    else {
                        $("#jQGridDemo").trigger("reloadGrid", [{ current: true }]);
                        return [false, response.responseText]
                    }
                },
            },
            // options for the Search Dailog
            {
                closeOnEscape: true,
                closeAfterSearch: true,
            }
            );

        function EditButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="EditButtonClick(' + cellvalue + ')" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span></button>';
        }

        function StatusText(cellvalue, options, rowObject) {
            var tmp = 'red';
            var tmp2 = '停用';
            if (cellvalue === 1) {
                tmp = 'blue';
                tmp2 = '啟用';
            }
            return "<font color='" + tmp + "'>" + tmp2 + "</font>";
        }

        function PasswordLength(value, colname) {
            if (value.length < 3||value.length>12) return [false, '密碼需為3-12碼之英文/英文.'];
            else return [true, ''];
        }

        function AccountLength(value, colname) {
            if (value.length < 3 || value.length > 10) return [false, '帳號需為3-10碼英文/數字/底線.'];
            else return [true, ''];
        }

        function EditButtonClick(id) {
            $('#' + id).click();//先讓系統選到那列
            $('#edit_jqGrid').click();//觸發下方edit
        }

        function RemoveButton(cellvalue, options, rowObject) {
            return '<button type="button" onclick="RemoveButtonClick(' + cellvalue + ')" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>';
        }

        function RemoveButtonClick(id) {
            $('#' + id).click();//先讓系統選到那列
            $('#del_jqGrid').click();//觸發下方del
        }

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
            //$("#jqGrid").hideCol(['id']);
            $('#jqGridPager_center').css('width', 'auto');
        })
    </script>


</body>
</html>
