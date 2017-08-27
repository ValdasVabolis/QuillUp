if($('#home-content').length > 0) {
  $(document).on('turbolinks:load', function() {
    var delete_key = 8;
    var limit = 5000;
   /* var answer = $('.answer-group[]');
    var text_area = $('.answer-group').find('#area');
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
    }); */
  });
}