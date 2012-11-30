$(function() {
  $(".tabbable a").one("click", function() {
    $(".tabbable .active a").parent().removeClass("active");
    $(this).parent().addClass("active");
    $.get(this.href, null, null, "script");
    return false;
  });

  $(".tabbable a").first().click().parent().addClass("active");;
});
