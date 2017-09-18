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

$(document).on('turbolinks:load', function() {
  $(show_hide_alert);

  $(document).on('click', '.fa-bars', function(e) {
    alert('fa-bars click');
    e.stopPropagation();
    $('nav ul').toggleClass('shown');
  });

  $(document).on('click', function(e) {
    alert('fa-bars close');
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

  $(document).on('click', '.cancel-reply', function(e) {
    e.preventDefault();
    var id = $(this).closest('.question-answer').attr('data-id');
    $('#popover-view-contents .question-answer[data-id="' + id + '"]').removeClass('replying');
  });

  $(document).on('click', '#cancel-comment', function(e) {
    e.preventDefault();
    var id = $(this).closest('.answer-comment').attr('data-id');
    $('#popover-view-contents .answer-comment[data-id="' + id + '"]').removeClass('editing');
  });

  AlertNotice.init({
    selector: '.alert-notice',
    css: {
      show: {
        bottom: '0px'
      },
      hide: {
        bottom: '-60px'
      }
    }
  });

  Popover.init();
});
