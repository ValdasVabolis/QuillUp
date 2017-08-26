$(document).on('turbolinks:load', function() {
  var delete_key = 8;
  var limit = 200;
  var text_area = $('#about-me');
  var char_counter = $('.char-counter p');
  var length = text_area.val().length;
  var counter = length + '/' + limit; 
  char_counter.html(counter);

  text_area.keydown(function(e) {
    length = text_area.val().length;
    counter = length + '/' + limit; 
    char_counter.html(counter);
    if(length >= limit) {
      if(e.which !== delete_key) {
        return false;
      }
    }
  });
});