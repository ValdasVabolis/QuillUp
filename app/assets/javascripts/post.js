var Post = (function($, m) {
  var show = function(view) {
    var $view = $(view);
    $('#post-popover-view-contents').html($view);

    // setTimeout(function() {
    $('body').addClass('showing-post');
    // }, 500);
  };

  var subscribe = function() {
    $(document).on('click', '#post-popover-exit', function(e) {
      e.preventDefault();
      exit();
    });
  };

  var init = function() {
    subscribe();
  };

  var exit = function() {
    $('body').removeClass('showing-post');
    setTimeout(function() {
      $('#post-popover-view-contents').html('');
    }, 250);
  };

  return {
    init: init,
    show: show,
    exit: exit
  };
}(jQuery, Post || {}));

Post.init();