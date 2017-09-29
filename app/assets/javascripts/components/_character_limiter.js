var Text = (function($, m) {

  function LimitedText(opts) {
    var o = opts;
    var text_el = $(o.text_selector);
    var count_el = $(o.count_selector);
    var default_css = typeof o.default_css === 'undefined'
      ? { color: 'black' }
      : o.default_css;
    var exceeded_css = typeof o.exceeded_css === 'undefined'
      ? { color: 'red' }
      : o.exceeded_css;
    var current_count = null;

    var update_current_count = function(val) {
      if(typeof val === 'undefined') {
        return;
      }
      current_count = val.length;
    };

    var render_current_count = function() {
      count_el.html(o.limit - current_count);
      count_el.css(limit_exeeded() ? exceeded_css : default_css);
    };

    var limit_exeeded = function() {
      return text_el.val().length > o.limit;
    };

    var on_text_keyup = function(e) {
      var delayed = function() {
        update_current_count(text_el.val());
        render_current_count();
      };
      setTimeout(delayed, 100);
    };

    var init = function() {
      text_el.on('keyup paste', on_text_keyup);
      text_el.trigger('keyup');
    };

    init();
  }

  return {
    limit: function(opts) {
      return new LimitedText(opts);
    }
  };
}(jQuery, Text || {}));
