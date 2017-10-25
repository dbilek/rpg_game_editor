$(document).ready(function(){

  $(".edit_attribute").click(function(){
    $('.edit_' + this.getAttribute("data-id") ).css("display","none")
    $('.edit_form_' + this.getAttribute("data-id") ).show();
    // $('.edit_form_' + this.getAttribute("data-id")).find("img").css({"cursor": "pointer", "border-bottom": "2px solid #eea236" });
  });

  $(".close_edit_attribute").click(function(){ 
    $('.edit_form_' + this.getAttribute("data-id") ).css("display","none")
    $('.edit_' + this.getAttribute("data-id") ).show();
  });

  // $(".intensity_change").change(function () {                    
  //  var newValue = $('.intensity_' + this.getAttribute("data-id")).val();
  //  $('.intensity_value_' + this.getAttribute("data-id")).val(newValue);
  // });

});