/**
 * 
 */
function UrlHelper(url)
{
	this.url = url;
}
UrlHelper.prototype.parseUrl = function()
{
	var url = this.url;
	var indexOf = url.indexOf("?");
	var tempParameters = url.substr(indexOf + 1, url.length - 1);
	var tempParaArray = tempParameters.split("&");
	var paraMap = new Object();
	for (index in tempParaArray)
		{
			var tempParaPair = tempParaArray[index].split("=");
			var key=tempParaPair[0];
			var value=tempParaPair[1];
			paraMap[key] = value;
			//paraArray.push(paraObj);
			
			//eval("paraMap." + key + " = " + value);
		}
	return paraMap;
}

UrlHelper.prototype.getContextPath = function()
{
	var url = this.url;
	var tempUrlArray = url.split("/");
	var contextPath = tempUrlArray[3];
	return contextPath;
}

UrlHelper.prototype.getMenuId = function()
{
	var paraMap = this.parseUrl();
	return paraMap.menuId;
}