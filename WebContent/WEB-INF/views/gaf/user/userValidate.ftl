<script type="text/javascript">$(function() {
    $("#userInputForm").validate({
      submitHandler: function(form) {
            commitUser();
        },
        rules: {
           birthday: {
                   dateISO : true
               },
           country: {
                   maxlength : 2
               },
           departmentId: {
                   required : true
               },
           email: {
                   email : true
               },
           employeeCode: {
                   required : true
               },
           locationId: {
                   required : true
               },
           lockedTime: {
                   dateISO : true
               },
           loginId: {
                   required : true,
                   maxlength : 20
               },
           passwordDuration: {
                   maxlength : 3,
                   number : true
               },
           passwordErrorTimes: {
                   number : true,
                   maxlength : 3
               },
           passwordLastUpdateTime: {
                   dateISO : true
               },
           userCode: {
                   required : true
               },
           userName: {
                   required : true
               },
           userStatus: {
                   required : true
               },
        }
    });
})
</script>