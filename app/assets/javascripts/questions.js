$(document).on('turbolinks:load', function() {
  if($('.question-new').length > 0) {
    Text.limit({
      text_selector: '#question-title',
      count_selector: '#question-title-counter',
      limit: 150
    });
    Text.limit({
      text_selector: '#question-area',
      count_selector: '#question-area-counter',
      limit: 2500
    });
  }
});