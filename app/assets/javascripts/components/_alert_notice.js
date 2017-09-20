var AlertNotice = (function() {
  var el = null;
  var config = {
    ms_displayed: 3000,
    ms_animated: 1000
  };

  var configure = function(overrides) {
    config = $.extend(true, config, overrides);
    el = $(config.selector);
  };

  var ready = function() {
    el.css(config.css.hide);
    callback('before');
  };

  var show = function() {
    el.animate(
      config.css.show,
      config.ms_animated,
      hide
    );
  };

  var hide = function() {
    var delayed = function() {
      el.animate(
        config.css.hide,
        config.ms_animated,
        function() {
          callback('after')
        }
      );
    };
    setTimeout(delayed, config.ms_displayed)
  };

  var callback = function(which) {
    if(!config.callbacks) {
      return;
    }
    if(!config.callbacks.hasOwnProperty(which)) {
      return;
    }
    config.callbacks[which]();
  };

  var init = function(overrides) {
    configure(overrides);
    ready();
    show();
  };

  return {
    init: init
  };
}());
