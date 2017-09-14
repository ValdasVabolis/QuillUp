//= require jquery
//= require rails-ujs
//= require turbolinks
//= require handlebars.runtime
//= require_tree ./templates
//= require_tree .
//= require autosize

var show_hide_alert = function() {
  var el = $('.alert');
  el.addClass('shown');
  setTimeout(function() {
    el.removeClass('shown');
  }, 3000);
};

$(show_hide_alert);

$(function() {
  $(document).on('click', '.fa-bars', function(e) {
    $('nav ul').toggleClass('shown');
    e.stopPropagation();
  });

  $(document).on('click', function(e) {
    $('nav ul').removeClass('shown');
  });

  $(document).on('click', '#cancel-question', function(e) {
    e.preventDefault();
    $('#popover-view-contents .question-large').removeClass('editing');
  });

  $(document).on('click', '.cancel-answer', function(e) {
    e.preventDefault();
    var id = $(this).closest('.question-answer').attr('data-id');
    $('#popover-view-contents .question-answer[data-id="' + id + '"]').removeClass('editing');
  });

  $(document).on('click', '#cancel-reply', function(e) {
    e.preventDefault();
    var id = $(this).closest('.question-answer').attr('data-id');
    $('#popover-view-contents .question-answer[data-id="' + id + '"]').removeClass('replying');
  });

  $(document).on('click', '#cancel-comment', function(e) {
    e.preventDefault();
    var id = $(this).closest('.answer-comment').attr('data-id');
    $('#popover-view-contents .answer-comment[data-id="' + id + '"]').removeClass('editing');
  });
});