<script type="text/javascript">$(function() {
    jQuery.validator.setDefaults({
          success: "valid"
     });
    $("#incomingMessageInputForm").validate({
      submitHandler: function(form) {
            commitIncomingMessage();
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