var Question = (function($, m) {

  var init = function() {
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

    var hash_id = window.location.hash.slice(1);
    if(hash_id.length > 0) {
      var row = $('.question-small[data-id=' + hash_id + ']');
      row.find('.question-title a')[0].click();
    }
  };

  var showing = function(id) {
    window.location.hash = id;
  };

  // public api
  return {
    init: init,
    showing: showing
  };
}(jQuery, Question || {}));
