//秘書
var parent = [];
var parent0 = { title: '待處理案件', link: '01_01_01_new_account.aspx' };
parent.push(parent0);
var parent1 = { title: '計畫資料', link: 'Template2.aspx' };
parent.push(parent1);
var parent2 = { title: '行政管理', link: 'Template2.aspx' };
parent.push(parent2);
var parent3 = { title: '處理追蹤', link: 'Template2.aspx' };
parent.push(parent3);
var parent4 = { title: '系統管理', link: 'Template2.aspx' };
parent.push(parent4);
var parent5 = { title: '查詢報表', link: 'Template2.aspx' };
parent.push(parent5);
var parent6 = { title: '會議管理', link: 'Template2.aspx' };
parent.push(parent6);


var child0 = [], child1 = [], child2 = [], child3 = [], child4 = [], child5 = [], child6 = [];

var child00 = { title: '新帳號申請', link: '01_01_01_new_account.aspx' };
child0.push(child00);
var child01 = { title: '送審案件', link: 'Template2.aspx' };
child0.push(child01);
var child02 = { title: '審查委員', link: 'https://www.google.com.tw/' };
child0.push(child02);
var child03 = { title: '執行秘書', link: 'https://www.google.com.tw/' };
child0.push(child03);
var child04 = { title: '主任委員', link: 'https://www.google.com.tw/' };
child0.push(child04);

var child10 = { title: '計畫基本資料', link: 'https://www.google.com.tw/' };
child1.push(child10);
var child11 = { title: '計畫審查資料', link: 'https://www.google.com.tw/' };
child1.push(child11);
var child12 = { title: 'SAE', link: 'https://www.google.com.tw/' };
child1.push(child12);
var child13 = { title: '試驗偏差', link: 'https://www.google.com.tw/' };
child1.push(child13);
var child14 = { title: '修正案', link: 'https://www.google.com.tw/' };
child1.push(child14);
var child15 = { title: '期中報告', link: 'https://www.google.com.tw/' };
child1.push(child15);
var child16 = { title: '結案報告', link: 'https://www.google.com.tw/' };
child1.push(child16);
var child17 = { title: '計畫終(中)止', link: 'https://www.google.com.tw/' };
child1.push(child17);
var child18 = { title: '撤案申請', link: 'https://www.google.com.tw/' };
child1.push(child18);

var child20 = { title: '計畫聯絡資料', link: 'https://www.google.com.tw/' };
child2.push(child20);
var child21 = { title: '多中心聯絡', link: 'https://www.google.com.tw/' };
child2.push(child21);
var child22 = { title: '計畫查核紀錄', link: 'https://www.google.com.tw/' };
child2.push(child22);
var child23 = { title: '合約審查', link: 'https://www.google.com.tw/' };
child2.push(child23);
var child24 = { title: '委員資料', link: 'https://www.google.com.tw/' };
child2.push(child24);

var child30 = { title: '案件追蹤', link: 'https://www.google.com.tw/' };
child3.push(child30);
var child31 = { title: 'Email通知維護', link: 'https://www.google.com.tw/' };
child3.push(child31);

var child40 = { title: '系統設定', link: 'https://www.google.com.tw/' };
child4.push(child40);
var child41 = { title: '登入紀錄', link: '01_05_02_visit.aspx' };
child4.push(child41);
var child42 = { title: '帳戶設定', link: '01_05_03_account.aspx' };
child4.push(child42);

var child50 = { title: '計畫基本資料', link: 'https://www.google.com.tw/' };
child5.push(child50);
var child51 = { title: 'SAE通報', link: 'https://www.google.com.tw/' };
child5.push(child51);
var child52 = { title: '試驗偏差', link: 'https://www.google.com.tw/' };
child5.push(child52);
var child53 = { title: '委員資料', link: 'https://www.google.com.tw/' };
child5.push(child53);

var child60 = { title: '會議資料', link: 'https://www.google.com.tw/' };
child6.push(child60);
var child61 = { title: '開會通知維護', link: 'https://www.google.com.tw/' };
child6.push(child61);

var child = [child0, child1, child2, child3, child4, child5, child6];

$(document).ready(function () {
    var tmp = '<div class="btn-group-vertical">';
    for (var i = 0; i < parent.length; i++) {
        tmp += '<button type="button" class="btn big" id="child' + i.toString() + '" link="' + parent[i].link + '" style="text-align:left;" title="' + parent[i].title + '">' + parent[i].title + '</button>';
        for (var j = 0; j < child[i].length; j++) {
            tmp += '<button type="button" class="btn btn-default small child' + i.toString() + '" link="' + child[i][j].link + '" id="child' + i.toString() + j.toString() + '" style="text-align:left;" title="' + child[i][j].title + '">' + child[i][j].title + '</button>';
        }
    }
    tmp += '</div>';
    $('#left').append($(tmp));
})
