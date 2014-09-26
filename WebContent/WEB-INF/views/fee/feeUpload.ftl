<#import "/gaf/common.ftl" as common/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
  <script>
  function uploadJqueryForm(){
      $('#result').html('');
   
     $("#form2").ajaxForm({
      success:function(data) { 
      	$('#result').html(data.message);
       },
       dataType:"json"
     }).submit();
  }
	
  </script>
</head>

<body>
<h3>Upload Fee</h3> 
 
<form id="form2" method="post" action="${contextPath}/app/fee/uploadfile" enctype="multipart/form-data">
  <!-- File input -->    
  <input name="file2" id="file2" type="file" /><br/>
</form>
 
<button value="Submit" onclick="uploadJqueryForm()" >Upload</button><br/>
 
<div id="result"></div>
</body>
</html>
