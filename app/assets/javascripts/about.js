$(document).on('turbolinks:load', function() {
  function loadedOnPage(name) {
    return $('#' + name + '-content').length > 0;
  }
  function showCharacterLimit(limit) {
    var text_area = $('#about-me');
    var char_counter = $('.char-counter p');
    var length = text_area.val().length;
    var counter = length + '/' + limit; 
    char_counter.html(counter);

    function updateCounter() {
      length = text_area.val().length;
      counter = length + '/' + limit;
      char_counter.html(counter);
    }

    text_area.keyup(function(e) {
      updateCounter();
      if(length >= limit) {
        if(e.key !== 'Backspace') {
          return false;
        }
      }
    });
    text_area.keydown(function(e) {
      updateCounter();
    });

  }
  if(loadedOnPage('account')) {
    showCharacterLimit(200);
  }
});