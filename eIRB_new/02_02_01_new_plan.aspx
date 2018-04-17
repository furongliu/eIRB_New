<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02_02_01_new_plan.aspx.cs" Inherits="eIRB_new._02_02_01_new_plan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script src="bootstrap/js/jquery.min.js" type="text/ecmascript"></script>
    <!-- We support more than 40 localizations -->
    <script src="bootstrap/js/trirand/i18n/grid.locale-tw.js" type="text/ecmascript"></script>
    <!-- This is the Javascript file of jqGrid -->
    <script src="bootstrap/js/trirand/src/jquery.jqGrid.js"></script>
    <!-- A link to a Boostrap  and jqGrid Bootstrap CSS siles-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Microsoft JhengHei';
            font-size: 14px;
        }

        .plan3_output{
            color:darkslategrey;
            font-weight:bold;
        }
    </style>
</head>
<body>
    <div class="container-fluid" style="margin-left: 0px; margin-bottom: 8%;">
        <div class="btn-group">
            <a href="#" class="btn btn-default div_display" id="plan1">計畫基本資料</a>
            <a href="#" class="btn btn-default div_display" id="plan2">計畫相關人員</a>
            <a href="#" class="btn btn-default div_display" id="plan3">計畫總覽</a>
            <a href="#" class="btn btn-default div_display" id="plan4">送審文件</a>
        </div>
        <form class="form-horizontal">
            <div id="plan1_div">
                <table class="table table-hover table-bordered" style="text-align: left;" id="table1">
                    <thead>
                        <tr>
                            <th colspan="2">計畫基本資料</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>IRB編號</td>
                            <td><span id="IrbNo"></span>
                                <label style="color: red;" id="IrbNo_remark">*案件送出申請後產生</label></td>
                        </tr>
                        <tr>
                            <td>案件編號</td>
                            <td><span id="CaseNo"></span>
                                <label style="color: red;" id="CaseNo_remark">*案件新增後產生</label></td>
                        </tr>
                        <tr>
                            <td>案件類別</td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="chk1" value="查驗登記用" />查驗登記用</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk1" value="學術研究用" />學術研究用</label>
                            </td>
                        </tr>
                        <tr>
                            <td>申請年度</td>
                            <td><span id="PlanYear"></span></td>
                        </tr>
                        <tr>
                            <td>是否須送署審查</td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="chk2" value="需送衛生福利部審查" />需送衛生福利部審查</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk2" value="無需送衛生福利部審查" />無需送衛生福利部審查</label>
                            </td>
                        </tr>
                        <tr>
                            <td>案件種類</td>
                            <td>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3 open_disabled" id="chk3_1" value="醫療法定義之人體試驗" />醫療法定義之人體試驗</label>
                                    <div class="radio col-sm-offset-1">
                                        <label>
                                            <input type="radio" name="chk3_1" class="chk3_1 default_disabled" value="新藥品臨床試驗" />新藥品臨床試驗</label>
                                    </div>
                                    <div class="radio col-sm-offset-1">
                                        <label>
                                            <input type="radio" name="chk3_1" class="chk3_1 default_disabled" value="新醫療技術臨床試驗" />新醫療技術臨床試驗</label>
                                    </div>
                                    <div class="radio col-sm-offset-1">
                                        <label>
                                            <input type="radio" name="chk3_1" class="chk3_1 default_disabled" value="新醫療器材臨床試驗" />新醫療器材臨床試驗</label>
                                    </div>
                                    <div class="radio col-sm-offset-1">
                                        <label>
                                            <input type="radio" name="chk3_1" class="chk3_1 default_disabled" value="學名藥生體可用率生體相等性臨床試驗" />學名藥生體可用率生體相等性臨床試驗</label>
                                    </div>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3" value="問卷調查研究" />問卷調查研究</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3" value="質性研究" />質性研究</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3" value="回溯性研究" />回溯性研究</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3" value="觀察性研究" />觀察性研究</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk3" class="chk3" value="基因研究" />基因研究</label>
                                </div>
                                <div class="radio">
                                    <label class="col-sm-1 control-label" style="text-align: left;">
                                        <input type="radio" name="chk3" class="chk3 open_disabled" id="chk3_2" value="其他" />其他</label>
                                    <div class="col-sm-11">
                                        <input class="form-control default_disabled chk3_2" type="text" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>試驗階段</td>
                            <td>
                                <label class="radio-inline" style="vertical-align: middle;">
                                    <input type="radio" name="chk4" class="chk4" value="PhaseI" />PhaseI</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4" value="PhaseII" />PhaseII</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4" value="PhaseIII" />PhaseIII</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4" value="PhaseIV" />PhaseIV</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4" value="PMS" />PMS</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4 open_disabled" id="chk4_1" value="BA" />BA</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4_1" class="default_disabled chk4_1" value="主試驗" />主試驗</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4_1" class="default_disabled chk4_1" value="預試驗" />預試驗</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4 open_disabled" id="chk4_2" value="BE" />BE</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4_2" class="default_disabled chk4_2" value="主試驗" />主試驗</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk4_2" class="default_disabled chk4_2" value="預試驗" />預試驗</label>

                                <label class="radio-inline">
                                    <input type="radio" name="chk4" class="chk4" value="不適用" />不適用</label>
                            </td>
                        </tr>
                        <tr>
                            <td>經費來源</td>
                            <td>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk5" class="chk5 open_disabled" id="chk5_1" value="有" />有，請勾選贊助者類別：</label>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="贊助廠商" id="chk5_1_1" class="open_disabled default_disabled chk5_1" />贊助廠商：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_1 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="本院醫學研究部" id="chk5_1_2" class="open_disabled default_disabled chk5_1" />本院醫學研究部：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_2 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="中央主管機關" id="chk5_1_3" class="open_disabled default_disabled chk5_1" />中央主管機關：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_3 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="學術研究機構" id="chk5_1_4" class="open_disabled default_disabled chk5_1" />學術研究機構：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_4 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="學校單位" id="chk5_1_5" class="open_disabled default_disabled chk5_1" />學校單位：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_5 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="醫療機構" id="chk5_1_6" class="open_disabled default_disabled chk5_1" />醫療機構：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_6 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="其他單位" id="chk5_1_7" class="open_disabled default_disabled chk5_1" />其他單位：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk5_1_7 chk5_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk5" class="chk5" value="無" />無，主持人自籌</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>使用藥物或器材提供者</td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="chk6" value="廠商" />廠商</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk6" value="學術單位" />學術單位</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk6" value="常規醫療處置" />常規醫療處置</label>
                                <label class="radio-inline">
                                    <input type="radio" name="chk6" value="不適用" />不適用</label>
                            </td>
                        </tr>
                        <tr>
                            <td>試驗區域</td>
                            <td>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chk7" class="chk7 open_disabled" id="chk7_1" value="多國多中心" />多國多中心</label>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="其他參與試驗的國家" id="chk7_1_1" class="open_disabled default_disabled chk7_1" />其他參與試驗的國家：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk7_1_1 chk7_1_text" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="col-sm-2 control-label col-sm-offset-1" style="text-align: left;">
                                            <input type="checkbox" value="台灣參與試驗的機構" id="chk7_1_2" class="open_disabled default_disabled chk7_1" />台灣參與試驗的機構：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk7_1_2 chk7_1_text" type="text" onclick="window_open('NewPlanLocation.html', '1')" id="window_open1" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-left: 1px;">
                                    <div class="radio">
                                        <label class="col-sm-3 control-label" style="text-align: left;">
                                            <input type="radio" name="chk7" class="chk7 open_disabled" id="chk7_2" value="台灣多中心" />台灣多中心--台灣參與試驗的機構：</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk7_2" type="text" onclick="window_open('NewPlanLocation.html', '2')" id="window_open2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-left: 1px;">
                                    <div class="radio">
                                        <label class="col-sm-3 control-label" style="text-align: left;">
                                            <input type="radio" name="chk7" class="chk7 open_disabled" id="chk7_3" value="單一中心" />單一中心</label>
                                        <div class="col-sm-9">
                                            <input class="form-control default_disabled chk7_3" type="text" />
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-default" id="AddButton">新增</button>
                <button type="button" class="btn btn-default" id="EditButton">編輯</button>
                <button type="button" class="btn btn-default" id="SaveButton">儲存</button>
                <button type="button" class="btn btn-default" id="CancelButton">取消</button>
                <button type="button" class="btn btn-success" id="SubmitButton">送出申請</button>
            </div>
            <div id="plan2_div" style="display: none;">
                <div style="margin-left: 0px;">
                    <table class="table table-hover table-bordered" id="table2">
                        <thead>
                            <tr>
                                <th>選取</th>
                                <th>性質</th>
                                <th>姓名</th>
                                <th>權限</th>
                                <th>單位廠商名稱</th>
                                <th>職稱</th>
                                <th>地址</th>
                                <th>辦公室電話</th>
                                <th>手機</th>
                                <th>傳真</th>
                                <th>電子郵箱</th>
                                <th>刪除</th>
                            </tr>
                        </thead>
                    </table>
                    <button type="button" class="btn btn-default" id="AddCorButton">
                        <span class="glyphicon glyphicon-plus"></span>新增案件聯絡人
                    </button>
                </div>
                <hr />
                <div id="plan2_div2" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-1" style="text-align: left;">
                            <label for="kind_select">性質：</label>
                        </div>
                        <div class="col-sm-4" style="text-align: left;">
                            <div class="form-group">
                                <select class="form-control" id="kind_select">
                                    <option value="協同主持人">協同主持人</option>
                                    <option value="委託廠商">委託廠商</option>
                                    <option value="研究護理師">研究護理師</option>
                                    <option value="委託機構">委託機構</option>
                                    <option value="研究人員">研究人員</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button type="button" class="btn btn-default" id="ChooseCorButton">帳號清單</button>
                             <button type="button" class="btn btn-default" id="CancelCorButton2">取消</button>
                        </div>
                    </div>
                </div>
                <div id="plan2_div3" style="display:none;">
                    <table class="table" id="table3">
                        <thead>
                            <tr>
                                <th colspan="4">案件聯絡人資料</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>性質</td>
                                <td>
                                    <div class="col-sm-6" style="text-align: left;">
                                        <span id="Plan2_kind"></span>
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td>姓名</td>
                                <td><span id="Plan2_name"></span><span id="Plan2_account" style="display:none;"></span></td>
                            </tr>
                            <tr>
                                <td>單位廠商名稱</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_office" disabled="disabled" />
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td>職稱</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_job" disabled="disabled" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>辦公室電話</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_phone2" disabled="disabled" />
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td>手機</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_phone1" disabled="disabled" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>傳真</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_fex" disabled="disabled" />
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td>電子郵箱</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_email" disabled="disabled" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td colspan="4">
                                    <div class="form-group">
                                        <input type="text" class="form-control Plan2_open_edit" id="Plan2_address" disabled="disabled" />
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-default editCor" id="EditCorButton" style="display: none;">編輯</button>
                    <button type="button" class="btn btn-default editCor" id="SaveCorButton" style="display: none;">儲存</button>
                    <button type="button" class="btn btn-default addCor" id="AddCorButton2" style="display: none;"><span class="glyphicon glyphicon-plus"></span>新增</button><%--新增聯絡人--%>
                    <button type="button" class="btn btn-default addCor" id="EditCorButton2" style="display: none;">編輯</button><%--新增聯絡人--編輯--%>
                    <button type="button" class="btn btn-default addCor" id="SaveCorButton2" style="display: none;">儲存</button><%--新增聯絡人--儲存--%>
                    <button type="button" class="btn btn-default" id="CancelCorButton">取消</button>
                </div>
                <div style="margin-left: 0px; display: none;" id="plan2_div4">
                    <div class="form-group">
                        <div class="col-sm-1" style="text-align: left;">
                            <label for="Search_item">請輸入姓名：</label>
                        </div>
                        <div class="col-sm-4" style="text-align: left;">
                            <div class="form-group">
                                 <input class="form-control" id="Search_item" type="text" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button type="button" class="btn btn-default" id="Search">查詢</button>
                            <button type="button" class="btn btn-default" id="SearchAll">全部列出</button>
                        </div>
                    </div>
                    <table class="table" id="table4">
                        <thead>
                            <tr>
                                <th>選取</th>
                                <th>姓名</th>
                                <th>單位廠商名稱</th>
                                <th>職稱</th>
                                <th>地址</th>
                                <th>辦公室電話</th>
                                <th>手機</th>
                                <th>傳真</th>
                                <th>電子郵箱</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <div id="plan3_div" style="display: none;">
                <table class="table table-hover" style="text-align: left;" id="table5">
                    <thead>
                        <tr>
                            <th colspan="4">計畫總覽</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>IRB編號</td>
                            <td><span id="plan3_IrbNo"></span>
                                <label style="color: red;" id="plan3_IrbNo_remark">*案件送出申請後產生</label></td>
                        </tr>
                        <tr>
                            <td>案件編號</td>
                            <td><span id="plan3_CaseNo"></span></td>
                        </tr>
                        <tr>
                            <td>計畫編號<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td >
                                <input class="form-control plan3_input" id="plan3_1" type="text" placeholder="20字以內" />
                                <span id="plan3_1_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>試驗藥品醫療器材<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td >
                                <textarea class="form-control plan3_input" rows="5" id="plan3_2"></textarea>
                                <span id="plan3_2_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>計畫主持人</td>
                            <td ><span id="plan3_PI"></span></td>
                        </tr>
                        <tr>
                            <td>協同主持人</td>
                            <td ><span id="plan3_CorPI"></span></td>
                        </tr>
                        <tr>
                            <td>中文計畫名稱</td>
                            <td >
                                <input class="form-control plan3_input" id="plan3_3" type="text" />
                                <span id="plan3_3_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>英文計畫名稱</td>
                            <td >
                                <input class="form-control plan3_input" id="plan3_4" type="text" />
                                <span id="plan3_4_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>試驗執行地點</td>
                            <td>
                                <div class="plan3_chk_div">
                                    <div class="checkbox-inline">
                                        <label>
                                            <input type="checkbox" class="plan3_input plan3_5" value="台北分院" />台北分院</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label>
                                            <input type="checkbox" class="plan3_input plan3_5" value="淡水分院" />淡水分院</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label>
                                            <input type="checkbox" class="plan3_input plan3_5" value="新竹分院" />新竹分院</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label>
                                            <input type="checkbox" class="plan3_input plan3_5" value="台東分院" />台東分院</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label>
                                            <input type="checkbox" class="plan3_input plan3_5 plan3_other" value="其他" id="plan3_5_chk" />其他：</label>
                                    </div>
                                    <input class="form-control plan3_input" id="plan3_5" type="text" style="width: 20%; display: inline;" />
                                    ，執行本試驗之其他機構名稱：&nbsp;
                            <input class="form-control plan3_input" id="plan3_6" type="text" onclick="window_open('NewPlanLocation.html', '3')" style="width: 20%; display: inline; background-color:white;" readonly="readonly" />
                                </div>
                                <span id="plan3_5_span" class="plan3_output"></span>
                                <span id="plan3_6_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>進度期限</td>
                            <td >
                                        自IRB核准日起
                                        <select class="form-control plan3_input" id="plan3_7" style="width: auto;display:inline;">
                                            <option selected="selected">0</option>
                                        </select>
                                <span id="plan3_7_span" class="plan3_output"></span>
                                    <label for="plan3_7" class="control-label">年</label>
                                        <select class="form-control plan3_input" id="plan3_8" style="width: auto;display:inline;">
                                            <option selected="selected">0</option>
                                        </select>
                                <span id="plan3_8_span" class="plan3_output"></span>
                                    <label for="plan3_8" class="control-label">月</label>                           
                            </td>
                        </tr>
                        <tr>
                            <td>受試者年齡層</td>
                            <td >
                                <div class="plan3_chk_div">
                                <div class="radio-inline plan3_input">
                                     <label>
                                         <input type="radio" name="plan3_9_radio" class="plan3_input" value="滿20歲" id="plan3_9_1"/>滿20歲</label>
                                 </div>
                                 <div class="radio-inline plan3_input">
                                     <label>
                                         <input type="radio" name="plan3_9_radio" class="plan3_input" value="未滿20歲" id="plan3_9_2" />未滿20歲</label>
                                 </div>
                                    <div class="radio-inline plan3_input">
                                     <label>
                                         <input type="radio" name="plan3_9_radio" class="plan3_input" value="其他" id="plan3_9_3" />其他：</label>
                                 </div>
                                <input class="form-control plan3_input" id="plan3_9" type="text" style="width: auto; display: inline;" />
                                </div>
                                <span id="plan3_9_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>受試者人數</td>
                            <td >
                                本院&nbsp;<input class="form-control plan3_input" id="plan3_10" type="text" style="width: auto;display:inline;" onkeyup="return ValidateNumber(this,value)"/>
                                <span id="plan3_10_span" class="plan3_output"></span>
                                &nbsp;人，多中心總人數：台灣&nbsp;<input class="form-control plan3_input" id="plan3_11" type="text" style="width: auto;display:inline;" onkeyup="return ValidateNumber(this,value)" />
                                <span id="plan3_11_span" class="plan3_output"></span>
                                &nbsp;人，全球&nbsp;<input class="form-control plan3_input" id="plan3_12" type="text" style="width: auto;display:inline;" onkeyup="return ValidateNumber(this,value)" />
                                <span id="plan3_12_span" class="plan3_output"></span>
                                &nbsp;人&nbsp;<span style="color: red;" class="NA_remark">(請填寫整數)</span>
                            </td>
                        </tr>
                         <tr>
                            <td>收納受試者方式</td>
                            <td >
                                <div class="plan3_chk_div">
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_13" value="門診" />門診</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_13" value="急診" />急診</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_13" value="住院" />住院</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_13 plan3_other" value="其他" id="plan3_13_chk" />其他：</label>
                                 </div><input class="form-control plan3_input" id="plan3_13" type="text" style="width: auto;display:inline;" />
                                     </div>
                                <span id="plan3_13_span" class="plan3_output"></span>
                            </td>
                        </tr>
                         <tr>
                            <td>受試者資料保密方式</td>
                             <td>
                                 <div class="plan3_chk_div">
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14" value="以編號識別" />以編號識別</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14" value="英文縮寫名識別" />英文縮寫名識別</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14" value="將資料編碼" />將資料編碼</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14" value="所有資料上鎖" />所有資料上鎖</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14" value="編號或編碼之資料上鎖" />編號或編碼之資料上鎖</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_14 plan3_other" value="其他" id="plan3_14_chk" />其他：</label>
                                 </div><input class="form-control plan3_input" id="plan3_14" type="text" style="width: auto;display:inline;" />
                                     </div>
                                 <span id="plan3_14_span" class="plan3_output"></span>
                            </td>
                        </tr>
                         <tr>
                            <td>除主持人、監視人及協同主持人、MMHIRB及主管機關外，會審視受試者資料的名單<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td ><textarea class="form-control plan3_input" rows="5" id="plan3_15"></textarea>
                                <span id="plan3_15_span" class="plan3_output"></span>
                            </td>
                        </tr>
                         <tr>
                            <td>特殊族群</td>
                            <td><div class="plan3_chk_div">
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="未成年" />未成年</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="孕婦" />孕婦</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="受刑人" />受刑人</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="文盲" />文盲</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="愛滋病患" />愛滋病患</label>
                                 </div>
                                <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="智障者" />智障者</label>
                                 </div>
                                <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16" value="無居所人士" />無居所人士</label>
                                 </div>
                                <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16" value="無" id="plan3_16_none"/>無</label>
                                 </div>
                                 <div class="checkbox-inline">
                                     <label>
                                         <input type="checkbox" class="plan3_input plan3_16_none plan3_16 plan3_other" value="其他" id="plan3_16_chk" />其他：</label>
                                 </div><input class="form-control plan3_input plan3_16_none" id="plan3_16" type="text" style="width: auto;display:inline;" /></div>
                                <span id="plan3_16_span" class="plan3_output"></span>
                            </td>
                        </tr>
                         <tr>
                            <td>是否有給受試者營養補助費/交通費</td>
                            <td >
                                <div class="plan3_chk_div">
                                <div class="radio-inline plan3_input">
                                     <label>
                                         <input type="radio" name="plan3_17_radio" class="plan3_input" value="無" id="plan3_17_none"/>無</label>
                                 </div>
                                 <div class="radio-inline plan3_input">
                                     <label>
                                         <input type="radio" name="plan3_17_radio" class="plan3_input" value="有" id="plan3_17_yes" />有</label>
                                 </div>
                                ，新台幣&nbsp;
                                <input class="form-control plan3_input" id="plan3_17" type="text" style="width: auto; display: inline;" onkeyup="return ValidateNumber(this,value)" />
                                &nbsp;元(
                                <select class="form-control plan3_input" id="plan3_18" style="width: auto; display: inline;">
                                    <option value="每次" selected="selected">每次</option>
                                    <option value="總共">總共</option>
                                </select>)</div>
                                <span style="color: red;" class="NA_remark">(請填寫整數)</span>
                                <span id="plan3_17_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>研究用藥品學名<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td >
                                <textarea class="form-control plan3_input" rows="5" id="plan3_19"></textarea>
                                <span id="plan3_19_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>商品名<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td >
                                <textarea class="form-control plan3_input" rows="5" id="plan3_20"></textarea>
                                <span id="plan3_20_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>規格<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td >
                                <textarea class="form-control plan3_input" rows="5" id="plan3_21"></textarea>
                                <span id="plan3_21_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>製造廠商<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td ><input class="form-control plan3_input" id="plan3_22" type="text" />
                                <span id="plan3_22_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>製造國別<span style="color: red;" class="NA_remark">(無請填NA)</span></td>
                            <td ><input class="form-control plan3_input" id="plan3_23" type="text" />
                                <span id="plan3_23_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>科別</td>
                            <td ><input class="form-control plan3_input" id="plan3_24" type="text" onclick="window_open('Plan3_24.html', '1')" readonly="readonly" style="background-color:white;" />
                                <span id="plan3_24_span" class="plan3_output"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>試驗委託者</td>
                            <td >
                                <span id="plan3_CorPI2"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <button type="button" class="btn btn-default" id="plan3_EditButton">編輯</button>
                <button type="button" class="btn btn-default" id="plan3_SaveButton" style="display:none;">儲存</button>
                <button type="button" class="btn btn-default" id="plan3_CancelButton" style="display:none;">取消</button>
            </div>
            <div id="plan4_div" style="display: none;">

            </div>
        </form>
    </div>

    <script src="MyScripts/InputNumberOnly.js"></script>
    <script>
        $(document).ready(function () {
            if ($('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "新申請") {
                $('#plan2').hide();//隱藏計畫聯絡人
                $('#plan3').hide();//隱藏計畫總覽
                $('#plan4').hide();//隱藏送審文件
                $('#EditButton').hide();//隱藏編輯
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#SubmitButton').hide();//隱藏送出申請
                $('.default_disabled').prop('disabled', true);//子選項和其他的textbox disabled
                $('.chk7_1_2').prop('readonly', true);
                $('.chk7_2').prop('readonly', true);
                $('#location3').html('');
            } else if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "編輯中") {//編輯中
                var CaseNo = $('#location3').html().substring($('#location3').html().length - 11, $('#location3').html().length);
                $('#AddButton').hide();//隱藏新增
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#CaseNo_remark').hide();//隱藏案件編號警語
                $('#CaseNo').html(CaseNo);//代入案件編號
                //讀取資料
                ReadPlan(CaseNo);
                //切成不可編輯狀態
                $('input').prop('disabled', true);
            } else if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "申請中") {//申請中
                var CaseNo = $('#location3').html().substring($('#location3').html().length - 11, $('#location3').html().length);
                $('#AddButton').hide();//隱藏新增
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#CaseNo_remark').hide();//隱藏案件編號警語
                $('#CaseNo').html(CaseNo);//代入案件編號
                $('.plan2_div_edit').hide();//隱藏新增編輯聯絡人
                //隱藏表格裡的編輯聯絡人按鈕
                //隱藏表格裡的刪除聯絡人按鈕

                //讀取資料
                ReadPlan(CaseNo);
                //切成不可編輯狀態
                $('input').prop('disabled', true);
            } else if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "審核中") {//審核中
                var CaseNo = $('#location3').html().substring($('#location3').html().length - 11, $('#location3').html().length);
                $('#AddButton').hide();//隱藏新增
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#CaseNo_remark').hide();//隱藏案件編號警語
                $('#CaseNo').html(CaseNo);//代入案件編號
                //讀取資料
                ReadPlan(CaseNo);
                //切成不可編輯狀態
                $('input').prop('disabled', true);
                //隱藏所有Button
                $('#main button').hide();
                //隱藏計畫聯絡人的選取和刪除
                $("#table2 thead tr th:first-child").hide();
                $("#table2 thead tr th:nth-child(12)").hide();
                $(".ChooseThisContact").hide();
                //讀取IRB編號
                ReadIRBNo(CaseNo);
            }

            //切換div
            $('.div_display').click(function () {
                var ID = this.id;
                $('.div_display').each(function () {
                    if (this.id == ID) {
                        $('#' + this.id + '_div').show();
                    } else {
                        $('#' + this.id + '_div').hide();
                    }
                });
            });

            //按下新增計畫基本資料
            $('#AddButton').click(function () {
                var i_end = 7;
                var can = 1;
                for (var i = 1; i <= i_end; i++) {
                    if ($("input[name=chk" + i.toString() + "]:checked").val() == null) {
                        can = 0;
                        break;
                    }
                }

                if (can === 1) {
                    AddPlan();//塞資料庫
                    $('#AddButton').hide();//隱藏新增
                    $('#EditButton').show();//顯示編輯
                    $('#SubmitButton').show();//顯示送出申請
                    $('#CaseNo_remark').hide();//隱藏案件編號警語
                    $('#plan2').show();//顯示計畫聯絡人
                    $('#plan3').show();//顯示計畫總覽
                    $('#plan4').show();//顯示送審文件
                    $('#location2').html('<span class="glyphicon glyphicon-forward"></span>編輯中');//目前位置改成編輯中

                    $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端

                    //切成不可編輯狀態
                    ReadMode();
                } else {
                    alert('請確認所有欄位皆有勾選.');
                }
            });

            //按下編輯計畫基本資料
            $('#EditButton').click(function () {
                $('#EditButton').hide();//隱藏編輯
                $('#SubmitButton').hide();//隱藏送出申請
                $('#SaveButton').show();//顯示儲存
                $('#CancelButton').show();//顯示取消
                $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
                //開啟可編輯選項
                CloseDisabledItem();

                //頁面判斷開關子選項和其他textbox
                OpenDisabledItem();
            });

            //按下儲存計畫基本資料
            $('#SaveButton').click(function () {
                //儲存到資料庫
                SavePlan();
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#EditButton').show();//顯示編輯
                $('#SubmitButton').show();//顯示送出申請
                $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
                //切成不可編輯狀態
                ReadMode();
            });

            //按下取消計畫基本資料
            $('#CancelButton').click(function () {
                //讀取到資料庫
                ReadPlan($('#CaseNo').html());
                $('#SaveButton').hide();//隱藏儲存
                $('#CancelButton').hide();//隱藏取消
                $('#EditButton').show();//顯示編輯
                $('#SubmitButton').show();//顯示送出申請
                $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
                //切成不可編輯狀態
                ReadMode();
            });

            //按下送出申請--還沒驗證有無沒輸入的
            $('#SubmitButton').click(function () {
                var IRBNoType = "MMHIS";
                if ($("input[name=chk4]:checked").val() === "BA") {
                    if ($("input[name=chk4_1]:checked").val() === "主試驗") IRBNoType = "BA_m"; //BA主
                    else IRBNoType = "BA_P";//BA預
                } else if ($("input[name=chk4]:checked").val() === "BE") {
                    if ($("input[name=chk4_2]:checked").val() === "主試驗") IRBNoType = "BE_m";//BE主
                    else IRBNoType = "BE_P";//BE預
                } else if ($('#chk5_1_1').prop('checked') == true && $('.chk5_1_1').val() !== '') {
                    if ($("input[name=chk1]:checked").val() === "查驗登記用") IRBNoType = "CT_A";//CT查驗登記用
                    else IRBNoType = "CT_b";//CT學術研究用
                }
                a = { 'CaseNo': $('#CaseNo').html(), 'IRBNoType': IRBNoType };
                $.ajax(
                {
                    type: "POST",
                    url: "02_02_01_new_plan.aspx/SubmitPlan",
                    data: JSON.stringify(a),
                    datatype: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success:
                        function (data) {
                            $('#child12').click();
                        },
                    failure:
                        function () {
                            alert('Insert Error');
                        }
                });
            })

            //頁面一開始判斷開關子選項和其他textbox
            OpenDisabledItem();

            //勾選案件種類
            $('.chk3').click(function () {
                //判斷要不要開關清空醫療法定義之人體試驗的子選項
                if ($('#chk3_1').prop('checked') == true) {
                    $('.chk3_1').prop('disabled', false);
                    $('.chk3_1:first').prop('checked', true);
                } else {
                    $('.chk3_1').prop('disabled', true);
                    $('.chk3_1').prop('checked', false);
                }
                //判斷要不要開關其他的textbox
                if ($('#chk3_2').prop('checked') == true) {
                    $('.chk3_2').prop('disabled', false);
                } else {
                    $('.chk3_2').prop('disabled', true);
                    $('.chk3_2').val('');
                }
            });

            //勾選試驗階段
            $('.chk4').click(function () {
                //判斷要不要開關BA子選項
                if ($('#chk4_1').prop('checked') == true) {
                    $('.chk4_1').prop('disabled', false);
                    $('.chk4_1:first').prop('checked', true);
                    //$('.chk4_1').parent().attr('style','color:blue;');
                } else {
                    $('.chk4_1').prop('disabled', true);
                    $('.chk4_1').prop('checked', false);
                    //$('.chk4_1').parent().attr('style', 'color:dimgray;');
                }
                //判斷要不要開關BE子選項
                if ($('#chk4_2').prop('checked') == true) {
                    $('.chk4_2').prop('disabled', false);
                    $('.chk4_2:first').prop('checked', true);
                    //$('.chk4_2').parent().attr('style', 'color:blue;');
                } else {
                    $('.chk4_2').prop('disabled', true);
                    $('.chk4_2').prop('checked', false);
                    //$('.chk4_2').parent().attr('style', 'color:dimgray;');
                }
            });

            //申請年度
            var date = new Date;
            $('#PlanYear').html(date.getFullYear());

            //勾選經費來源
            $('.chk5').click(function () {
                //判斷要不要開關有經費來源子選項
                if ($('#chk5_1').prop('checked') == true) {
                    $('.chk5_1').prop('disabled', false);
                } else {
                    $('.chk5_1').prop('disabled', true);
                    $('.chk5_1').prop('checked', false);
                    $('.chk5_1_text').val('');
                    $('.chk5_1_text').prop('disabled', true);
                }
            });

            //勾選有經費來源子選項
            $('.chk5_1').click(function () {
                //判斷要不要開關有經費來源子選項的textbox
                $('.chk5_1').each(function () {
                    if ($('#' + this.id).prop('checked') == true) {
                        $('.' + this.id).prop('disabled', false);
                    } else {
                        $('.' + this.id).prop('disabled', true);
                        $('.' + this.id).val('');
                    }
                });
            });

            //勾選試驗區域
            $('.chk7').click(function () {
                $('.chk7').each(function () {
                    if ($('#' + this.id).prop('checked') == true && this.id !== "chk7_1") {
                        $('.' + this.id).prop('disabled', false);
                        $('.chk7_1_text').prop('disabled', true);
                        $('.chk7_1').prop('checked', false);
                        $('.chk7_1_text').val('');
                        $('.chk7_1_2').removeAttr('style');
                    } else if ($('#' + this.id).prop('checked') == true) {
                        $('.' + this.id).prop('disabled', false);
                    }
                    else {
                        $('.' + this.id).prop('disabled', true);
                        $('.' + this.id).val('');
                    }

                    //台灣多中心--台灣參與試驗的機構 readonly 背景色
                    if ($('#chk7_2').prop('checked') == true) {
                        $('.chk7_2').attr('style', 'background:white;"');
                    } else if ($('#chk7_2').prop('checked') == false) {
                        $('.chk7_2').removeAttr('style');
                    }
                });
            });

            //勾選有多國多中心子選項
            $('.chk7_1').click(function () {
                //判斷要不要開關有經費來源子選項的textbox
                $('.chk7_1').each(function () {
                    if ($('#' + this.id).prop('checked') == true) {
                        $('.' + this.id).prop('disabled', false);
                    } else {
                        $('.' + this.id).prop('disabled', true);
                        $('.' + this.id).val('');
                    }
                });

                //台灣參與試驗的機構 readonly 背景色
                if ($('#chk7_1_2').prop('checked') == true) {
                    $('.chk7_1_2').attr('style', 'background:white;"');
                } else if ($('#chk7_1_2').prop('checked') == false) {
                    $('.chk7_1_2').removeAttr('style');
                }
            });
        });

        //切成可編輯狀態
        function CloseDisabledItem() {
            var i_end = 7;
            for (var i = 1; i <= i_end; i++) {
                $("input[name=chk" + i.toString() + "]").prop('disabled', false);
            }
        }

        //判斷開關子選項和其他textbox
        function OpenDisabledItem() {
            $('.open_disabled').each(function () {
                if ($(this).prop('checked') == true) {
                    $('.' + this.id).prop('disabled', false);
                }
            });

            //多國多中心--台灣參與試驗的機構 readonly 背景色
            if ($('#chk7_1_2').prop('checked') == true) {
                $('.chk7_1_2').attr('style', 'background:white;"');
            }
            //台灣多中心台灣參與試驗的機構 readonly 背景色
            if ($('#chk7_2').prop('checked') == true) {
                $('.chk7_2').attr('style', 'background:white;"');
            }
        }

        //切成不可編輯狀態
        function ReadMode() {
            $('input').prop('disabled', true);
            $('.chk7_1_2').removeAttr('style');//多國多中心-台灣參與試驗的機構背景色灰
            $('.chk7_2').removeAttr('style');//台灣多中心-台灣參與試驗的機構背景色灰
        }

        //開起子視窗，讓視窗置中
        function window_open(page, from) {
            var theURL = "List/" + page + "?from=" + from;     //網頁位置;
            var winName = "請選擇台灣參與試驗的機構";    //網頁名稱;
            var win_width = 600;
            var win_height = 600;
            if (page == 'Plan3_24.html') {
                win_width += 600;
                win_height -= 150;
            }
            var PosX = (screen.width - win_width) / 2;
            var PosY = (screen.Height - win_height) / 2;
            var features = "width=" + win_width + ",height=" + win_height + ",top=" + PosY + ",left=" + PosX;
            window.open(theURL, winName, features);
        }

        //新增計畫基本資料
        function AddPlan() {
            a = { 'tmp': Item() };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/AddPlan",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        $('#CaseNo').html(data.d);
                        $('#location3').html(data.d);//代入案件編號
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //儲存計畫基本資料
        function SavePlan() {
            a = { 'tmp': Item() };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/SavePlan",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //從後端讀計畫基本資料
        function ReadPlan(CaseNo) {
            a = { 'CaseNo': CaseNo };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/ReadPlan",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        $('input').prop('checked', false);
                        $('input[type=text]').val('');
                        $('#PlanYear').html('');
                        var D = data.d;

                        var tmp1 = [D.chk1, D.chk2, D.chk3, D.chk4, D.chk5, D.chk6, D.chk7];
                        for (var i = 1; i <= 7; i++)
                            $("input[name=chk" + i.toString() + "]").filter('[value="' + tmp1[i - 1] + '"]').prop('checked', true);


                        if (D.chk3_1 !== "") {
                            $("input[name=chk3_1]").filter('[value="' + D.chk3_1 + '"]').prop('checked', true);
                        }
                        if (D.chk3other !== "NA") {
                            $('.chk3_2').val(D.chk3other);
                        }

                        if (D.chk4 == "BA") {
                            $("input[name=chk4_1]").filter('[value="' + D.chk4other + '"]').prop('checked', true);
                        } else if (D.chk4 == "BE") {
                            $("input[name=chk4_2]").filter('[value="' + D.chk4other + '"]').prop('checked', true);
                        }

                        if (D.chk5 == "有") {
                            var tmp2 = [D.chk5_1_1, D.chk5_1_2, D.chk5_1_3, D.chk5_1_4, D.chk5_1_5, D.chk5_1_6, D.chk5_1_7];
                            for (var i = 1; i <= 7; i++) {
                                if (tmp2[i - 1] !== "NA") {
                                    $('#chk5_1_' + i.toString()).prop('checked', true);
                                    $('.chk5_1_' + i.toString()).val(tmp2[i - 1]);
                                }
                            }
                        }

                        if (D.chk7 == "多國多中心") {
                            if (D.chk7_1 !== "NA") {
                                $('#chk7_1_1').prop('checked', true);
                                $('.chk7_1_1').val(D.chk7_1);
                            }
                            if (D.chk7_2 !== "NA") {
                                $('#chk7_1_2').prop('checked', true);
                                $('.chk7_1_2').val(D.chk7_2);
                            }
                        } else if (D.chk7 == "台灣多中心") {
                            $('.chk7_2').val(D.chk7_2);
                        } else {
                            $('.chk7_3').val(D.chk7_3);
                        }

                        $('#PlanYear').html(D.PlanYear);
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //讀IRB編號
        function ReadIRBNo(CaseNo) {
            a = { 'CaseNo': CaseNo };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/ReadIRBNo",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        var D = data.d;
                            $('#IrbNo_remark').hide();
                            $('#plan3_IrbNo_remark').hide();
                            $('#plan3_IrbNo').html(D);
                            $('#IrbNo').html(D);
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //塞值到後端計畫基本資料
        function Item() {
            var data = {
                PlanYear: $('#PlanYear').html(),//申請年度
                chk1: $("input[name=chk1]:checked").val(),
                chk2: $("input[name=chk2]:checked").val(),
                chk3: $("input[name=chk3]:checked").val(),
                chk4: $("input[name=chk4]:checked").val(),
                chk5: $("input[name=chk5]:checked").val(),
                chk6: $("input[name=chk6]:checked").val(),
                chk7: $("input[name=chk7]:checked").val(),
                chk3_1: "",
                chk3other: "",
                chk4other: "",
                chk5_1_1: "",
                chk5_1_2: "",
                chk5_1_3: "",
                chk5_1_4: "",
                chk5_1_5: "",
                chk5_1_6: "",
                chk5_1_7: "",
                chk7_1: "",
                chk7_2: "",
                chk7_3: "",
                CaseNo: $('#CaseNo').html(),
            };

            if ($("input[name=chk3]:checked").val() === "醫療法定義之人體試驗") {
                data.chk3_1 = $("input[name=chk3_1]:checked").val();
            } else if ($("input[name=chk3]:checked").val() === "其他") {
                data.chk3other = $('.chk3_2').val();
            }

            if ($("input[name=chk4]:checked").val() === "BA") {
                data.chk4other = $("input[name=chk4_1]:checked").val();
            } else if ($("input[name=chk4]:checked").val() === "BE") {
                data.chk4other = $("input[name=chk4_2]:checked").val();
            }

            if ($("input[name=chk5]:checked").val() === "有") {
                data.chk5_1_1 = $('.chk5_1_1').val();
                data.chk5_1_2 = $('.chk5_1_2').val();
                data.chk5_1_3 = $('.chk5_1_3').val();
                data.chk5_1_4 = $('.chk5_1_4').val();
                data.chk5_1_5 = $('.chk5_1_5').val();
                data.chk5_1_6 = $('.chk5_1_6').val();
                data.chk5_1_7 = $('.chk5_1_7').val();
            }

            if ($("input[name=chk7]:checked").val() === "多國多中心") {
                data.chk7_1 = $(".chk7_1_1").val();
                data.chk7_2 = $(".chk7_1_2").val();
            } else if ($("input[name=chk7]:checked").val() === "台灣多中心") {
                data.chk7_2 = $(".chk7_2").val();
            } else {
                data.chk7_3 = $(".chk7_3").val();
            }

            return data;
        }
    </script>

    <%--案件聯絡人--%>
    <script>        
        //按下最上方按鈕--案件聯絡人
        $('#plan2').click(function () {
            ReadPlanContact($('#CaseNo').html());
            $('#plan2_div2').hide();
            $('#plan2_div3').hide();
            $('#plan2_div4').hide();
            if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "編輯中") $('#AddCorButton').show();
            $('#plan2_div_account_list').hide();
        });

        //按下新增一筆聯絡人
        $('#AddCorButton').click(function () {
            $('#AddCorButton').hide();//新增一筆Button
            $('#plan2_div2').show();//選擇新增聯絡人性質div
        });

        //按下帳號清單
        $('#ChooseCorButton').click(function () {
            $('#plan2_div4').show();//帳號清單選擇
            ReadPlanContactAdd($('#kind_select').val(), '', $('#CaseNo').html());//匯入此性質的所有聯絡人
            $('#Search_item').prop('disabled', false);
        });

        //按下帳號清單取消
        $('#CancelCorButton2').click(function () {
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項
            $('#AddCorButton').show();//新增一筆Button
            $('#plan2_div2').hide();//選擇新增聯絡人性質
            $('#plan2_div4').hide();//帳號清單選擇
        });

        //按下新增編輯聯絡人--編輯
        $('#EditCorButton').click(function () {
            $('.Plan2_open_edit').prop('disabled', false);//打開可編輯項
            $('#EditCorButton').hide();
            $('#SaveCorButton').show();
        });

        //按下新增編輯聯絡人--儲存
        $('#SaveCorButton').click(function () {
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項
            $('#SaveCorButton').hide();
            $('#plan2_div3').hide();//編輯div
            $('#AddCorButton').show();//新增一筆聯絡人Button
            SaveThisCorPI();
        });

        //按下新增編輯聯絡人--取消
        $('#CancelCorButton').click(function () {
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項
            $('#SaveCorButton').hide();
            $('#plan2_div3').hide();//編輯div
            $('#AddCorButton').show();//新增一筆聯絡人Button
        });

        //按下新增聯絡人--編輯
        $('#EditCorButton2').click(function () {
            $('.Plan2_open_edit').prop('disabled', false);//打開可編輯項
            $('#EditCorButton2').hide();
            $('#AddCorButton2').hide();
            $('#SaveCorButton2').show();
        });

        //按下新增聯絡人--儲存
        $('#SaveCorButton2').click(function () {
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項
            $('#EditCorButton2').show();
            $('#AddCorButton2').show();
            $('#SaveCorButton2').hide();
            SaveThisCorPI();
        });

        //帳號清單查詢
        $('#Search').click(function () {
            ReadPlanContactAdd($('#kind_select').val(), $('#Search_item').val(), $('#CaseNo').html());//匯入此性質的所有聯絡人
        })

        //帳號清單查詢-ALL
        $('#SearchAll').click(function () {
            ReadPlanContactAdd($('#kind_select').val(), '', $('#CaseNo').html());//匯入此性質的所有聯絡人
        })

        //確定新增一筆案件聯絡人
        $('#AddCorButton2').click(function () {
            AddThisCorPI();
            SaveThisCorPI();
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項
            $('#plan2_div3').hide();
            $('#AddCorButton').show();
        });

        //從後端讀帳號清單
        function ReadPlanContactAdd(identity, find, CaseNo) {
            a = { 'identity': identity, 'find': find, 'CaseNo': CaseNo };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/ReadPlanContactAdd",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        var D = data.d;
                        $('#table4 tbody').remove();
                        var tmp = '<tbody>';
                        if (D.length < 1) {
                            tmp += '<tr><td colspan="9">查無資料!</td></tr>';
                        }
                        else
                        {
                            for (var i = 0; i < D.length; i++) {
                                var str = "'" + D[i].kind + "," + D[i].name + "," + D[i].office + "," + D[i].address + ","
                                + D[i].phone1 + "," + D[i].phone2 + "," + D[i].job + "," + D[i].fex + "," + D[i].email + "," + D[i].account + "'";
                                tmp += '<tr><td><button type="button" class="btn btn-default btn-sm" onclick="EditThisContact2(' + str + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>';
                                tmp += '<td>' + D[i].name + '</td>';
                                tmp += '<td>' + D[i].office + '</td>';
                                tmp += '<td>' + D[i].job + '</td>';
                                tmp += '<td>' + D[i].address + '</td>';
                                tmp += '<td>' + D[i].phone2 + '</td>';
                                tmp += '<td>' + D[i].phone1 + '</td>';
                                tmp += '<td>' + D[i].fex + '</td>';
                                tmp += '<td>' + D[i].email + '</td></tr>';
                            }
                        }
                        tmp += '</tbody>';
                        $('#table4').append(tmp);
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //從後端讀總計畫聯絡人
        function ReadPlanContact(CaseNo) {
            a = { 'CaseNo': CaseNo };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/ReadPlanContact",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        var D = data.d;
                        $('#table2 tbody').remove();
                        var tmp = '<tbody>';
                        for (var i = 0; i < D.length; i++) {
                            var str = "'" + D[i].kind + "," + D[i].name + "," + D[i].office + "," + D[i].address + ","
                                + D[i].phone1 + "," + D[i].phone2 + "," + D[i].job + "," + D[i].fex + "," + D[i].email + "," + D[i].account + "'";
                            tmp += '<tr>';
                            if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "審核中")
                                tmp += '<td style="display: none;">';
                            else
                                tmp += '<td>';
                            tmp += '<button type="button" class="btn btn-default btn-sm" onclick="EditThisContact(' + str + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>';
                            tmp += '<td>' + D[i].kind + '</td>';
                            tmp += '<td>' + D[i].name + '</td>';
                            tmp += '<td>' + D[i].authority + '</td>';
                            tmp += '<td>' + D[i].office + '</td>';
                            tmp += '<td>' + D[i].job + '</td>';
                            tmp += '<td>' + D[i].address + '</td>';
                            tmp += '<td>' + D[i].phone2 + '</td>';
                            tmp += '<td>' + D[i].phone1 + '</td>';
                            tmp += '<td>' + D[i].fex + '</td>';
                            tmp += '<td>' + D[i].email + '</td>';
                            if (D[i].kind == '計畫主持人') {
                                if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "審核中")
                                    tmp += '<td style="display: none;"></td></tr>';
                                else
                                    tmp += '<td>&nbsp;</td></tr>';
                            } else {
                                if ($('#location3').html() !== "" && $('#location2').html().substring($('#location2').html().length - 3, $('#location2').html().length) == "審核中")
                                    tmp += '<td style="display: none;">&nbsp;</td></tr>';
                                else
                                    tmp += '<td><button type="button" class="btn btn-danger btn-sm" onclick="DeleteThisContact(\'' + D[i].account + '\')"><span class="glyphicon glyphicon-remove"></span></button></td></tr>';
                            }
                        }
                        tmp += '</tbody>';
                        $('#table2').append(tmp);
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //按下上方table最左邊選取
        function EditThisContact(tmp) {
            $('#AddCorButton').hide();//新增一筆Button
            $('#plan2_div3').show();//編輯div
            $('#EditCorButton').show();//新增編輯聯絡人--編輯
            $('#SaveCorButton').hide();//新增編輯聯絡人--儲存
            $('#plan2_div4').hide();//聯絡人清單div
            $('#plan2_div2').hide();//新增聯絡人性質清單div
            $('.addCor').hide();
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項

            var data = tmp.split(',');
            $('#Plan2_kind').html(data[0]);
            $('#Plan2_name').html(data[1]);
            $('#Plan2_office').val(data[2]);
            $('#Plan2_job').val(data[6]);
            $('#Plan2_phone1').val(data[4]);
            $('#Plan2_phone2').val(data[5]);
            $('#Plan2_email').val(data[8]);
            $('#Plan2_address').val(data[3]);
            $('#Plan2_fex').val(data[7]);
            $('#Plan2_account').html(data[9]);
        }

        //選取新增聯絡人
        function EditThisContact2(tmp) {
            $('#plan2_div3').show();//編輯div
            $('#EditCorButton').hide();//新增編輯聯絡人--編輯
            $('#EditCorButton2').show();//新增聯絡人--編輯
            $('#plan2_div4').hide();//聯絡人清單div
            $('#plan2_div2').hide();//新增聯絡人性質清單div
            $('#AddCorButton2').show();//新增聯絡人--新增
            $('.editCor').hide();
            $('.Plan2_open_edit').prop('disabled', true);//關閉可編輯項

            var data = tmp.split(',');
            $('#Plan2_kind').html(data[0]);
            $('#Plan2_name').html(data[1]);
            $('#Plan2_office').val(data[2]);
            $('#Plan2_job').val(data[6]);
            $('#Plan2_phone1').val(data[4]);
            $('#Plan2_phone2').val(data[5]);
            $('#Plan2_email').val(data[8]);
            $('#Plan2_address').val(data[3]);
            $('#Plan2_fex').val(data[7]);
            $('#Plan2_account').html(data[9]);
        }

        //新增案件聯絡人
        function AddThisCorPI() {
            var data = {
                kind: $('#Plan2_kind').html(),
                account: $('#Plan2_account').html(),
                authority: ($('#Plan2_kind').html() !== '協同主持人')? '只能瀏覽':'可以修改',
                CaseNo: $('#CaseNo').html(),
            };

            a = { 'tmp': data };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/AddThisCorPI",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        ReadPlanContact($('#CaseNo').html());
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }
        
        //儲存聯絡人資料
        function SaveThisCorPI() {
            var data = {
                job: $('#Plan2_job').val(),
                office: $('#Plan2_office').val(),
                phone1: $('#Plan2_phone1').val(),
                phone2: $('#Plan2_phone2').val(),
                fex: $('#Plan2_fex').val(),
                email: $('#Plan2_email').val(),
                address: $('#Plan2_address').val(),
                account: $('#Plan2_account').html(),
            };

            a = { 'tmp': data };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/SaveThisCorPI",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        ReadPlanContact($('#CaseNo').html());
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //按下刪除
        function DeleteThisContact(account) {
            a = { 'account': account };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/DeleteThisCorPI",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        ReadPlanContact($('#CaseNo').html());
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }
    </script>

    <%--計畫總覽--%>
    <script>
        $(document).ready(function () {
            var y = "";
            for (var i = 1; i <= 20; i++) {
                y += '<option value="' + i.toString() + '">' + i.toString() + '</option>';
            }
            $('#plan3_7').append(y);
            var m = "";
            for (var i = 1; i <= 12; i++) {
                m += '<option value="' + i.toString() + '">' + i.toString() + '</option>';
            }
            $('#plan3_8').append(m);

            
            $('#table5 td:nth-child(1)').addClass('col-md-2');
            $('#table5 td:nth-child(2)').addClass('col-md-10');

        });
        //按下最上方按鈕--計畫總覽
        $('#plan3').click(function () {
            $('#plan3_CaseNo').html($('#CaseNo').html());
            ReadPlan3($('#CaseNo').html());
            $('.plan3_input').prop('disabled', true);
            $('.plan3_input').hide();
            $('.NA_remark').hide();
            $('.plan3_chk_div').hide();
            //$('.NA_remark').hide();
        });

        //編輯
        $('#plan3_EditButton').click(function () {
            $('#plan3_EditButton').hide();
            $('#plan3_SaveButton').show();
            $('#plan3_CancelButton').show();
            $('.plan3_input').prop('disabled', false);
            $('.plan3_input').show();
            $('.plan3_output').hide();
            $('.NA_remark').show();
            $('.plan3_chk_div').show();

            $('.plan3_other').each(function () {
                if ($(this).prop('checked') == false) $('#plan3_' + this.id.split('_')[1]).prop('disabled', true);
            })

            //特殊族群--無
            if ($('#plan3_16_none').prop('checked') == true) $('.plan3_16_none').prop('disabled', true);

            //受試者年齡層--其他
            if ($('#plan3_9_3').prop('checked') == false) $('#plan3_9').prop('disabled', true);

            //受試者年齡層--滿20歲
            if ($('#plan3_9_1').prop('checked') == true) $('.plan3_16:first').prop('disabled', true);

            //是否有給受試者營養補助費/交通費--有
            if ($('#plan3_17_yes').prop('checked') == false) {
                $('#plan3_17').prop('disabled', true);
                $('#plan3_18').prop('disabled', true);
            }

            $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
        });

        //儲存
        $('#plan3_SaveButton').click(function () {
            $('#plan3_SaveButton').hide();
            $('#plan3_EditButton').show();
            $('#plan3_CancelButton').hide();
            $('.NA_remark').hide();
            $('.plan3_input').prop('disabled', true);
            //alert($('#plan3_8').val());
            SavePlan3($('#CaseNo').html());
            $('.plan3_chk_div').hide();
            $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
        });

        //取消
        $('#plan3_CancelButton').click(function () {
            ReadPlan3($('#CaseNo').html());
            $('#plan3_SaveButton').hide();
            $('#plan3_EditButton').show();
            $('#plan3_CancelButton').hide();
            $('.NA_remark').hide();
            $('.plan3_input').prop('disabled', true);
            $('.plan3_input').hide();
            $('.plan3_output').show();
            $('.plan3_chk_div').hide();
            $("html,body").animate({ scrollTop: 0 }, 1000);//回到頁面頂端
        });

        //存取案件資料
        function SavePlan3(CaseNo) {
            a = { 'tmp': Plan3Item() };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/SavePlan3",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        OutputToSpan();//輸出到span
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        //從後端讀取案件資料
        function ReadPlan3(CaseNo) {
            a = {'CaseNo': CaseNo };
            $.ajax(
            {
                type: "POST",
                url: "02_02_01_new_plan.aspx/ReadPlan3",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        var D = data.d;
                        $('#plan3_PI').html(D.PI);//計畫主持人
                        $('#plan3_CorPI').html(D.CorPI);//協同主持人
                        $('#plan3_CorPI2').html(D.CorPI2);//委託廠商
                        $('#plan3_1').val(D.PICaseNo);//計畫編號
                        $('#plan3_2').val(D.TestMedicineItem);//試驗藥品醫療器材
                        $('#plan3_3').val(D.PlanNameCH);//中文計畫名稱
                        $('#plan3_4').val(D.PlanNameEN);//英文計畫名稱

                        //試驗執行地點
                        var tmp1 = D.PlanLocation.split('、');
                        for (var i = 0; i < tmp1.length; i++) {
                            $('.plan3_5').each(function () {
                                if ($(this).val() == tmp1[i]) $(this).prop('checked', true);
                            })
                        }

                        //試驗執行地點_其他
                        if (D.PlanLocationOther !== '') {
                            $('#plan3_5_chk').prop('checked', true);
                            $('#plan3_5').val(D.PlanLocationOther);
                        }

                        //執行本試驗之其他機構
                        $('#plan3_6').val(D.PlanOffice);

                        //進度期限
                        $('#plan3_7').val(D.PlanYear);
                        $('#plan3_8').val(D.PlanMonth);

                        //受試者年齡層
                        $("input[name=plan3_9_radio]").filter('[value="' + D.PeopleOld + '"]').prop('checked', true);

                        //受試者年齡層_其他
                        if (D.PeopleOldOther !== '') {
                            $("#plan3_9_3").prop('checked', true);
                            $('#plan3_9').val(D.PeopleOldOther);
                        }

                        //受試者人數
                        $('#plan3_10').val(D.People1);
                        $('#plan3_11').val(D.People2);
                        $('#plan3_12').val(D.People3);

                        //收納受試者方式
                        tmp1 = D.Way.split('、');
                        for (var i = 0; i < tmp1.length; i++) {
                            $('.plan3_13').each(function () {
                                if (tmp1[i] == $(this).val()) {
                                    $(this).prop('checked', true);
                                } 
                            })
                        }
                        //收納受試者方式_其他
                        if (D.WayOther !== '') {
                            $('#plan3_13').val(D.WayOther);
                            $('#plan3_13_chk').prop('checked', true);
                        }
                        
                        //受試者資料保秘方式
                        tmp1 = D.SecretWay.split('、');
                        for (var i = 0; i < tmp1.length; i++) {
                            $('.plan3_14').each(function () {
                                if (tmp1[i] == $(this).val()) {
                                    $(this).prop('checked', true);
                                }
                            })
                        }
                        //受試者資料保秘方式_其他
                        if (D.SecretWayOther !== '') {
                            $('#plan3_14').val(D.SecretWayOther);
                            $('#plan3_14_chk').prop('checked', true);
                        }

                        //會審視受試者資料的名單
                        $('#plan3_15').val(D.CheckPeople);

                        //特殊族群
                        tmp1 = D.Special.split('、');
                        for (var i = 0; i < tmp1.length; i++) {
                            $('.plan3_16').each(function () {
                                if (tmp1[i] == $(this).val()) {
                                    $(this).prop('checked', true);
                                }
                            })
                        }
                        //特殊族群_其他
                        if (D.SpecialOther !== '') {
                            $('#plan3_16').val(D.SecretWayOther);
                            $('#plan3_16_chk').prop('checked', true);
                        }

                        //受試者營養補助交通費_有無
                        $("input[name=plan3_17_radio]").filter('[value="' + D.HavePay + '"]').prop('checked', true);
                        //受試者營養補助交通費_每次總共 受試者營養補助交通費_元
                        if (D.HavePay == "有") {
                            $('#plan3_17').val(D.Pay);
                            $('#plan3_18').val(D.PayWay);
                        }

                        $('#plan3_19').val(D.Medicine);//研究用藥品學名
                        $('#plan3_20').val(D.Item);//商品名
                        $('#plan3_21').val(D.Type);//規格
                        $('#plan3_22').val(D.Vender);//製造廠商
                        $('#plan3_23').val(D.Country);//製造國別
                        $('#plan3_24').val(D.Section);//科別

                        OutputToSpan();//輸出到span
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }

        $('.plan3_other').click(function () {
            if ($(this).prop('checked') == false) {
                $('#plan3_' + this.id.split('_')[1]).prop('disabled', true);
                $('#plan3_' + this.id.split('_')[1]).val('');
            } else $('#plan3_' + this.id.split('_')[1]).prop('disabled', false);
        })

        

        //是否有給受試者營養補助費/交通費--有
        $('#plan3_17_yes').click(function () {
                $('#plan3_17').prop('disabled', false);
                $('#plan3_18').prop('disabled', false);
        })

        //是否有給受試者營養補助費/交通費--無
        $('#plan3_17_none').click(function () {
                $('#plan3_17').prop('disabled', true);
                $('#plan3_18').prop('disabled', true);
                $('#plan3_17').val('');
        })

        //特殊族群--無
        $('#plan3_16_none').click(function () {
            if ($('#plan3_16_none').prop('checked') == true) {
                $('.plan3_16_none').prop('disabled', true);
                $('.plan3_16_none').prop('checked', false);
                $('#plan3_16').val('');
            } else {
                $('.plan3_16_none').prop('disabled', false);
                //特殊族群--其他
                if ($('#plan3_16_chk').prop('checked') == false) $('#plan3_16').prop('disabled', true);
            }
        })

        //受試者年齡層
        $('input[name=plan3_9_radio]').click(function () {
            if ($(this).val() == "其他") {
                $('#plan3_9').prop('disabled', false);
                $('.plan3_16:first').prop('disabled', false);
            } else if ($(this).val() == "滿20歲") {
                $('.plan3_16:first').prop('disabled', true);
                $('.plan3_16:first').prop('checked', false);
                $('#plan3_9').prop('disabled', true);
                $('#plan3_9').val('');
            } else {
                $('.plan3_16:first').prop('disabled', false);
                $('#plan3_9').prop('disabled', true);
                $('#plan3_9').val('');
            }
        })

        //顯示結果
        function OutputToSpan() {
            $('.plan3_output').each(function () {
                var tmp_id = this.id.split('_')[1];
                var tmp_str = $('#plan3_' + tmp_id).val();
                if (tmp_id=="14"||tmp_id=="16"||tmp_id=="13") {
                    $('#' + this.id).html(plan3_result('plan3_' + tmp_id));
                } else if (tmp_id == "5") {
                    $('#' + this.id).html(plan3_result('plan3_' + tmp_id));
                }else if(tmp_id == "6"){
                    if ($('#plan3_' + tmp_id).val() !== '') $('#' + this.id).html("，執行本試驗之其他機構名稱：" + tmp_str);
                    else $('#' + this.id).html("");
                } else if (tmp_id == "9") {
                    if ($("input[name=plan3_9_radio]:checked").val() == "其他") {
                        $('#' + this.id).html($("#plan3_9").val());
                    } else {
                        $('#' + this.id).html($("input[name=plan3_9_radio]:checked").val());
                    }
                } else if (tmp_id == "17") {
                    var s = "";
                    if ($("input[name=plan3_17_radio]:checked").val() == "有") {
                        s = "有，" + $('#plan3_18').val() + "新台幣" + $('#plan3_17').val().toString() + "元";
                    } else if ($("input[name=plan3_17_radio]:checked").val() == "無") {
                        s = "無";
                    }
                    $('#' + this.id).html(s);
                }
                else {
                    $('#' + this.id).html(tmp_str);
                }
                

            });
            $('.plan3_input').hide();
            $('.plan3_output').show();
        }

        function plan3_result(ClassName) {
            var tmp = "";
            $('.' + ClassName).each(function () {
                if ($(this).prop('checked') == true && $(this).val() !== "" && $(this).val() !== "其他") {
                    tmp += $(this).val() + "、";
                } else if (this.id == ClassName + '_chk' && $('#' + ClassName + '_chk').prop('checked') == true && $('#' + ClassName).val() !== "") {
                    tmp += $('#' + ClassName).val() + "、";
                }
            })
            return tmp.substring(0, tmp.length - 1);
        }

        function plan3_result2(ClassName) {//不顯示其他
            var tmp = "";
            $('.' + ClassName).each(function () {
                if ($(this).prop('checked') == true && $(this).val() !== "" && $(this).val() !== "其他") {
                    tmp += $(this).val() + "、";
                }
            })
            return tmp.substring(0, tmp.length - 1);
        }

        //塞值到後端
        function Plan3Item() {
            var data = {
                PlanNameCH: $('#plan3_3').val(),
                PlanNameEN: $('#plan3_4').val(),
                PICaseNo : $('#plan3_1').val(),
                TestMedicineItem: $('#plan3_2').val(),
                PlanLocation: plan3_result2('plan3_5'),
                PlanLocationOther: $('#plan3_5').val(),
                PlanOffice: $('#plan3_6').val(),
                PlanYear: $('#plan3_7').val(),
                PlanMonth: $('#plan3_8').val(),
                PeopleOld: $("input[name=plan3_9_radio]:checked").val() == null ? '' : $("input[name=plan3_9_radio]:checked").val(),
                People1: $('#plan3_10').val() == '' ? 0 : $('#plan3_10').val(),
                People2: $('#plan3_11').val() == '' ? 0 : $('#plan3_11').val(),
                People3: $('#plan3_12').val() == '' ? 0 : $('#plan3_12').val(),
                Way: plan3_result2('plan3_13'),
                SecretWay: plan3_result2('plan3_14'),
                CheckPeople: $('#plan3_15').val(),
                Special: plan3_result2('plan3_16'),
                HavePay: $("input[name=plan3_17_radio]:checked").val() == null ? '' : $("input[name=plan3_17_radio]:checked").val(),
                PayWay: $("input[name=plan3_17_radio]:checked").val()=='有'?$('#plan3_18').val():'',
                Pay: $('#plan3_17').val() == '' ? 0 : $('#plan3_17').val(),
                Medicine: $('#plan3_19').val(),
                Item: $('#plan3_20').val(),
                Type: $('#plan3_21').val(),
                Vender: $('#plan3_22').val(),
                Country: $('#plan3_23').val(),
                Section: $('#plan3_24').val(),
                PeopleOldOther: $('#plan3_9').val(),
                WayOther: $('#plan3_13').val(),
                SecretWayOther: $('#plan3_14').val(),
                SpecialOther: $('#plan3_16').val(),
                CaseNo: $('#CaseNo').html(),
            };
            return data;
        }

    </script>

    <%--送審文件--%>
    <script>

    </script>
</body>
</html>
