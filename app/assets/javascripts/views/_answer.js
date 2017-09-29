$(document).on('turbolinks:load', function() {
  function popoverShowing() {
    return Popover.showing;
  }
  
  $('.home').on('popovershown', function(){
    if(popoverShowing()) {      
      Text.limit({
        text_selector: '#area-answer-new',
        count_selector: '#area-answer-counter-new',
        limit: 2500
      });
    } 
  });
});

// // remember to e.preventDefault()
// var question_id = $(this).data('id'); //fix this
// $('.thingy').html(HandlebarsTemplates['edit_answer']({
//   question_id: question_id,
//   csrf_key: $('meta[name="csrf-param"]').attr('content'),
//   csrf_value: $('meta[name="csrf-token"]').attr('content')
// }));