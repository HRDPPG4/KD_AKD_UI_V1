
//savelist
$(document).ready(function(){
	$('.btn-add').click(function(){
	$('.createlist-tooltip').show();
	});
	$('.btn-create').click(function(){
		$('.createlist-tooltip').hide();
	});
	$('.btn-content-list').click(function(){
		$('.createlist-tooltip').hide();
	});
});

// /////////
$(document).ready(function(){
	var menu ='close';
	$('#myTopnav').click(function(){
	  if (menu=="close") {
	  	$('.menu-basic').addClass("responsive");
	  	
	  	menu="open";
	  }else{
	  	$('.menu-basic').removeClass("responsive");
	  	menu="close";
	  }
	});
});

// ///////////////////////////////////
jQuery(document).ready(function($) {
	var my_nav = $('.navbar-sticky'); 
	var my_header=$('.navbar-bg');
	var my_search_side=$('.search');
//	var my_left_bar =$('.left-side-nav');

	
	// grab the initial top offset of the navigation 
	var sticky_navigation_offset_top = my_nav.offset().top;
	
	// our function that decides weather the navigation bar should have "fixed" css position or not.
	var sticky_navigation = function(){
		var scroll_top = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll_top > sticky_navigation_offset_top) { 
			my_nav.addClass( 'stick' );
			my_header.hide();
			$('.logo-main-menu').show();
			$('#side-toolbar').css({'margin-top':'-40px'});
			my_search_side.show();
			
			// $('.navbar-collapse .navbar-nav').css({"right":"37px"});
			// $('li.search, span.glyphicon-search').css({"visibility":"visible"});
			

		} else {
			my_nav.removeClass( 'stick' );
			my_header.show();
			$('.logo-main-menu').hide();
			$('#side-toolbar').css({'margin-top':'20px'});
			my_search_side.hide();
			
			// $('.navbar-collapse .navbar-nav').css({"margin":"0 auto","right":"0px"});
			// $('li.search, span.glyphicon-search').css({"visibility":"hidden"});
		   
		}   
	};

	var initio_parallax_animation = function() { 
		$('.parallax').each( function(i, obj) {
			var speed = $(this).attr('parallax-speed');
			if( speed ) {
				var background_pos = '-' + (window.pageYOffset / speed) + "px";
				$(this).css( 'background-position', 'center ' + background_pos );
			}
		});
	}
	
	// run our function on load
	sticky_navigation();
	
	// and run it again every time you scroll
	$(window).scroll(function() {
		 sticky_navigation();
		 initio_parallax_animation();
	});

});

// Botton Share
$(document).ready(function(){
	$('.share').click(function(d, s, id) {
	});	 
});





