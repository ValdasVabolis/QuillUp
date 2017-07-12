/* global $*/
$(function() {
  $(document).on('submit', '#comment-form', function(e) {
    e.preventDefault();
    var form = $(this);
    var data = form.serializeArray();
    var url = form.attr('action');
    return $.ajax({
      type: "POST",
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
});