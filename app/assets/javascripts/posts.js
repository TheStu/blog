// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".field-block").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

ready = function() {
  var value = 0;
  $(".newsletter-click").click(function() {
    var target = $(this).parent().children(".newsletter-expand");
    $(target).slideToggle();
    value += 180;
    $(this).children(".newsletter-arrow").rotate({animateTo:value});
  });
  var down = false;
  $(".citation-link").click(function() {
    var target = $(this).parent().children(".citation-dropdown");
    $(target).slideToggle();
    if (down == false) {
      $(this).children(".citation-chevron").replaceWith('<i class="icon-chevron-up citation-chevron"></i>');
      down = true;
    }
    else {
      $(this).children(".citation-chevron").replaceWith('<i class="icon-chevron-down citation-chevron"></i>');
      down = false;
    }
  });
  $("a.fancybox").fancybox();
};

$(document).on('page:load', ready);
$(document).ready(ready);
