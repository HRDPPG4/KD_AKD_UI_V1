<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix='sec' uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
   <sec:authentication  property="principal.userID" var="userID"/>
   <sec:authentication  property="principal.name" var="userName"/>
   <sec:authentication  property="principal.email" var="userEmail"/> 
   <sec:authentication  property="principal.profile" var="userProfile"/>         
</sec:authorize>

<script>
window.userID = "${userID}"; 
</script>

<style>
	 .nav>li>a>img.userProfile
	{
		height:19px;
		width:30px;
	}
</style>

<header class="main-header">
			<!-- Logo -->
			<a href="/" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>AKD</b>s</span>
				<!-- logo for regular state and mobile devices -->
				<span class="logo-lg">All <b>Khmer</b> Docs</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->

						<!-- Notifications: style can be found in dropdown.less -->
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img alt="" src="{{API_PATH_ANGULAR}}/resources/img/user-profile/${userProfile}"  class="userProfile" alt="User Image">
								<span class="hidden-xs">${userName}</span>
							</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header">
									<img alt="" src="{{API_PATH_ANGULAR}}/resources/img/user-profile/${userProfile}"  alt="User Image">
										<p>${userName}</p>
								</li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="/userAccount" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="/logout" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
