var ready = function() {
  $('.tabs-nav a').click(function(e) {
    e.preventDefault();
    var nav = $(this).closest('li');
    var nav_items = nav.closest('ul').find('li');
    nav_items.removeClass('selected');
    var index = nav_items.index(nav);

    var content_items = $('.tabs-content li');
    content_items.removeClass('selected');
    var content = $(content_items[index]);

    nav.addClass('selected');
    content.addClass('selected');
  });

  $('.tabs-nav ul li').first().find('a').click();
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);