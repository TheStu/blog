// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  var value = 0;
  $(".newsletter-click").click(function() {
    var target = $(this).parent().children(".newsletter-expand");
    $(target).slideToggle();
    value += 180;
    $(this).children(".newsletter-arrow").rotate({animateTo:value});
  });
  $("a.fancybox").fancybox();
});
