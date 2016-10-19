 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search</title>
<%@include file="include/link/link.jsp"%>
	
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
    min-height: 338.79px​ !important;
}

</style>

</head>
<body ng-cloak ng-app="UserApp" ng-controller="UserCtrl" data-ng-init="getDocumentByLikeTitle('${title}')">
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
			<section id="search">
				<!-- section-title -->
				<div class="row section topspace-second">
					<div class="row" style="padding:12px;">
						<div class="col-md-12">
							 <div  ng-repeat="slide in documentSearch" class="col-md-3" style="margin-bottom:10px; ">
								<%@include file="include/slide-layout.jsp"%>  									
							</div>
							<div ng-if="recordNotFound" class="noRecord">
								<img src="${pageContext.request.contextPath}/resources/user/img/search-no-record.png">
							</div>	
						</div>					
					</div> 
				</div>
			</section>
		</div>
	</content>
		
	<footer>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>
	
	<%@include file="include/script/script.jsp"%>
</body>
</html>