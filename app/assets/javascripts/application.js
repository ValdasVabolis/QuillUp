//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

var show_hide_alert = function() {
  var el = $('.alert');
  el.addClass('shown');
  setTimeout(function() {
    el.removeClass('shown');
  }, 3000);
};

$(show_hide_alert);

$(function() {
  $(document).on('click', '.fa-bars', function(e) {
    $('nav ul').toggle();
  });

  $(document).on('mouseleave', 'nav ul', function(e) {
    $('nav ul').removeClass('shown');
  });
});