var Popover = (function($) {
  var active_cass = 'showing-popover';
  var exit_selector = '#popover-exit';
  var view_selector = '#popover-view';
  var view_contents_selector = '#popover-view-contents';
  var parent_selector = '#popover-parent';

  var init = function() {
    clear();
    subscribe();
  };

  var subscribe = function() {
    $(document).on('click', exit_selector, function(e) {
      e.preventDefault();
      exit();
    });
    // prevent clicking inside popover from closing it
    $(document).on('mousedown', view_selector, function(e) {
      e.stopPropagation();
    });

    // clicking outside the popover should close it
    $(document).on('mousedown', function() {
      if ($(view_contents_selector).html() === '') {
        return;
      }
      Popover.exit();
    });

    // escape key closes popover
    $(document).on('keyup', function(e) {
      if (e.key !== 'Escape') {
        return;
      }
      Popover.exit()
    });
  };

  var show = function(view) {
    $(view_contents_selector).html(view);
    $(parent_selector).addClass(active_cass);
    autosize($('#answer-reply textarea'));
  };

  var clear = function() {
    $(view_contents_selector).html('');
  };

  var exit = function() {
    $(parent_selector).removeClass(active_cass);
  };

  return {
    init: init,
    show: show,
    exit: exit
  }
}(jQuery));

Popover.init();