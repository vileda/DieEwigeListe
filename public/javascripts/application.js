// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $(".add_match input[type=text]").focus(function() {
    $(this).val("");
  });
  $("#match_submit").click(function() {
	$("#match_submit").addClass("working");
  });
});

