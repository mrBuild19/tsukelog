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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap.min.js

$(document).on("turbolinks:load", function() {
  $('.bxslider').bxSlider({
    adaptiveHeight: true,
    responsive: true,
    slideWidth: 550
  });
});

function onbxslider() {
  $('.bxslider').bxSlider({
    adaptiveHeight: true,
    responsive: true
  });
};


$(document).on("turbolinks:load", function() {
  // jQuery Upload Thumbs
  $('form input:file').uploadThumbs({
      position : 0      // 0:before, 1:after, 2:parent.prepend, 3:parent.append,
  });
});


$(document).on('turbolinks:load', function() {
  $(function(){
    //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
    $('form').on('change', 'input[type="file"]', function(e) {
      var file = e.target.files[0],
          reader = new FileReader(),
          $subimageboxs = $(".form_main");
          t = this;

      // 画像ファイル以外の場合は何もしない
      if(file.type.indexOf("image") < 0){
        return false;
      }

      // ファイル読み込みが完了した際のイベント登録
      reader.onload = (function(file) {
        return function(e) {
          //既存のプレビューを削除
          $subimageboxs.empty();
        };
      })(file);

      reader.readAsDataURL(file);
    });
  });
});



// TODO DRY原則。変数を用いて、最小限まで減らす。
// TODO BUG 次のページがない時の処理
// 投稿一覧画面タイムラインタブ
$(document).on("turbolinks:load", function() {
  if ( $('#timeline-scroll').find('.timeline-next').length ){
    $("#timeline-scroll").infiniteScroll({
      path: "a.timeline-next",
      append: ".timeline-scroll",
      hideNav: "a.timeline-next",
      scrollThreshold: true,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
});

// 投稿一覧画面新着タブ
$(document).on("turbolinks:load", function() {
  if ( $('#arrival-scroll').find('.arrival-next').length ){
    $("#arrival-scroll").infiniteScroll({
      path: "a.arrival-next",
      append: ".arrival-scroll",
      hideNav: "a.arrival-next",
      button: ".arrival-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.arrival-button').hide();
  }
});

// 投稿一覧画面人気タブ
$(document).on("turbolinks:load", function() {
  if ( $('#popular-scroll').find('.popular-next').length ){
    $("#popular-scroll").infiniteScroll({
      path: "a.popular-next",
      append: ".popular-scroll",
      hideNav: "a.popular-next",
      button: ".popular-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.popular-button').hide();
  }
});

// ユーザー一覧画面&検索画面(ユーザー&投稿)
$(document).on("turbolinks:load", function() {
  if ( $('#scroll').find('.next').length ){
    $("#scroll").infiniteScroll({
      path: "a.next",
      append: ".scroll",
      hideNav: "a.next",
      button: ".button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.button').hide();
  }
});

// マイページ画面current_userの投稿タブ
$(document).on("turbolinks:load", function() {
  if ( $('#my-scroll').find('.my-next').length ){
    $("#my-scroll").infiniteScroll({
      path: "a.my-next",
      append: ".my-scroll",
      hideNav: "a.my-next",
      button: ".my-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.my-button').hide();
  }
});


// マイページ画面フォローリストタブ
$(document).on("turbolinks:load", function() {
  if ( $('#follow-scroll').find('.follow-next').length ){
    $("#follow-scroll").infiniteScroll({
      path: "a.follow-next",
      append: ".follow-scroll",
      hideNav: "a.follow-next",
      button: ".follow-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.follow-button').hide();
  }
});

// マイページ画面フォロワーリストタブ
$(document).on("turbolinks:load", function() {
  if ( $('#follower-scroll').find('.follower-next').length ){
    $("#follower-scroll").infiniteScroll({
      path: "a.follower-next",
      append: ".follower-scroll",
      hideNav: "a.follower-next",
      button: ".follower-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.follower-button').hide();
  }
});

// マイページ画面いいねした投稿タブ
$(document).on("turbolinks:load", function() {
  if ( $('#like-scroll').find('.like-next').length ){
    $("#like-scroll").infiniteScroll({
      path: "a.like-next",
      append: ".like-scroll",
      hideNav: "a.like-next",
      button: ".like-button",
      scrollThreshold: false,
      history: false,
      prefill: false,
      status: ".page-load-status"
    });
  }
  else {
    $('.like-button').hide();
  }
});