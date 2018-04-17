<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="00_logon.aspx.cs" Inherits="eIRB_new._00_logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {
            height: 450px;
        }

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

            .row.content {
                height: auto;
            }
        }

        body {
            font-family: 'Microsoft JhengHei';
            height: 100%;
            margin: 0;
            padding: 0;
        }

        footer {
            background-color: #c1c1c1;
            position: fixed;
            !important;
            width: 100%;
            bottom: 0;
            z-index: 5;
            height: 7%;
            background-repeat: repeat-x;
            _position: absolute;
            _top: expression(document.body.scrollTop+document.body.clientHeight-this.clientHeight);
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" id="homepage"><span class="glyphicon glyphicon-home"></span>首頁</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <%--<ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
      </ul>--%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" onclick="Change('login','submit1','submit2')"><span class="glyphicon glyphicon-log-in"></span>登入</a></li>
                    <li><a href="#" onclick="Change('submit1','submit2','login')"><span class="glyphicon glyphicon-edit"></span>註冊</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid text-center">
        <div class="row content" id="login">
            <div class="modal-dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center;">
                            <%--<img src="" />--%>
                            <h4 class="modal-title" style="text-align: center;">登入</h4>
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <div class="input-group col-sm-10">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="account" type="text" class="form-control" name="account" placeholder="請輸入帳號" />
                                    </div>
                                    <div class="col-sm-1"></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <div class="input-group col-sm-10">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="password" type="password" class="form-control" name="password" placeholder="請輸入密碼" />
                                    </div>
                                    <div class="col-sm-1"></div>
                                </div>
                            </form>
                            <br />
                            <button type="button" class="btn btn-success" id="LoginButton">登入</button>
                            <button type="button" onclick="Change('submit1','submit2','login')" class="btn btn-default">註冊</button>
                        </div>
                        <div class="modal-footer" style="text-align: right;"><a href="#" style="font-size: 16px;"><b>忘記密碼</b></a></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row content" id="submit1">
            <div class="modal-dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center;">
                            <%--<img src="" />--%>
                            <h4 class="modal-title" style="text-align: center;">註冊</h4>
                        </div>
                        <div class="modal-body" style="text-align: left">
                            <form class="form-horizontal">
                                <span class="glyphicon glyphicon-star-empty" style="color: red;"></span>為必填<br />
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">帳號<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 account1">
                                        <input class="form-control submit1" id="account1" type="text" placeholder="可輸入3-10碼英文/數字/底線" onchange="CheckAccount();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="account1_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="account1_error"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">密碼<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 password1">
                                        <input class="form-control submit1" id="password1" type="password" placeholder="可輸入3-10碼大小寫英文/數字/底線" onchange="CheckPassword1();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="password1_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="password1_error"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">再次輸入<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 password2">
                                        <input class="form-control submit1" id="password2" type="password" placeholder="再次輸入相同密碼" onchange="CheckPassword2();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="password2_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="password2_error"></span>
                                    </div>
                                </div>
                                <br />
                                <ul class="pager">
                                    <li class="previous"><a href="#" onclick="Refresh(1);">清空全部</a></li>
                                    <li class="next"><a href="#" onclick="SubmitCheck1('account1,password1,password2');">下一步</a></li>
                                </ul>
                            </form>
                        </div>
                        <div class="modal-footer" style="text-align: right;"><a href="#" style="font-size: 16px;" onclick="Change('login','submit2','submit1');Refresh(1);Refresh(2);"><b>回到登入頁面</b></a></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row content" id="submit2">
            <div class="modal-dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center;">
                            <%--<img src="" />--%>
                            <h4 class="modal-title" style="text-align: center;">註冊</h4>
                        </div>
                        <div class="modal-body" style="text-align: left">
                            <form class="form-horizontal">
                                <span class="glyphicon glyphicon-star-empty" style="color: red;"></span>為必填<br />
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">帳號</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" id="account2" type="text" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 name1">
                                        <input class="form-control submit2" id="name1" type="text" placeholder="請輸入您的姓名" onchange="CheckName();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="name1_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="name1_error"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Email<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 email1">
                                        <input class="form-control submit2" id="email1" type="text" placeholder="請輸入您的Email" onchange="CheckEmail();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="email1_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="email1_error"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">手機<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9 phone1">
                                        <input class="form-control submit2" id="phone1" type="text" placeholder="請輸入您的手機" onchange="CheckPhone();" />
                                        <span class="glyphicon glyphicon-ok form-control-feedback" id="phone1_check"></span>
                                        <span class="glyphicon glyphicon-remove form-control-feedback" id="phone1_error"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">單位(學校)名稱<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9">
                                        <input class="form-control submit2 NotNull" id="office1" type="text" placeholder="請輸入您的單位(學校)名稱" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">職稱<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9">
                                        <input class="form-control submit2 NotNull" id="job1" type="text" placeholder="請輸入您的職稱" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">連絡電話</label>
                                    <div class="col-sm-9">
                                        <input class="form-control submit2" id="phone2" type="text" placeholder="請輸入您的連絡電話" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">傳真</label>
                                    <div class="col-sm-9">
                                        <input class="form-control submit2" id="fex1" type="text" placeholder="請輸入您的傳真" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地址<span class="glyphicon glyphicon-star-empty" style="color: red;"></span></label>
                                    <div class="col-sm-9">
                                        <input class="form-control submit2 NotNull" id="address1" type="text" placeholder="請輸入您的地址" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">備註</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control submit2" rows="3" id="note1"></textarea>
                                    </div>
                                </div>
                                <br />
                                <ul class="pager">
                                    <li class="previous"><a href="#" onclick="Refresh(2);">清空全部</a></li>
                                    <li class="next"><a href="#" onclick="SubmitButton()">送出</a></li>
                                </ul>
                            </form>
                        </div>
                        <div class="modal-footer" style="text-align: right;"><a href="#" style="font-size: 16px;" onclick="Change('login','submit1','submit2');Refresh(1);Refresh(2);"><b>回到登入頁面</b></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="container-fluid text-right">
        <p>
            創源生物科技 分子視算中心製作 © 2018 
            <br />
            <a href="http://www.gga.asia" target="_blank"><b>www.gga.asia</b></a>
        </p>
    </footer>
</body>

<script>
    $(document).ready(function () {
        $('#submit1').hide();
        $('#submit2').hide();

        $('.glyphicon-ok').hide();
        $('.glyphicon-remove').hide();

        //登入
        $('#LoginButton').click(function () {
            if ($('#account').val() === '' || $('#password').val() === '') {
                alert('請輸入帳號/密碼.');
            }
            else {
                a = { 'account': $('#account').val(), 'password': $('#password').val() };
                $.ajax(
                {
                    type: "POST",
                    url: "00_logon.aspx/Login",
                    data: JSON.stringify(a),
                    datatype: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success:
                        function (data) {
                            if (data.d === "秘書") {
                                window.open('01_secret.aspx', '_self');
                            }
                            else if (data.d === "醫師") {
                                window.open('02_applier.aspx', '_self');
                            }
                            else if (data.d === "CTO管理") {
                                window.open('02_cto.aspx', '_self');
                            }
                            else {
                                alert(data.d);
                            }
                        },
                    failure:
                        function () {
                            alert('Insert Error');
                        }
                });
            }
        });

    });

    function SubmitCheck1() {
        if ($('#account1_error').attr('style') === "display: none;" && $('#account1_check').attr('style') !== "display: none;" && CheckPassword1() === 1 && CheckPassword2() === 1) {
            $('#account2').val($('#account1').val());
            Change('submit2', 'submit1', 'login');
        }
        else {
            CheckAccount();
            CheckPassword1();
            CheckPassword2();
        }
    }

    //清空全部
    function Refresh(item) {
        $('.submit' + item).val('');
        $('.glyphicon-ok').hide();
        $('.glyphicon-remove').hide();
        if (item === 1) {
            $('.account1').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
            $('.password1').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
            $('.password2').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
        }
        else {
            $('.name1').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
            $('.email1').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
            $('.phone1').removeClass('has-success has-feedback').removeClass('has-error has-feedback');
        }
    }

    function Change(Show1, Close1, Close2) {
        $('#' + Show1).show();
        $('#' + Close1).hide();
        $('#' + Close2).hide();
    }

    //送出
    function SubmitButton() {
        if ($('#name1_error').attr('style') === "display: none;" && $('#name1_check').attr('style') !== "display: none;"
            && $('#email1_error').attr('style') === "display: none;" && $('#email1_check').attr('style') !== "display: none;"
            && $('#phone1_error').attr('style') === "display: none;" && $('#phone1_check').attr('style') !== "display: none;"
            && $('.NotNull').val() !== '') {
            a = {
                'account': $('#account1').val(),
                'password': $('#password1').val(),
                'name': $('#name1').val(),
                'email': $('#email1').val(),
                'phone1': $('#phone1').val(),
                'office': $('#office1').val(),
                'job': $('#job1').val(),
                'phone2': $('#phone2').val(),
                'fex': $('#fex1').val(),
                'address': $('#address1').val(),
                'note': $('#note1').val()
            };
            $.ajax(
            {
                type: "POST",
                url: "00_logon.aspx/Submit",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        if (data.d === "") {
                            alert('註冊成功!\n 請等候秘書開通帳號.');
                            window.open('00_logon.aspx', '_self');
                        }
                        else {
                            alert(data.d);
                        }
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }
        else if ($('#job1').val() === '' || $('#office1').val() === '' || $('#address1').val() === '') {
            alert('請輸入必填欄位.');
        }
        else {
            CheckName();
            CheckEmail();
            CheckPhone();
        }
    }

    function CheckAccount() {
        if ($('#account1').val().length < 3 || $('#account1').val().length > 10) {
            $('#account1_error').show();
            $('#account1_check').hide();
            $('.account1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            a = { 'account': $('#account1').val() };
            $.ajax(
            {
                type: "POST",
                url: "00_logon.aspx/CheckAccount",
                data: JSON.stringify(a),
                datatype: 'json',
                contentType: 'application/json;charset=utf-8',
                success:
                    function (data) {
                        if (data.d === "") {
                            $('#account1_error').hide();
                            $('#account1_check').show();
                            $('.account1').removeClass('has-error has-feedback').addClass('has-success has-feedback');
                        }
                        else {
                            result = 0;
                            alert(data.d);
                            $('#account1_error').show();
                            $('#account1_check').hide();
                            $('.account1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
                        }
                    },
                failure:
                    function () {
                        alert('Insert Error');
                    }
            });
        }
    }

    function CheckPassword1() {
        var result = 0;
        if ($('#password1').val().length < 3 || $('#password1').val().length > 10) {
            $('#password1_error').show();
            $('#password1_check').hide();
            $('.password1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            $('#password1_error').hide();
            $('#password1_check').show();
            $('.password1').removeClass('has-error has-feedback').addClass('has-success has-feedback');
            result = 1;
        }
        //alert('password1'+result);
        return result;
    }

    function CheckPassword2() {
        var result = 0;
        if ($('#password2').val() !== $('#password1').val() || $('#password1').val().length < 3 || $('#password1').val().length > 10) {
            $('#password2_error').show();
            $('#password2_check').hide();
            $('.password2').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            $('#password2_error').hide();
            $('#password2_check').show();
            $('.password2').removeClass('has-error has-feedback').addClass('has-success has-feedback');
            result = 1;
        }
        //alert('password2'+result);
        return result;
    }

    function CheckName() {
        if ($('#name1').val() === '') {
            $('#name1_error').show();
            $('#name1_check').hide();
            $('.name1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            $('#name1_error').hide();
            $('#name1_check').show();
            $('.name1').removeClass('has-error has-feedback').addClass('has-success has-feedback');
        }
    }

    function CheckEmail() {
        if ($('#email1').val() === '') {
            $('#email1_error').show();
            $('#email1_check').hide();
            $('.email1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            $('#email1_error').hide();
            $('#email1_check').show();
            $('.email1').removeClass('has-error has-feedback').addClass('has-success has-feedback');
        }
    }

    function CheckPhone() {
        if ($('#phone1').val() === '') {
            $('#phone1_error').show();
            $('#phone1_check').hide();
            $('.phone1').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        }
        else {
            $('#phone1_error').hide();
            $('#phone1_check').show();
            $('.phone1').removeClass('has-error has-feedback').addClass('has-success has-feedback');
        }
    }

</script>
</html>
