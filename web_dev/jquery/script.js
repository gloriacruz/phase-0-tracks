$(document).ready(function() {

  $("#p1").click(function(event) {
    $(this).hide("slow");
  });

  $("a").click(function(event){
    event.preventDefault();
    $("a").addClass("test");
  });

  $("button").click(function() {
    alert("Thanks for clicking me!");
  });


});