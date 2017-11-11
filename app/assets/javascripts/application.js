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
    $('.question-large').removeClass('editing');
  });

  $(document).on('click', '.cancel-answer', function(e) {
    e.preventDefault();
    var id = $(this).closest('.question-answer').attr('data-id');
    $('.question-answer[data-id="' + id + '"]').removeClass('editing');
  });

  $(document).on('click', '.cancel-reply', function(e) {
    e.preventDefault();
    var id = $(this).closest('.question-answer').attr('data-id');
    $('.question-answer[data-id="' + id + '"]').removeClass('replying');
  });

  $(document).on('click', '#cancel-comment', function(e) {
    e.preventDefault();
    var id = $(this).closest('.answer-comment').attr('data-id');
    $('.answer-comment[data-id="' + id + '"]').removeClass('editing');
  });

  Hamburger.init();

  Popover.init({
    after_exit: function() {
      if(window.history.pushState) {
        var hash_index = window.location.href.indexOf('#');
        var slice_index = hash_index === -1 ? 0 : hash_index;
        var slice = window.location.href.slice(0, slice_index);
        window.history.pushState('', '/', slice);
      } else {
        window.location.hash = '';
      }
    }
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
});
