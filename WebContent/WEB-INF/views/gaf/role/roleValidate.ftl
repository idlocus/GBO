<script type="text/javascript">$(function() {
    $("#roleInputForm").validate({
      submitHandler: function(form) {
            commitRole();
        },
        rules: {
           roleCode: {
                   required : true
               },
           roleName: {
                   required : true
               }
        }
    });
})
</script>