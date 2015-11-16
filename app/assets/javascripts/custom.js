$(function(){
  $(document).on("click", ".remove_fields", function(){
    $(this).parent().parent().children(".removable")[0].value = 1;
    $(this).parent().parent().hide();
    return false;
  });

  $(document).on("click", ".add_child", function() {
    var association = $(this).attr("data-association");
    var regexp = new RegExp("new_" + association, "g");
    var new_id = new Date().getTime();
    $($(this).attr("target")).append(window[association+"_form"]
      .replace(regexp, new_id));
    return false;
  });

  $(document).on("click", ".checkbox", function(){
    checkbox = this;
    if (checkbox.checked){
      $("input.checkbox").each(function(){
        if (checkbox != this) {
          $(this).prop("checked", false);
        }
      });
    }
  });

  $(document).on("click", ".submit-word", function(){
    var validate_field = false;
    var validate_checkbox = false;
    $(".content-answer").each(function(){
      if(this.value != ""){
        validate_field = true;
      }
    });
    $(".checkbox").each(function(){
      if(this.checked){
        validate_checkbox = true;
        if($(this).parent().parent().find(".content-answer")[0].value == ""){
          validate_checkbox = false;
        }
      }
    });

    if(!validate_field || !validate_checkbox ){
      alert($(".alert_error").text());
      return false;
    }
  });
});
