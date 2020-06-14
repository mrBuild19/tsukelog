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
//= require jquery.jscroll.min.js
//= require bootstrap.min.js

$(document).on('turbolinks:load', function() {
  $('.timeline-jscroll').jscroll({
  	autoTrigger: false,
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.timeline-jscroll',
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.timeline-next',
    // 読み込み中の表示はどうする？
    loadingHtml: '読み込み中'
  });
});

$(document).on('turbolinks:load', function() {
  $('.arrival-jscroll').jscroll({
  	autoTrigger: false,
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.arrival-jscroll',
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.arrival-next',
    // 読み込み中の表示はどうする？
    loadingHtml: '読み込み中'
  });
});

$(document).on('turbolinks:load', function() {
  $('.popular-jscroll').jscroll({
  	autoTrigger: false,
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.popular-jscroll',
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.popular-next',
    // 読み込み中の表示はどうする？
    loadingHtml: '読み込み中'
  });
});