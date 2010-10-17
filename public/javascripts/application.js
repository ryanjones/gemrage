$(document).ready(function(){
  $(".flash").fadeTo(5000, 0.01, function(){ //fade
    $(this).slideUp("slow", function() { //slide up
      $(this).remove(); //then remove from the DOM
    });
  });
});

