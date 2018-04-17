//PI
var parent = [];
var parent0 = { title: '待回覆案件', link: 'Template2.aspx' };
parent.push(parent0);
var parent1 = { title: '新案件申請', link: 'Template2.aspx' };
parent.push(parent1);
var parent2 = { title: '審理中的報告', link: 'Template2.aspx' };
parent.push(parent2);
var parent3 = { title: '報告撰寫', link: 'Template2.aspx' };
parent.push(parent3);
var parent4 = { title: '歸檔案件', link: 'Template2.aspx' };
parent.push(parent4);

var child1 = [], child2 = [];

var child10 = { title: '新申請', link: '02_02_01_new_plan.aspx' };
child1.push(child10);
var child11 = { title: '編輯中', link: '02_02_02_edit_plan.aspx' };
child1.push(child11);
var child12 = { title: '審核中', link: '02_02_03_read_plan.aspx' };
child1.push(child12);

var child20 = { title: 'SAE通報', link: 'https://www.google.com.tw/' };
child2.push(child20);
var child21 = { title: '期中報告', link: 'https://www.google.com.tw/' };
child2.push(child21);
var child22 = { title: '結案報告', link: 'https://www.google.com.tw/' };
child2.push(child22);
var child23 = { title: '計畫終止/中止', link: 'https://www.google.com.tw/' };
child2.push(child23);
var child24 = { title: '試驗偏差', link: 'https://www.google.com.tw/' };
child2.push(child24);
var child25 = { title: '撤案申請', link: 'https://www.google.com.tw/' };
child2.push(child25);
var child26 = { title: '修正案', link: 'https://www.google.com.tw/' };
child2.push(child26);
var child27 = { title: '檢體', link: 'https://www.google.com.tw/' };
child2.push(child27);

var child = ["",child1, child2,"",""];

$(document).ready(function () {
    var tmp = '<div class="btn-group-vertical">';
    for (var i = 0; i < parent.length; i++) {
        tmp += '<button type="button" class="btn big" id="child' + i.toString() + '" link="' + parent[i].link + '" style="text-align:left;" title="'+ parent[i].title+'">' + parent[i].title + '</button>';
            if (i !== 0 && i !== 3 && i !== 4) {
                for (var j = 0; j < child[i].length; j++) {
                    tmp += '<button type="button" class="btn btn-default small child' + i.toString() + '" link="' + child[i][j].link + '" id="child' + i.toString() + j.toString() + '" style="text-align:left;" title="' + child[i][j].title + '">' + child[i][j].title + '</button>';
                }
            }
    }
    tmp += '</div>';
    $('#left').append($(tmp));
})
