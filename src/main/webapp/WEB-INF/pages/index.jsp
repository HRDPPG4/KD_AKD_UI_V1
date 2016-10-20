 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
	 
<!DOCTYPE html>
<html>
<head>
<title>ទំព័រដើម</title>
<%@include file="user/include/link/link.jsp"%>
</head>
<body ng-app="UserApp" ng-controller="UserCtrl" data-ng-init="getDocumentByPopular()">		
	<jsp:include page="user/include/register.jsp"></jsp:include>
	<jsp:include page="user/include/login.jsp"></jsp:include>
	<jsp:include page="user/include/upload.jsp"></jsp:include>
	<jsp:include page="user/include/save-list.jsp"></jsp:include>
	<%@include file="user/include/image-loader.jsp"%>	
	
				  
	<header id="header">
		<jsp:include page="user/include/header.jsp"></jsp:include>		
	</header>	
	<jsp:include page="user/include/social-share.jsp"></jsp:include>
	<jsp:include page="user/include/feedback.jsp"></jsp:include>
	<content>	
		<div class="container">		
			<section id="recommend" ng-if="recordFound">
			<!-- section-title -->
				<div class="row section recommend topspace-second" data-ng-init="getDocumentByRecommended()" ng-cloak >
					<div class="popular-title">
						<h2 class="section-title">
							<span id="left">ឯកសារណែនាំ</span>
							<span id="right">
								<a href="/feature/recommend">បង្ហាញទាំងអស់</a>
							</span>
						</h2>
					 </div>
				 	<jsp:include page="user/include/toolbar-right.jsp"></jsp:include>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" ng-repeat="slide in recommend | limitTo : 8">
					    <%@include file="user/include/slide-layout.jsp"%>						   
					</div>					
				</div>			
			</section>
		</div>
		
		<div class="container">
			<section id="popular">			
				<!-- section-title -->
				<div class="row section popular topspace-second" data-ng-init="getDocumentByRecommended()" ng-cloak> 
					<div class="popular-title">
						<h2 class="section-title">
							<span id="left">ឯកសារពេញនិយម</span>
							<span id="right" >
								<a href="/feature/popular" >បង្ហាញទាំងអស់</a>
							</span>
						</h2>
					 </div>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3"  ng-repeat="slide in popular | limitTo : 8">
						<%@include file="user/include/slide-layout.jsp"%>
			 		</div>
				</div>
			</section>
		</div>	
		<div class="container">
			<section id="ឯកសារថ្មីៗ">
				<!-- section-title -->
				<div class="row section popular topspace-second" data-ng-init="getDocumentByNewPost()" ng-cloak>
					<div class="popular-title">
						<h2 class="section-title">
							<span id="left">ឯកសារថ្មីៗ</span>
							<span id="right">
								<a href="/feature/new">បង្ហាញទាំងអស់</a>
							</span>
						</h2>
					 </div>								
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" ng-repeat="slide in newDocument | limitTo :8">
						<%@include file="user/include/slide-layout.jsp"%>
					</div>
				</div>
			</section>
		</div>
	</content>	
	
	<footer>
		<jsp:include page="user/include/footer.jsp"></jsp:include>
	</footer>
	
	<%@include file="user/include/script/script.jsp"%>
</body>
</html>