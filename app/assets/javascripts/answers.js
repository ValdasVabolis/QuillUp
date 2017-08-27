$(document).on('turbolinks:load', function() {
  function popoverShowing() {
    return Popover.showing;
  }
  function showCharacterLimit(limit) {
    var answer = $('.answer-group');
    var text_area = answer.find('#area');
    var char_counter = answer.find('.char-counter p');
    var length = text_area.val().length;
    var counter = length + '/' + limit; 
    char_counter.html(counter);

    function updateCounter() {
      length = text_area.val().length;
      counter = length + '/' + limit;
      char_counter.html(counter);
    }

    text_area.bind('keyup keydown', function(e) {
      updateCounter();
      if(length >= limit) {
        if(e.key !== 'Backspace') {
          this.value = this.value.substr(0, limit);
          return false;
        }
      }
    });

  }
  $('.home').on('popoverShown', function(){
    if(popoverShowing()) {
      showCharacterLimit(5000);
    } 
  });
});