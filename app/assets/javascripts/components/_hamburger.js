var Hamburger = (function($, m) {
  var initialized = false;
  var opened = false;
  var close_after = 3000;

  var subscribe = function() {
    $(document).on('click', '.fa-bars', open);
    $(document).on('click', close);
    $(document).on('mouseleave', 'nav ul', mouseleave);
  };

  var mouseleave = function(e) {
    setTimeout(close, close_after)
  };

  var open = function(e) {
    e.stopPropagation();
    $('nav ul').addClass('shown');
  };

  var close = function(e) {
    $('nav ul').removeClass('shown');
  };

  var init = function() {
    if(initialized) {
      return;
    }
    subscribe();
    initialized = true;
  };

  // public api
  return {
    init: init
  };
}(jQuery, Hamburger || {}));
