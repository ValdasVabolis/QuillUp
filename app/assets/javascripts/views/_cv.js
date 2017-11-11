$(document).on('turbolinks:load', function() {
  if($('.pavadinimas').length > 0) {
    $('nav > ul').remove();
    $('.c-hamburger').remove();
    $('.nav-logo-text').html('Valdas');
    $('.nav-logo-text').append('<span>Vabolis</span>');
    $('body').css('background-color', '#424242');
  }
});
