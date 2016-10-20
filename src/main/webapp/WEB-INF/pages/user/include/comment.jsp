<%@ page pageEncoding="utf-8"%>
 
<%@taglib prefix='sec' uri="http://www.springframework.org/security/tags" %>    
<sec:authorize access="isAuthenticated()">
	<sec:authentication  property="principal.userID" var="userID"/>
	<sec:authentication  property="principal.name" var="userName"/>
	<sec:authentication  property="principal.email" var="userEmail"/> 
	<sec:authentication  property="principal.profile" var="userProfile"/>
</sec:authorize>
    
    
<div id="commentBox" class="container-fluid"> 
	<h3>បញ្ចេញមតិរបស់អ្នកចំពោះអត្ថបទនេះ</h3>
	<form action="">
		<div id="img-user" class="col-md-1">
			 <img alt="" data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{userInfoByUserID.PROFILE}}">
		</div>

		<div id="commentBoxArea" class="col-md-11">
			 <textarea myEnter="insertComment()" placeholder = "សូមបញ្ចេញមតិរបស់អ្នក..." ng-model="newComment"></textarea> 
			 <div id="btnPost">
			<input type="button" value="ដាក់ប្រកាស" class="btn btn-primary" ng-click="insertComment()" ng-disabled="!newComment">
		</div>
		</div>

		<!-- <div id="btnPost">
			<input type="button" value="ដាក់ប្រកាស" class="btn btn-primary" ng-click="insertComment()" ng-disabled="!newComment">
		</div> -->
		
		<div ng-if="commentByDoc" id="listCommentBox" ng-repeat="comment in commentByDoc">	
			<div id="img-user-commented">
				<img alt="" data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{comment.USERS[0].PROFILE}}" class="image-user-commend">
				{{comment.USERS[0].USER_NAME}}
			</div>
			
			<div id="comment-list">
				<p class="comment">{{comment.REMARK}}</p>
				 
			</div>
		</div>

	</form>
</div> 