
 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Search</title>
<%@include file="../user/include/link/link.jsp"%>
	
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
<body ng-cloak ng-app="UserApp" ng-controller="UserCtrl">
	<jsp:include page="../user/include/register.jsp"></jsp:include>
	<jsp:include page="../user/include/login.jsp"></jsp:include>
	<jsp:include page="../user/include/upload.jsp"></jsp:include>				  
	
	<header id="header">
		<jsp:include page="../user/include/header.jsp"></jsp:include>	
	</header>
	<jsp:include page="../user/include/toolbar-right.jsp"></jsp:include>
	<content>
		<div class="container">
			<section>
				<div class="row section topspace-second">
					<div class="row" style="padding:12px;">
						<div class="col-md-12">					 
							<h1>Access Denied! <br> YOU DON'T HAVE PERMISSION TO ACCESS THIS PAGE.</h1>
							<h1><a href="/login">Login</a></h1>	
						</div>			
					</div> 
				</div>
			</section>
		</div>
	</content>
		
	<footer>
		<jsp:include page="../user/include/footer.jsp"></jsp:include>
	</footer>
	
	<%@include file="../user/include/script/script.jsp"%>
</body>
</html>