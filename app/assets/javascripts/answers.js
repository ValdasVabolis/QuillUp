$(document).on('turbolinks:load', function() {
  function popoverShowing() {
    return Popover.showing;
  }
  
  $('.home').on('popovershown', function(){
    if(popoverShowing()) {      
      Text.limit({
        text_selector: '#area-answer',
        count_selector: '#area-answer-counter',
        limit: 2500
      });
    } 
  });
});