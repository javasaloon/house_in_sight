$(function() {
  //alert("here");
  $(".tabbable a").live("click", function() {
    //this.parent.addClass("active");
    $.get(this.href, null, null, "script");
    return false;
  });
});
