<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/partner.css">	

  <!-- <div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myPartner" aria-expanded="false">
	 	<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span> 
	  </button>
</div> -->

<div class="collapse navbar-collapse" id="myPartner">  
  <ul class="nav navbar-nav navbar-right">	
	<li class="dropdown">
	  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	  	<span class="glyphicon glyphicon-th"></span>
	  </a>
	  <ul class="dropdown-menu dropdown-item partnerUL">
			<li ng-repeat="partner in partners">
				<a href="{{partner.SITE_URL}}">
					<img class="img-rounded" alt="" data-ng-src="{{partner.SITE_LOGO}}"/>
					<span class="site-url">{{partner.SITE_NAME}}</span>
				</a>
			</li>			
	  </ul>	  
	</li>
	<!-- <li>
		<a href="#">
			  <div id="google_translate_element"></div>
			  	<script type="text/javascript">
					function googleTranslateElementInit() {
					  new google.translate.TranslateElement({pageLanguage: 'kh', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
					}
				</script>
				<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
		</a>
	</li> -->
			
  </ul>
</div>