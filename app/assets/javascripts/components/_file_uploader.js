var FileUploader = (function($) {
  function FileUpload(opts) {
    var o = opts;
    var form = $(o.form_selector);
    var files = form.find('input[type=file]');
    var extension_pattern = /^.*\.([\w\d]+)$/;

    var init = function() {
      subscribe();
    };

    var invalid_extension_message = function(ext) {
      return 'Invalid file format: ' +
        'expected ' + o.valid_extensions.join(', ') + '; ' +
        'was ' + ext + '.';
    };

    var invalid_file_size_message = function(mb) {
      return 'Invalid file size: ' +
        'expected <= ' + o.max_file_size + 'mb; ' +
        'was ' + Math.round(mb) + 'mb.';
    };

    var clear = function(input) {
      input.val();
      return false;
    };

    var get_extension_from_file = function(file) {
      return file.name.match(extension_pattern)[1];
    };

    var bytes_to_megabyes = function(bytes) {
      return bytes / (1024 * 1024);
    };

    var is_file_size_valid = function(megabytes) {
      return megabytes <= o.max_file_size;
    };

    var is_file_extension_valid = function(ext) {
      return o.valid_extensions.includes(ext);
    };

    var on_file_input_change = function(e) {
      var input = $(e.currentTarget);
      var file = input[0].files[0];

      var ext = get_extension_from_file(file);
      if (!is_file_extension_valid(ext)) {
        alert(invalid_extension_message(ext));
        return clear(input);
      }

      var mb = bytes_to_megabyes(file.size);
      if (!is_file_size_valid(mb)) {
        alert(invalid_file_size_message(mb));
        return clear(input);
      }

      if (typeof o.after_input_change === 'function') {
        o.after_input_change(input, file);
      }
    };

    var subscribe = function() {
      files.change(on_file_input_change);
    };

    init();
  }

  return {
    init: function(opts) {
      return new FileUpload(opts);
    }
  }
}(jQuery));