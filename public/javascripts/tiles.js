$(document).ready(function(){



  $(".tile").hover(
      function () {
        $(this).find(".action").fadeIn(33);
        $(this).addClass("hover");
        $(this).find(".microtile").addClass("hover");
        $(this).find(".text").animate({opacity:'1'},{queue:false,duration:77});
      }, 
      function () {
       $(this).find(".action").fadeOut(33);
        $(this).removeClass("hover");
        $(this).find(".text").animate({opacity:'.25'},{queue:false,duration:77});
      }
    );

  $(".micro").hover(
      function () {
        $(this).addClass("hover");
      }, 
      function () {
        $(this).removeClass("hover");
      }
    );

    // $("#head").hoverIntent(
    //     function () {
    //       $(this).addClass("hover");
    //     }, 
    //     function () {
    //       $(this).removeClass("hover");
    //     }
    //   );


    $(".tile .children").hoverIntent(
        function () {
          $(this).animate({height:'177px', opacity:'.95'},{queue:false,duration:77});
        }, 
        function () {
          $(this).animate({height:'30px', opacity:'.5'},{queue:false,duration:77});
        }
      );
        
    $("#head, #head-id").click(
      function () {
        history.go(-1);
      }
      );

    $("ul.swatches li > *").live("click", function () {
         var color = $(this).css("background-color");
         $("#dialog .meta").css("background", color);
         
      });
        

    $(".add_image_action").live("click", function(){
         $(".add_image_form").fadeIn();
         $(this).hide();
       });

     $(".add_audio_action").live("click", function(){
          $(".add_audio_form").fadeIn();
          $(this).hide();
        });

        $(".add_text_action").live("click", function(){
             $(".add_text_form").fadeIn();
             $(this).hide();
           });

              
    //      
    // 
    // $(".tile .edit").click(
    //   function () {
    //    window.location.href = $(this).find(".edit").attr("href");
    //  }
    // );    
    //   
    
    $('.text').click(function(e) {
      e.stopPropagation();
    }); 
    $('.audio').click(function(e) {
      e.stopPropagation();
    });
        
    $('.tile').click(function(e) {
      e.stopPropagation();
      
      window.location.href = $(e.target).find(".linker").attr("href");
    });
    
    
    //MODAL BITCHES
    $('#dialog').jqm({ajax:'@href', modal:true});
});