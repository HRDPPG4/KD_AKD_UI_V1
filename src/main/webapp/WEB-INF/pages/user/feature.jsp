<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Feature</title>
<%@include file="include/link/link.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/feature.css">
<style>
.footer{
	background-color: #374458;
	width: 100% !important;
	height:50% !important;
	color:  white;
	margin-top: 30px;
	text-align:left;
	word-wrap:break-word !important;
}
a.thumbnail {
    text-decoration: none;
    border: 1px solid #fff;
    border-top-color: rgb(229, 230, 233);
    border-right-color: rgb(223, 224, 228);
    border-bottom-color: rgb(208, 209, 213);
    border-left-color: rgb(223, 224, 228);
    min-height: 338.79px;
}

/*  SEARCH BLOCK	*/

.typeahead-demo .custom-popup-wrapper {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    background-color: #f9f9f9;
  }

#PAGINATION{
	text-align:center;
}
  .typeahead-demo .custom-popup-wrapper > .message {
    padding: 10px 20px;
    border-bottom: 1px solid #ddd;
    color: #868686;
  }

  .typeahead-demo .custom-popup-wrapper > .dropdown-menu {
    position: static;
    float: none;
    display: block;
    min-width: 160px;
    background-color: transparent;
    border: none;
    border-radius: 0;
    box-shadow: none;
  }

</style>

</head>
<body ng-cloak ng-app="UserApp" ng-controller="UserCtrl" data-ng-init="checkLocation()" data-ng-init="getAllDocument()">	
	<jsp:include page="include/register.jsp"></jsp:include>
	<jsp:include page="include/login.jsp"></jsp:include>
	<jsp:include page="include/upload.jsp"></jsp:include>				  
	<%@include file="include/image-loader.jsp"%>	
	<header id="header">
		<jsp:include page="include/header.jsp"></jsp:include>
	</header>
	<jsp:include page="include/social-share.jsp"></jsp:include>
	<jsp:include page="include/toolbar-right.jsp"></jsp:include>
	<jsp:include page="include/feedback.jsp"></jsp:include>
	<content>
		<div class="container">		
			<section id="feature">		
				<!-- section-title -->
				<div class="row section feature topspace-second">
					<div id="content-feature">					
						<ul class="feature-header"​>
							<!-- <li class="view-feature" ng-if="UserID!='' ||UserID!=0"><a ng-click="getDocumentByRecommended()" href="/feature/recommend">ឯកសារណែនាំ</a></li>
							<li  class="view-feature"><a ng-click="getDocumentByPopular()" href="/feature/popular">ឯកសារពេញនិយម</a></li>
							<li class="view-feature"><a ng-click="getDocumentByNewPost()" href="/feature/new">ឯកសារថ្មីៗ</a></li>
							 -->
							
							<li class="view-feature" ng-if="UserID!='' ||UserID!=0"><a href="/feature/recommend" id="recommend">ឯកសារណែនាំ</a></li>
							<li  class="view-feature"><a  href="/feature/popular" id="popular">ឯកសារពេញនិយម</a></li>
							<li class="view-feature"><a  href="/feature/new" id="new">ឯកសារថ្មីៗ</a></li>
						</ul>
					 </div>
					<div class="row" style="padding:12px;">
						<div class="col-md-12" ng-if="showRecomment">
							<div  ng-repeat="slide in recommend | limitTo : 20" class="col-md-3" style="margin-bottom:10px;">
								<%@include file="include/slide-layout.jsp"%>
							</div>
							<div id="PAGINATION"></div>
						</div>	 						
						<div class="col-md-12" ng-if="showPopular">
							<div  ng-repeat="slide in popular | limitTo : 20" class="col-md-3" style="margin-bottom:10px;">
								 <%@include file="include/slide-layout.jsp"%>  
							</div>
							<div id="PAGINATION"></div>
						</div>						
						<div class="col-md-12" ng-if="showNewPost">
							<div  ng-repeat="slide in newDocument | limitTo : 20" class="col-md-3" style="margin-bottom:10px;">
								 <%@include file="include/slide-layout.jsp"%>  
							</div>
							<!-- <div id="PAGINATION"></div> -->
						</div>
						<div id="PAGINATION"></div>
					</div> 
				</div>
			</section>
		</div>
	</content>


	<footer>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>
	<%@include file="include/script/script.jsp"%>
	
	<script>
		var path = window.location.pathname;
		path=path.substring(path.lastIndexOf('/') + 1	,path.length);
		if(path == 'recommend'){
			$("li.view-feature a#recommend").css("border-bottom", "2px solid #26a63c");
		}else if(path == 'popular'){
			$("li.view-feature a#popular").css("border-bottom", "2px solid #26a63c");
		}else if(path == 'new'){
			$("li.view-feature a#new").css("border-bottom", "2px solid #26a63c");
		}else{
			
		}		
	</script>	
</body>
</html>