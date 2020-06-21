// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// フラッシュメッセージ
$(function() {
    setTimeout("$('#flash').fadeOut('slow')", 2000);
});


//■page topボタン
$(function(){
var topBtn=$('#pageTop');
topBtn.hide();

//◇ボタンの表示設定
$(window).scroll(function(){
  if($(this).scrollTop()>80){
    //---- 画面を80pxスクロールしたら、ボタンを表示する
    topBtn.fadeIn();

  }else{
    //---- 画面が80pxより上なら、ボタンを表示しない
    topBtn.fadeOut();
  }
});

// ◇ボタンをクリックしたら、スクロールして上に戻る
topBtn.click(function(){
  $('body,html').animate({
  scrollTop: 0},500);
  return false;
});


// カードに触るととひっくり返る
$('.flip').mouseenter(function(){         
      $(this).find('.card').addClass('flipped').mouseleave(function()
      {
         $(this).removeClass('flipped');
      });
    
  return false;
});
});

// スライドショー機能
$(function() {
  $('.a').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 2000,
  });
  // スライド下部の星に触ると画像が切り替わる
  $('.slick-dots li').on('mouseover', function() {
  $('.a').slick('goTo', $(this).index());
  });
});
