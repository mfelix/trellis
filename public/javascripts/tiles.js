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
        $(this).find(".action").show();
        $(this).addClass("hover");
        $(this).find(".microtile").addClass("hover");
      }, 
      function () {
       $(this).find(".action").hide();
        $(this).removeClass("hover");
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
        
    $(".tile").click(function () {
      $(".tile").fadeOut("fast");
      window.location.href = $(this).find(".linker").attr("href");
    });

  
    $('.container').click($.delegate({
      '#head, #head-id': function() { history.go(-1); },
      '.container': function() {  },
      '.edit': function() { /* do edit stuff */ }
    }));
    
});