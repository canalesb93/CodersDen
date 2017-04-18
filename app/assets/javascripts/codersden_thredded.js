//= require locales/jquery.timeago.es
//= require thredded

$( ".thredded--post--reply" ).click(function( event ) {
  event.preventDefault();

  // Name Query
  var nameElement = $(this).prevAll("header").children(".thredded--post--user").children("a")[0];

  var reply = "@" + nameElement.text + " " + $("#post_content").val();

  $("#post_content").focus().val(reply);
  $("#post_content").change()

});