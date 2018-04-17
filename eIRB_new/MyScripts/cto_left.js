//cto
var parent = [];
var parent0 = { title: '計畫資料', link: 'Template2.aspx' };
parent.push(parent0);
var parent1 = { title: '處理追蹤', link: 'Template2.aspx' };
parent.push(parent1);

var child0 = [], child1 = [];

var child00 = { title: '計畫基本資料', link: 'https://www.google.com.tw/' };
child0.push(child00);
var child01 = { title: '計畫審查資料', link: 'https://www.google.com.tw/' };
child0.push(child01);
var child02 = { title: 'SAE', link: 'https://www.google.com.tw/' };
child0.push(child02);
var child03 = { title: '試驗偏差', link: 'https://www.google.com.tw/' };
child0.push(child03);
var child04 = { title: '修正案', link: 'https://www.google.com.tw/' };
child0.push(child04);
var child05 = { title: '期中報告', link: 'https://www.google.com.tw/' };
child0.push(child05);
var child06 = { title: '結案報告', link: 'https://www.google.com.tw/' };
child0.push(child06);
var child07 = { title: '計畫終(中)止', link: 'https://www.google.com.tw/' };
child0.push(child07);
var child08 = { title: '撤案申請', link: 'https://www.google.com.tw/' };
child0.push(child08);

var child10 = { title: 'Email通知維護', link: 'https://www.google.com.tw/' };
child1.push(child10);


var child = [child0, child1];

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
