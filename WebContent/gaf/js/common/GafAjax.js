/**
 * 
 */

function GafAjax()
{
}

GafAjax.call =function(type, url, data, successCallback , dataType, errorCallback, timeout )
{
	if (timeout == null)
		timeout = 60000;
	$.ajax({
		type: type,
		url: url,
	    data: data,
		success: function(data, textStatus, jqXHR ) {
			if (data.status == 'NO_PRIVILEGES')
			{
				
				alert(data.message);
			}
			else if(data.status == 'SESSION_TIME_OUT')
			{
				alert(data.message);
			}
			else
			{
				successCallback(data);
			}
			
			 },
		dataType: dataType,
		timeout:timeout,
		/* textStatus value: "timeout", "error", "abort", "parsererror"
		 * errorThrown: When an HTTP error occurs, errorThrown receives the textual portion of the HTTP status, 
		 * such as "Not Found" or "Internal Server Error." */
		error: function(jqXHR, textStatus, errorThrown)
		 {
			errorCallback(textStatus,errorThrown);  
		 }
	});
},
GafAjax.get = function(url, data, successCallback , dataType, errorCallback, timeout)
{
	GafAjax.call('GET',url, data, successCallback , dataType, errorCallback,timeout);
},
GafAjax.post = function(url, data, successCallback , dataType, errorCallback,timeout)
{
	GafAjax.call('POST',url, data, successCallback , dataType, errorCallback,timeout);
}
