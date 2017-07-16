/* global $*/

// AJAX for new comment
$(function() {
  $(document).on('submit', '#comment-form', function(e) {
    e.preventDefault();
    var form = $(this);
    var data = form.serializeArray();
    var url = form.attr('action');
    return $.ajax({
      type: 'POST',
      url: url,
      data: data,
      dataType: 'json',
      success: function(data) {
        console.log('yes');
        form.replaceWith(data.form);
        $('#post-comments').replaceWith(data.comments);
        return false;
      },
      error: function(data) {
        console.log('no');
        return false;
      }
    });
  });

  // AJAX for comment voting
  $.each(['up', 'down'], function(i, o) {
    $(document).on('click', 'button.comment-vote-' + o, function() {
      var el = $(this).closest('.comment-votes');
      var post_id = $(this).closest('.post').data('id');
      var comment_id = el.data('id');
      console.log(post_id);
      var url = '/users/posts/' + post_id + '/comments/' + comment_id + '/vote/' + o;
      return $.ajax({
        type: 'POST',
        url: url,
        dataType: 'json',
        success: function(data) {
          console.log('yes');
          el.replaceWith(data.partial);
          return false;
        },
        error: function(data) {
          console.log('no');
          return false;
        }
      });
    });
  });
});