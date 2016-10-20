<%@ page pageEncoding="utf-8"%>
<%@taglib prefix='sec' uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
   <sec:authentication  property="principal.userID" var="userID"/>
   <sec:authentication  property="principal.name" var="userName"/>
   <sec:authentication  property="principal.email" var="userEmail"/> 
   <sec:authentication  property="principal.profile" var="userProfile"/>         
</sec:authorize>
 
<aside class="main-sidebar">
  <section class="sidebar">
    <div class="user-panel">
      	<div class="pull-left image" ng-cloak>
			<img alt="" data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/${userProfile}" class="userProfile">
		</div>
		<div class="pull-left info">
			<p>${userName}</p>
		</div>
      </div>
    <ul class="sidebar-menu">
      <li class="header">ADMIN CONTROL</li>  
      
      <li class="dashboard">
        <a href="/admin/dashboard" >
          <i class="fa fa-tachometer"></i> 
          <span>Dashboard</span>     
        </a>
      </li>   
      
        <li class="slide">
        <a href="/admin/slide">
          <i class="fa fa-book"></i> 
          <span>Slides</span>          
        </a>
      </li>   
      
        <li class="category">
        <a href="/admin/category">
          <i class="fa fa-folder-open"></i> 
          <span>Categories</span>          
        </a>
      </li>   
      
        <li class="user">
        <a href="/admin/user">
          <i class="fa fa-users"></i> 
          <span>Users</span>          
        </a>
      </li>   
      
        <li class="comment">
        <a href="/admin/comment">
          <i class="fa fa-comments"></i> 
          <span>Comments</span>          
        </a>
      </li>   
      
        <li class="savelist">
        <a href="/admin/savelist">
          <i class="fa fa-list"></i> 
          <span>Savelists</span>          
        </a>
      </li>   
      
        <li class="feedback">
        <a href="/admin/feedback">
          <i class="fa fa-comment"></i> 
          <span>Feedbacks</span>          
        </a>
      </li>   
      
        <li class="report">
        <a href="/admin/report">
          <i class="fa fa-bell"></i> 
          <span>Reports</span>          
        </a>
      </li>   
    </ul>
  </section>
</aside>   
