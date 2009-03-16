$(document).ready(function(){

  $(".tile").hover(
      function () {
        $(this).find(".action").show();
      }, 
      function () {
       $(this).find(".action").hide();
      }
    );
  
  

});