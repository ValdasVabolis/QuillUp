/* global $*/

// AJAX for post voting
$(function() {
    $.each(['up', 'down'], function(i, o) {
        $(document).on('click', "button.post-vote-" + o, function() {
            var el = $(this).closest(".post-votes");
            var id = el.data("id");
            var url = "/users/posts/" + id + "/vote/" + o;
            return $.ajax({
                type: "POST",
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
