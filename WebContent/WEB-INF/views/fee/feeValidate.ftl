<script type="text/javascript">$(function() {
    jQuery.validator.setDefaults({
          success: "valid"
     });
    $("#feeInputForm").validate({
      submitHandler: function(form) {
            commitFee();
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