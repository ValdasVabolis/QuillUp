$(document).on('turbolinks:load', function() {
  function showCharacterLimitTitle(limit) {
    var form = $('#form-question');
    var text_area = form.find('#title');
    var char_counter = form.find('.question-title > .char-counter p');
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

  function showCharacterLimitBody(limit) {
    var form = $('#form-question');
    var text_area = form.find('#area');
    var char_counter = form.find('.question-body > .char-counter p');
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

  if($('.question-new').length > 0) {
    showCharacterLimitTitle(200);
    showCharacterLimitBody(2500);
  }
});