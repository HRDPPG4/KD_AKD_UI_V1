
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



























<%--  <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Access Denied</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/user/img/AKD.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/categories.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/details.css">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/responsive.css">
	<link href="${pageContext.request.contextPath}/resources/user/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/search.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/font-server/font.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/slide-detail.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/user_view.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/comment.css" />
	<!-- Register -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/register.css">
	<!-- style for file upload -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/jquery.filer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/themes/jquery.filer-dragdropbox-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/save-list.css">
	
	 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> --> 
	<script src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/js/bootstrap.min.js"></script>
     <!--  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
	
	
	
	
	<!-- Font -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	 <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	
	<!-- Sweet Alert -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
    
    <!-- Sweet Alert2 -->
     <script type="text/javascript" src="https://cdn.jsdelivr.net/sweetalert2/4.2.4/sweetalert2.js"></script>
     <script type="text/javascript" src="https://cdn.jsdelivr.net/sweetalert2/4.2.4/sweetalert2.min.js"></script>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/4.2.4/sweetalert2.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/4.2.4/sweetalert2.min.css">
     
    <!-- Loading -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/Main_Style_For_All_Page.css" />
	
    

<script>
	PATH_UI = "http://192.168.178.202:2222";
</script>

<!-- START SEARCH BLOCK-->
	 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular-animate.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular-sanitize.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.1.2/ui-bootstrap-tpls.js"></script>

	<!-- END SEARCH BLOCK -->

</head>
<body ng-cloak ng-app="UserApp" ng-controller="UserCtrl">
	<%@include file="../user/include/register.jsp"%>
	<%@include file="../user/include/login.jsp"%>
	<%@include file="../user/include/upload.jsp"%>				 
<header id="header">
	<%@include file="../user/include/header.jsp"%>
</header>
<%@include file="../user/include/toolbar-right.jsp"%>
<content>
<div class="container">
	<section>
		<div class="row section topspace-second">
			<div class="row" style="padding:12px;">
				<div class="col-md-12">					 
					<h1>Access Denied! <br> YOU DON'T HAVE PERMISSION TO ACCESS THIS PAGE.</h1>
					<h1><a href="http://120.136.24.174:13300/login?continue-site=${pageContext.request.contextPath}">Login</a></h1>	
				</div>			
			</div> 
		</div>
	</section>
	

</div>
</content>


<footer>
<%@include file="../user/include/footer.jsp"%>
</footer>
 <a href="#0" class="cd-top">Top</a>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/back-to-top.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/allkhmerslide.js"></script>	                        
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/login.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/angular/UserApp.js"></script>

<!-- library jquery for file upload -->
<script src="${pageContext.request.contextPath}/resources/user/js/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/user/js/jquery.filer.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/user/js/jquery-upload-file.js"></script>
<!-- Online Link -->

</body>
</html> --%>