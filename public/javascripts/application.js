$(document).ready(function(){
  $(".flash").fadeTo("slow", 10.00, function(){ //fade
    $(this).slideUp("slow", function() { //slide up
      $(this).remove(); //then remove from the DOM
    });
  });
});

