/**
 * 
 */
function App()
{
}
App.getAppContextPath = function()
{
	urlHelper = new UrlHelper(window.location.href);
	return urlHelper.getContextPath();
},
App.getAppContextPathEnriched = function()
{
	return "/" + App.getAppContextPath();
};


