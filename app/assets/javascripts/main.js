$(function(){
	$('.nav.navbar-nav>li>a').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
	});
})