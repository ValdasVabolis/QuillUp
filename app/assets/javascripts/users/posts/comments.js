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
        form.replaceWith(data.form);
        $('#post-comments').replaceWith(data.comments);
        return false;
      },
      error: function(data) {
        return false;
      }
    });
  });
});