<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<c:set var="ContextPath" value="http://localhost:2222" />
<%@taglib prefix='sec' uri="http://www.springframework.org/security/tags" %>

<!-- Dynamic navigation -->


<style>
#searchBox, .navbar-logo {
    float: left;
    display: table-cell;
    margin-right: 100px;
}
.activeNav{
	
	*color:black;
}
.activeNav a{
	color:black !important;
	background-color:white;
}


/*  */


.nav li.active a {
    color:#fff;
    font-weight:bold;
    background-color:green;
}
img.userProfile
{
	width: 34px;
    height: 34px;
    border-radius: 50%;
    vertical-align: top;
    margin: 0px;
    margin-left: 20px;
}
#partner
{
	
}

.user
{
	display:table-cell;
}
.user .input-group-btn:last-child>.btn{
	margin-left: 5px;
	color:white;
	padding: 7px 10px;
}
.navbar-collapse.collapse
{
	display: table-cell!important;
}
.navbar-nav>li>a
{
	padding:0px;
}
.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover
{
	background-color: white;
}
.account,#partner,.upload-login-register
{
	float:right;
}
.navbar-right .dropdown-menu
{
	padding:15px;
}
.navbar-nav>li>.dropdown-menu
{
	margin-top: 15px;
}
ul.dropdown-menu.dropdown-item::before{
    content: "";
    position: absolute;
    top: -25%;
    left: 84%;
    border-width: 10px;
    border-style: dashed dashed solid;
    border-color: transparent;
    border-bottom-color:white;
    z-index: 2;
    display:block;
    
}
ul.dropdown-menu.dropdown-item::after{
    content: "";
    position: absolute;
    top: -26%;								/* differenct from before  */
    left: 84%;
    border-width: 10px;
    border-style: dashed dashed solid;
    border-color: transparent;
    border-bottom-color: #fff;				/* differenct from before  */
    border-bottom-color: rgba(0,0,0,.2);	/* differenct from before  */
    z-index: 1;								/* differenct from before  */
    display:block;
}

</style>

<sec:authorize access="isAuthenticated()">
   <sec:authentication  property="principal.userID" var="userID"/>
   <sec:authentication  property="principal.name" var="userName"/>
   <sec:authentication  property="principal.email" var="userEmail"/> 
   <sec:authentication  property="principal.profile" var="userProfile"/>         
   <div ng-init="getUserByID()"></div>
</sec:authorize>


<script>
window.userID = "${userID}"; 
window.CURRENT_PAGE = "${ParentID}";
window.fileName="";

</script>




<!-- top menu -->
<div class="top-menu" ng-init="getUserID(memIdAngular)">
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-bg">
		<span class="navbar-logo">
			<a href="/" class="navbar-brand# brand-logo"> 
				<img alt="Logo" src="${pageContext.request.contextPath}/resources/user/img/logo-4.png"/>					 
			 </a>					
		</span>		
		<div class="container">
			<div class="row">
		 	<span><jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/user/include/search.jsp"></jsp:include></span> 	
		 	<sec:authorize access="isAuthenticated()">
		    	<span class="account">
					<div class="collapse navbar-collapse" id="userAccount"​>  
					  <ul class="nav navbar-nav navbar-right">	
						<li class="dropdown">
						  <a href="/profile" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						  	<img alt="" src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{userInfoByUserID.PROFILE}}" class="userProfile">						  	
						  </a>
						  <ul class="dropdown-menu dropdown-item">
								<li>
									<a href="/userAccount">
										<span>${userName}</span>
									</a>
								</li>
								<li>
									<a href="/logout">
										<span>ចាកចេញ</span>
									</a>
								</li>			
						  </ul>
						</li>
					  </ul>
					</div>			    	
		    	</span> 
            </sec:authorize>	
		    <span id="partner"><jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/user/include/partner.jsp"></jsp:include></span>
		        <span class="upload-login-register">
		        	<div class="user"> 
						<div class="input-group">								
						    <span class="input-group-btn">	   	
							    <button class="btn btn-primary" data-toggle="modal"  ng-click="checkBeforeUpload()">
							    	ចែកចាយឯកសារ
							    </button>
							    <sec:authorize access="isAnonymous()">
							    	<a href="/login" class="btn btn-default">ចូលប្រើប្រាស់</a>
							    	<a href="/register" class="btn btn-default">ចុះឈ្មោះ</a> 
							    </sec:authorize>
						    </span>
						</div>
					</div>
		        </span> 
			</div>				
		</div>
	</nav>
</div>
<!-- main menu -->
<div class="main-menu-contain">
	<nav class="navbar navbar-default navbar-sticky navbar-main-menu">
		<div class="container">
			 <div class="main-menu">
				 <div style="float:left;position:relative;top:5px;padding-right:20px;padding-bottom:8px;">
					 <a href="/" class="logo-main-menu" style="background-color:transparent !important;">
					 	<img alt="Logo" style="width:40px;" src="${pageContext.request.contextPath}/resources/user/img/AKD.png"/>
					 </a>
				</div>
				<ul class="menu-basic nav" id="myTopnav">
					<li class="icon">
					   <span><i class="fa fa-bars" aria-hidden="true"></i></span>
					 </li>			
					  <li>
						  <a class="menu" href="/" ng-class="{'setActive':CURRENT_PAGE == ''}">
							   <span><i class="fa fa-home" aria-hidden="true"></i>
							   </span>ទំព័រដើម
						  </a>
					  </li>				  
					  <li ng-repeat="mainCat in getAllCategoryAndSubcategory" ng-cloak>
					  		<a class="menu" href="/view/{{mainCat.CAT_ID}}?p={{mainCat.CAT_NAME}}" ng-class="{'setActive':CURRENT_PAGE == mainCat.CAT_ID}" name="mainMenu">
							   <span><i class="{{mainCat.ICON}}" aria-hidden="true"></i>
							   </span>{{mainCat.CAT_NAME}}
						 	</a>
					  </li>
				</ul>
			</div> 
		</div>
	</nav>
</div>