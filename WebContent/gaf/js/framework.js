function framework()
{
}
framework.appendSubMenuByRoot = function(menu, menuId) {

	var subMenu = menu[menuId];
	var currentSubMenu = $(".nav-sidebar-main");

	if (currentSubMenu.size() > 0) {
		$(".nav-sidebar-main").replaceWith(subMenu);
	} else {
		if (subMenu != null) {
			$(".nav-shortcut").before(subMenu);
		}
	}
}
framework.enrichRootMenu = function(rootMenuId) {
	var rootMenu = $("[menuid=" + rootMenuId + "]");
	framework.enrichRootMenuByRootMenu(rootMenu);
}

framework.getMenuInfo = function(menuId) {
	var menuInfo = new Object();
	var rootMenuId = null;
	var currentMenu = $("[menuid=" + menuId + "]");

	var isLeaf = currentMenu.attr("isleaf");
	menuInfo.isleaf = isLeaf;
	menuInfo.menuId = menuId;

	var parentMenuId = currentMenu.attr("parentmenuid");

	if (parentMenuId != null) {
		parentMenuId = $("[menuid=" + parentMenuId + "]").attr("parentmenuid");
		if (parentMenuId != null) {
			parentMenuId = $("[menuid=" + parentMenuId + "]").attr(
					"parentmenuid");
			menuInfo.rootMenuId = parentMenuId;
			menuInfo.isRoot = false;
			menuInfo.isLevelTwo = false;
			menuInfo.isLevelThree = true;

		} else {
			menuInfo.rootMenuId = parentMenuId;
			menuInfo.isRoot = false;
			menuInfo.isLevelTwo = true;
			menuInfo.isLevelThree = false;
		}
	} else {
		menuInfo.rootMenuId = menuId;
		menuInfo.isRoot = true;
		menuInfo.isLevelTwo = false;
		menuInfo.isLevelThree = false;
	}
	return menuInfo;
}

framework.enrichMenu = function(rootMenuId) {
	framework.appendSubMenuByRoot(menu, rootMenuId);
	framework.enrichRootMenu(rootMenuId);

	urlHelper = new UrlHelper(window.location.href);
	var menuId = urlHelper.getMenuId();
	var menuInfo = framework.getMenuInfo(menuId);
	if (menuInfo.isRoot == false) {
		framework.enrichOtherMenu($("[menuid=" + menuId + "]"));
	}
}

framework.enrichRootMenuByRootMenu = function(rootmenu) {
	$(".root-menu li").removeClass("active");
	$(rootmenu).parent().addClass("active");
}
framework.rootMenuClick = function() {
	var rootMenuId = $(this).attr("menuid");
	framework.appendSubMenuByRoot(menu, rootMenuId);
	framework.enrichRootMenu(rootMenuId);
	$(".nav-sidebar-main a").click(framework.menuClick);
}
framework.enrichNotLeafMenu = function(currentMenu) {
	var isLeafUlOpenOfItself = $(currentMenu).parent().children("ul").hasClass(
			"leaf-ul-open");
	if (isLeafUlOpenOfItself) {
		// ul close
		$(".nav-sidebar-main ul, .nav-shortcut ul").removeClass("leaf-ul-open");
		// arrow right
		$(currentMenu).children("span").removeClass("icon-arrow-down-4");
		$(currentMenu).children("span").addClass("icon-arrow-right-4");
	} else {
		$(".nav-sidebar-main ul, .nav-shortcut ul").removeClass("leaf-ul-open");
		$(".nav-sidebar-main ul, .nav-shortcut ul").parent().children("a")
				.children("span").removeClass("icon-arrow-down-4");
		$(".nav-sidebar-main ul, .nav-shortcut ul").parent().children("a")
				.children("span").addClass("icon-arrow-right-4");

		var parentOfCurrentMenu = $(currentMenu).parent();
		var ulElement = parentOfCurrentMenu.children("ul");
		if (ulElement.size() >= 1) {
			var ulElement = $(currentMenu).parent().children("ul").addClass(
					"leaf-ul-open");
			$(currentMenu).children("span").removeClass("icon-arrow-right-4");
			$(currentMenu).children("span").addClass("icon-arrow-down-4");
		}

		$(".nav-sidebar-main li, .nav-shortcut li").removeClass("active");
		$(currentMenu).parent().addClass("active");
	}
}

// for non-root menu dynamically onload
framework.enrichOtherMenu = function(currentMenu) {
	var isLeaf = $(currentMenu).parent().parent().hasClass("leaf");
	if (!isLeaf) {
		framework.enrichNotLeafMenu(currentMenu);
	} else {
		framework.enrichNotLeafMenu($(currentMenu).parent().parent().parent().children(
				"a"));
		$(".nav-sidebar-main li").find("li").removeClass("active");
		$(currentMenu).parent().addClass("active");
	}
}
// for non-root menu click
framework.menuClick = function() {
	var isLeaf = $(this).parent().parent().hasClass("leaf");
	if (!isLeaf) {
		framework.enrichNotLeafMenu(this);
	} else {
		$(".nav-sidebar-main li").find("li").removeClass("active");
		$(this).parent().addClass("active");
	}

}