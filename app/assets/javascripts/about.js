$(document).on('turbolinks:load', function() {
  if($('#account-content').length > 0) {
    Text.limit({
      text_selector: '#about-me',
      count_selector: '#about-me-counter',
      limit: 200
    });
  }
});
