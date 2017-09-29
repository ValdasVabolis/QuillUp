//= require jquery
//= require rails-ujs
//= require underscore
//= require turbolinks
//= require handlebars.runtime
//= require_tree ./templates
//= require_tree .
//= require autosize

$(document).on('turbolinks:load', function() {
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

  Hamburger.init();

  Popover.init();

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
});
