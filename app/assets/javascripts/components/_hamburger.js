var Hamburger = (function($, m) {
  var initialized = false;
  var opened = false;

  var subscribe = function() {
    $(document).on('click', '.c-hamburger', click);
    //$(document).on('click', '.c-hamburger', toggle)
  };

  var click = function(e) {
    e.stopPropagation();
    if(opened) {
      $('.c-hamburger').removeClass('is-active');
      close(e);
    } else {
      $('.c-hamburger').addClass('is-active');
      open(e);
    }
    /* opened ? close(e) : open(e); */
    opened = !opened;
  };

  var open = function(e) {
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
