$(document).ready(function () {

    $('.small').hide();//隱藏子選單

    //點選左邊母標題
    $('.big').click(function () {
        $('.small').not('.' + this.id).hide();//隱藏其他子標題
        $('.' + this.id).toggle();//收縮這個子標題
        $('#location2').html('');//目前位置子標題空白
        $('#location1').html($('#' + this.id).attr('title'));//目前位置
        $('#main').load($('#' + this.id).attr('link'));//載入主畫面
    });

    //點選左邊子選單，跑出主要畫面
    $('.small').click(function () {
        $('#location2').html('<span class="glyphicon glyphicon-forward"></span>' + $('#' + this.id).attr('title'));//目前位置
        $('#main').load($('#' + this.id).attr('link'));//載入主畫面
    })

    //點選左上角首頁
    $('#homepage').click(function () {
        $('#location2').html('');//目前位置子標題空白
        $('#location1').html('首頁');
    })
});