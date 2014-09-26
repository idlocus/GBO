<script type="text/javascript">$(function() {
    jQuery.validator.setDefaults({
          success: "valid"
     });
    $("#tradeSampleInputForm").validate({
      submitHandler: function(form) {
            commitTradeSample();
        },
        rules: {
           amount: {
                   decimals : 2,
                   number : true,
                   required : true
               },
           client: {
                   required : true
               },
           currency: {
                   required : true
               },
           market: {
                   required : true
               },
           price: {
                   required : true,
                   decimals : 6,
                   number : true
               },
           qty: {
                   number : true,
                   required : true
               },
           remark: {
                   maxlength : 20,
                   email : true
               },
           settlementDate: {
                   dateISO : true,
                   required : true
               },
           side: {
                   required : true
               },
           symbol: {
                   required : true,
                   maxlength : 5
               },
           tradeDate: {
                   dateISO : true,
                   required : true
               }
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