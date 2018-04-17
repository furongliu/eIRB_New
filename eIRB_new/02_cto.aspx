<%@ Page Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="02_cto.aspx.cs" Inherits="eIRB_new._02_cto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row content">
        <div class="col-sm-1 text-left" id="left">
            <label id="LoginName" runat="server"></label>
            您好<br />
        </div>
        <div class="col-sm-11 text-left">
            <div>
                <span class="glyphicon glyphicon-globe"></span>目前位置：
                    <span id="location1">首頁</span>
                <span id="location2"></span>
                <span id="location3"></span>
            </div>
            <div id="main"></div>
        </div>
    </div>
    <script src="MyScripts/cto_left.js"></script>
    <script src="MyScripts/left_menu_show_hide.js"></script>
</asp:Content>