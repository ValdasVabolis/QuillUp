$(document).on('turbolinks:load', function() {
  if($('.question-new').length > 0) {
    Text.limit({
      text_selector: '#question-title',
      count_selector: '#question-title-counter',
      default_css: { color: '#9E9E9E' },
      limit: 150
    });
    Text.limit({
      text_selector: '#question-area',
      count_selector: '#question-area-counter',
      default_css: { color: '#9E9E9E' },
      limit: 2500
    });
  }
});
