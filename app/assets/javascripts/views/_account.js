$(document).on('turbolinks:load', function() {
  if($('#account-content').length > 0) {
    FileUploader.init({
      form_selector: '.edit_user',
      valid_extensions: ['jpg', 'jpeg', 'gif', 'png', 'bmp', 'webp'],
      max_file_size: 20,
      after_input_change: function(input, file) {
        var reader = new FileReader();
        reader.onload = function(ev) {
          input.closest('.img-placeholder')
            .find('img')
            .attr('src', ev.target.result);
        };
        reader.readAsDataURL(file);
      }
    });

    Text.limit({
      text_selector: '#about-me',
      count_selector: '#about-me-counter',
      limit: 200
    });
  }
});
