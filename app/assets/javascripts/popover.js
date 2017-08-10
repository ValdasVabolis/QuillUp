var Popover = (function($) {
  var active_cass = 'showing-popover';
  var exit_selector = '#popover-exit';
  var contents_selector = '#popover-view-contents';
  var parent_selector = '#popover-parent';

  var show = function(view) {
    var $view = $(view);
    $(contents_selector).html($view);
    $(parent_selector).addClass(active_cass);
  };

  var init = function() {
    $(document).on('click', exit_selector, function(e) {
      e.preventDefault();
      exit();
    });
  };

  var exit = function() {
    $(parent_selector).removeClass(active_cass);
    setTimeout(function() {
      $(contents_selector).html('');
    }, 250);
  };

  return {
    init: init,
    show: show,
    exit: exit
  }
}(jQuery));

Popover.init();

$(document).on('mousedown', '#popover-view-contents', function(e) {
  e.stopPropagation();
});

$(document).on('mousedown', Popover.exit);