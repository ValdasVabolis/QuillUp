var Hamburger = (function($, m) {
  var initialized = false;
  var opened = false;

  var subscribe = function() {
    $(document).on('click', '.fa-bars', function(e) {
      console.log('fa-bars click');
      e.stopPropagation();
      $('nav ul').addClass('shown');
    });

    $(document).on('click', function(e) {
      console.log('fa-bars close');
      $('nav ul').removeClass('shown');
    });
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
