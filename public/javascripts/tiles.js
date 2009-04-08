$(document).ready(function(){

  jQuery.delegate = function(rules) {
    return function(e) {
      var target = $(e.target);
      for (var selector in rules)
        if (target.is(selector)) return rules[selector].apply(this, $.makeArray(arguments));
    }
  }


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

    $("#head").hover(
        function () {
          $(this).addClass("hover");
        }, 
        function () {
          $(this).removeClass("hover");
        }
      );


    $(".tile .children").hoverIntent(
        function () {
          $(this).animate({height:'280px', opacity:'.95'},{queue:false,duration:77});
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
        


    
    //      
    // 
    // $(".tile .edit").click(
    //   function () {
    //    window.location.href = $(this).find(".edit").attr("href");
    //  }
    // );    
    //   
    $(".microtile").click(
      function () {
        window.location.href = $(this).find(".linker").attr("href");
      }
      );
    
            
    $('.container').click($.delegate({
          '.tile': function() { window.location.href = $.find(".linker").attr("href"); }
        }));
    
    
    
    //MODAL BITCHES
    $('#dialog').jqm({ajax:'items/new/'});

});