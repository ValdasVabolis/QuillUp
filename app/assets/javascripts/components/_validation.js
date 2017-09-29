var Validation = (function($, m) {
  function Validator(config) {
    var o = config;
    var el = $(o.selector);

    var subscribe = function() {
      console.log('asdfffff');
      el.on('keyup paste', 'input[type=text], textarea', on_change);
    };

    var validate_config = function() {

    };

    var on_change = function(e) {
      var changed = $(this);
      var data = $.extend(true, el.serializeObject(), {
        model: o.model
      });
      console.log('asdf');
      $.ajax({
        method: 'POST',
        url: o.endpoint,
        data: data
      }).done(function(response) {
        $('#validation').html(JSON.stringify(response, null, 2))
        var async_error = el.find('.async-error');
        var errors = response.errors;
        var model_lower = o.model.toLowerCase();
        for(k in errors) {
          var input_name = model_lower + '[' + k + ']';
          var input = $('input[name="' + input_name + '"]');
          var error_el = $('<div class="async-error">' + errors[k] + '</div>');
          if(input.parent().find('.async-error').length === 0) {
            input.parent().prepend(error_el);
          } else {
            input.parent().find('.async-error').replaceWith(error_el);
          }
        }
      })
    };

    var init = function() {
      validate_config();
      subscribe();
    };

    init();
  }

  return {
    init: function(config) {
      return new Validator(config);
    }
  };
}(jQuery));




// $(document).on('turbolinks:load', function() {
//   Validation.init({
//     selector: '#form-question',
//     model: 'Question',
//     endpoint: '/validate',
//     validate: [
//       'title',
//       'body'
//     ]
//   });
// });


