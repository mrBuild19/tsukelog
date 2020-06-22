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
    // jQuery Upload Thumbs
    $('form input:file').uploadThumbs({
        position : 0,      // 0:before, 1:after, 2:parent.prepend, 3:parent.append,
                           // any: arbitrarily jquery selector
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
  $("#timeline-jscroll").infiniteScroll({
    path: "a.timeline-next",
    append: ".timeline-jscroll",
    hideNav: "a.timeline-next",
    scrollThreshold: true,
    history: false,
    prefill: true,
    status: ".page-load-status"
  });
});

// 投稿一覧画面新着タブ
$(document).on("turbolinks:load", function() {
  $("#arrival-jscroll").infiniteScroll({
    path: "a.arrival-next",
    append: ".arrival-jscroll",
    hideNav: "a.arrival-next",
    button: ".arrival-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});

// 投稿一覧画面人気タブ
$(document).on("turbolinks:load", function() {
  $("#popular-jscroll").infiniteScroll({
    path: "a.popular-next",
    append: ".popular-jscroll",
    hideNav: "a.popular-next",
    button: ".popular-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});

// ユーザー一覧画面&検索画面(ユーザー&投稿)
$(document).on("turbolinks:load", function() {
  $("#jscroll").infiniteScroll({
    path: "a.next",
    append: ".jscroll",
    hideNav: "a.next",
    button: ".button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});

// マイページ画面current_userの投稿タブ
$(document).on("turbolinks:load", function() {
  $("#my-jscroll").infiniteScroll({
    path: "a.my-next",
    append: ".my-jscroll",
    hideNav: "a.my-next",
    button: ".my-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});


// マイページ画面フォローリストタブ
$(document).on("turbolinks:load", function() {
  $("#follow-jscroll").infiniteScroll({
    path: "a.follow-next",
    append: ".follow-jscroll",
    hideNav: "a.follow-next",
    button: ".follow-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});

// マイページ画面フォロワーリストタブ
$(document).on("turbolinks:load", function() {
  $("#follower-jscroll").infiniteScroll({
    path: "a.follower-next",
    append: ".follower-jscroll",
    hideNav: "a.follower-next",
    button: ".follower-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});

// マイページ画面いいねした投稿タブ
$(document).on("turbolinks:load", function() {
  $("#like-jscroll").infiniteScroll({
    path: "a.like-next",
    append: ".like-jscroll",
    hideNav: "a.like-next",
    button: ".like-button",
    scrollThreshold: false,
    history: false,
    prefill: false,
    status: ".page-load-status"
  });
});