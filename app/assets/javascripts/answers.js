$(document).on('turbolinks:load', function() {
  function popoverShowing() {
    return Popover.showing();
  }
  
  $('.home').on('popoverShown', function(){
    if(popoverShowing()) {
      // WORKS
      Text.limit({
        text_selector: '#answer-area',
        count_selector: '#answer-area-counter',
        limit: 2500
      });
      // NOT WORKS
      Text.limit({
        text_selector: '#question-area',
        count_selector: '#question-area-counter',
        limit: 5000
      });
    } 
  });
});