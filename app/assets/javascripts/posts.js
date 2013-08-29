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

$( document ).ready(function() {

  //////////////////// NEWSLETTER SHAKE

  var reached_bottom = false;

  $(window).scroll(function() {
    if ($(window).scrollTop() + $(window).height() >=
      $('.post-content').offset().top + $('.post-content').height() + 100 && reached_bottom == false ) {
      $( ".newsletter" ).effect( "shake", {distance: 5}, 700 );

    reached_bottom = true;
    }
  });

  /////////////////// NEWSLETTER POPDOWN

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

  //////////////// SOCIAL BAR STUFF

  var popped = false;
  var social_value = 0;

  var barPosition = function(){
    var $bar = jQuery(".social-bar");
    offset = jQuery('.main-content').offset(); // 173
    $bar.css({"left":(offset.left - $bar.outerWidth() - 11),"display":"block"});
  };

  var hiddenBar = function(){
    $('.social-arrow').css("display","block");
    if (popped == false) {
      $(".social-bar").css("display","none");
    }
    else {
      $(".social-bar").css({"left":"-4px","display":"block"});
    }
  };

  if ($(window).width() > 1100) {
    $('.social-arrow').css("display","none");
    barPosition();
  }
  else {
    hiddenBar();
  }

  $(window).resize(function(){
    if ($(window).width() > 1100) {
      $('.social-arrow').css("display","none");
      barPosition();
    }
    else {
      hiddenBar();
    }
  });

  $('.social-arrow').click(function() {
    social_value += 180;
    if (popped == false) {
      popped = true;
      $(".social-bar").css({"left":"-4px","display":"block"});
      $('.social-arrow-img').rotate({animateTo:social_value});
    }
    else {
      popped = false;
      $(".social-bar").css({"left":"-4px","display":"none"});
      $('.social-arrow-img').rotate({animateTo:social_value});
    }
  });

  //////////////////// FANCYBOX

  $("a.fancybox").fancybox();

  //////////////////// ASYNC SOCIAL BUTTONS

  (function(doc, script) {
    var js,
        fjs = doc.getElementsByTagName(script)[0],
        frag = doc.createDocumentFragment(),
        add = function(url, id) {
            if (doc.getElementById(id)) {return;}
            js = doc.createElement(script);
            js.src = url;
            id && (js.id = id);
            frag.appendChild( js );
        };

      // Google Analytics
      // add(('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js', 'ga');
      // Google+ button
      add('http://apis.google.com/js/plusone.js');
      // Facebook SDK
      // add('//connect.facebook.net/en_US/all.js#xfbml=1&appId=200103733347528', 'facebook-jssdk');
      // Twitter SDK
      add('//platform.twitter.com/widgets.js');
      add('//assets.pinterest.com/js/pinit.js');

      fjs.parentNode.insertBefore(frag, fjs);
  }(document, 'script'));
});
