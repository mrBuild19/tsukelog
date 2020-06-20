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

// $(document).on('turbolinks:load', function() {
//   $('.timeline-jscroll').jscroll({
//   	autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.timeline-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.timeline-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.arrival-jscroll').jscroll({
//   	autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.arrival-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.arrival-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.popular-jscroll').jscroll({
//   	autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.popular-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.popular-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.my_postr-jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.my_postr-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.my_postr-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.follow-jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.follow-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.follow-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.follower-jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.follower-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.follower-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on('turbolinks:load', function() {
//   $('.like-jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.like-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.like-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// // 投稿検索画面の検索結果の無限スクロールmugennsukuro-ru
// $(document).on('turbolinks:load', function() {
//   $('.search-jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.search-jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.search-next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });


// $(document).on('turbolinks:load', function() {
//   $('#jscroll').jscroll({
//     autoTrigger: false,
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.jscroll',
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// 変数を用いて、最小限まで減らす。
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

// ユーザータブ
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