<script type="text/javascript">$(function() {
    jQuery.validator.setDefaults({
          success: "valid"
     });
    $("#templateFeeLinkInputForm").validate({
      submitHandler: function(form) {
            commitTemplateFeeLink();
        },
        rules: {
        },
	errorPlacement: function(error, element) {
          if(element.parent().children().length == 1){
              error.insertAfter(element);
          }else{
              error.insertAfter(element.next());
          }
        }
    });
})
</script>