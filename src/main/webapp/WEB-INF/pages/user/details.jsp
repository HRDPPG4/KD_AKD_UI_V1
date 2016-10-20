<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Document Detail</title>
	<%@include file="include/link/link.jsp"%>
	
	<style>
		
		#SlideBox
		{
			position: relative;
		}
		#btn-fullscreen
		{
			position: absolute;
			right: 0px;
			bottom: 0px;
		}
		#btn-hide
		{
			position: absolute;
			right: 15px;
			top: 10px;
			background-color: white;
			height:10%;
			width:25%;
			opacity:0;
			cursor: default;
		}
		div.drive-viewer-popout-button drive-viewer-dark-button goog-inline-block drive-viewer-button
		{
			background-color: #003666 !importants;
			display:none !important;
			opacity:0;
		}
		.related-slide .related-container #User,.related-slide .related-container #Des,.related-slide .related-container #Title
		{
		  padding: 3px;
		}
		.footer{
			background-color: #374458;
			width: 100% !important;
			height:50% !important;
			color:  white;
			margin-top: 30px;
			text-align:left;
			word-wrap:break-word !important;
		}
		body
		{	
			word-wrap:break-word !important;
			font-family:Khmer OS Battambang;	
		}
		.shareIcon .fa-share-alt:before,.shareIcon .fa-arrow-circle-o-down:before,.shareIcon .fa-thumbs-up:before{
			color:white;
		}
		#share .fa-share-alt:before,#share .fa-arrow-circle-o-down:before,#share .fa-thumbs-up:before{
			color:black;
		}
		/* FOR DETAIL PAGE ONLY */
		/* #header {
		    height: 56px;
		}
		.top-menu {
		    height: 27px;
		} */

		
	</style>

</head>
<body ng-cloak ng-app="UserApp"  ng-controller="UserCtrl" data-ng-init="getDocumentAndCategoryAndUserAndCommentByDocID('${id}')">		
	<jsp:include page="include/register.jsp"></jsp:include>
	<jsp:include page="include/login.jsp"></jsp:include>
	<jsp:include page="include/upload.jsp"></jsp:include>
	<jsp:include page="include/save-list.jsp"></jsp:include>
	<jsp:include page="include/view-by-google-drive.jsp"></jsp:include> 
  	<jsp:include page="include/toolbar-right.jsp"></jsp:include> 
  	<%@include file="include/image-loader.jsp"%>	
	<header id="header">
	 	<jsp:include page="include/header.jsp"></jsp:include> 	 	
	</header>
	

	<div>
		<content>
			<div id="page-content-wrapper">
			 	<div class="container-fluid">
					<section id="slide-view">
						<div class="row section nav-left topspace-right-slide">
							<div class="row">
							 	<div class="show-slide-view">
									<div class="col-md-8  content-slide-view">
										<div class="row col-md-12 col-md-offset-0">
											<div class="slide-container" id="SlideBox">												
												<!--  IFRAME BLOCK TO DISPLAY SLIDE AND PDF -->	
												<button id="btn-hide" class="btn btn-primary">Hide</button>
												 <iframe data-ng-src='{{trustSrc(docDetail[0].EMBEDED_LINK)}}' allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe> 
												 <div ng-show="docDetail[0].DOC_TYPE_NUM == 2 || docDetail[0].DOC_TYPE_NUM == 3">
												 	<button id="btn-fullscreen" class="btn btn-primary" data-toggle="modal" data-target="#ViewByGoogleDrive" >
												 		<span> <i class="fa fa-arrows-alt" aria-hidden="true"></i></span>
												 	</button>
												</div>
											</div>										
											<div class="detail-slide">
											     <div class="Slide-Owner">											
													<div id="title">
														<p>{{docDetail[0].TITLE | strLimit: 60}}</p>
													</div>
													<div id="owner">
														<span id="img-user">
															<img data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{docDetail[0].USERS[0].PROFILE}}" alt="">
														</span>
														 {{docDetail[0].USERS[0].USER_NAME}}														
														<input type="text" value={{docDetail[0].THUMBNAIL_URL}} id="thubnail" ng-show="false">													
													</div>
													<div id="read">
														<span>
															<i class="fa fa-eye" aria-hidden="true"></i>:  
															<span ng-bind="docDetail[0].VIEW"></span>														
														</span>
													</div>
													<div id="share">
														<span>
															<i class="fa fa-share-alt" aria-hidden="true"></i>:  
															<span ng-bind="docDetail[0].SHARE"></span>
														</span>
													</div>
													<div id="line">
														<hr>
													</div>
													<div id="btn" >	
														<button class="btn-savelist-detail" id="savelist"  ng-click="getSavelistUser(docDetail[0].USER_ID)">
															<span><i class="fa fa-plus" aria-hidden="true"  ></i>បន្ថែមទៅបញ្ជី</span>
														</button>		
													
														<button class="btn-share-detail" id="shareBtn" ng-click="FBShare(docDetail[0].DOC_ID,docDetail[0].THUMBNAIL_URL)">
															<span​ class="shareIcon"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
															ចែករំលែក
														</button>
		
														<button class="btn-report-detail"​ ng-click="checkUserLogin()">
															<span><i class="fa fa-flag" aria-hidden="true"></i></span>
															រាយការណ៍អំពីបញ្ហា
														</button>	
														
														<a class="btn-download-detail"​ href="{{docDetail[0].EXPORT_LINK}}" target="_blank">
															<span><i class="fa fa-download" aria-hidden="true"></i></span>
															ទាញយក
														</a>									
													</div>													
												 </div>										
											</div>
											<!-- savelist -->
											<div class="content-savelist" ng-show="enableList">
												<div class="header-savelist">សូមធ្វើការជ្រើសរើសបញ្ជីផ្ទុកឯកសារ
													<span>
														<i class="fa fa-times " id="cross" style="font-size:10px;float:right;" aria-hidden="true"></i>
													</span>
												</div>
												<form action="" class=" form-savelist">
													<div class="form-group" id="catsavelist"  >		   			 				 
				  							 			<div ng-if="getuserSavelist[0]">
						  									<select class="form-control" id ="saveListnames" ng-model="ListName"  ng-change="checkSavelist(ListName)">
						  										 <option ng-repeat="c in getuserSavelist" value="{{c.LIST_ID}}"  >{{c.LIST_NAME}} </option>  															
												       		 </select>
										       	    	</div> 
								     
													    <div class="form-group" style="padding-top:10px;padding-top:20px;display:none;" id="newsavelist" >													    
														   	<input   type="text" class="form-control" ng-model="saveListname">					      
														    <input   type="hidden" class="form-control" value="{{docDetail[0].DOC_ID}}" id="doc_id">
														</div>														
														<div class="form-group" style="padding-top:10px;padding-top:20px;"  >													    
														 	<!--   ​<button type="button" class="btn btn-info" id="btn-savelist"​ ng-click="saveList()">រក្សាទុក</button> -->							  								
														</div>
									 				</div>
									 				<p>មិនទាន់មានបញ្ជីដែលទាក់ទងមែនទេ?</p>
									 				<button type="button" class="btn-create-new"​ >បង្កើតថ្មី</button>
													<input class=" form-control"  id="comment-savelist" ng-model="saveListname"/>
													<input type="button" id="btnSavelist" value="បញ្ជូន" ng-click="saveList()">		
												</form>													
											</div>
											<script>
												$(document).ready(function(){
													$('.btn-create-new').click(function(){
		
														$('#comment-savelist').show();
														$('.btn-create-new').hide();
														$('#btnSavelist').show();
													});
		
												$('#cross').click(function(){
													$('.content-savelist').hide();
												});
													
											
												});
											</script>
											<!-- report -->
											<div class="content-report">
												<div class="header-report">សូមរាយការណ៍អំពីបញ្ហារបស់ឯកសារនេះ
													<span>
														<i class="fa fa-times" id="cross-report" style="font-size:10px;float:right;" aria-hidden="true"></i>
													</span>
												</div>												
												<form action="" class=" form-report">
													<textarea class=" form-control" rows="2" id="comment" ng-model="currentReport"></textarea>
													<input type="button" id="btnReport" value="រាយការណ៍" ng-click="insertReport()">
												</form>													
											</div>
											 <div class="slide-detail-more">
											 	<div id="publish">ថ្ងៃចែកចាយ: {{docDetail[0].CREATED_DATE}}</div>
												<div id="category">ប្រភេទកញ្ចប់: {{docDetail[0].CATEGORY[0].CAT_NAME}}</div>
												<hr>
												<div id="description">ការរៀបរាប់បន្ថែម: 
													<div>
														{{docDetail[0].DES}}
													</div>
												</div>
											</div>
											<div class="commend-visitor">
												<jsp:include page="include/comment.jsp"></jsp:include>
											</div>
										</div>
									</div>
								</div> 
								<%@include file="include/related-slide.jsp"%> 							
							</div>
						</div>
					</section>
		  		</div> 
			</div>
		</content>
	</div> 	
	<footer>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>
	<script>				
		  function setHeight() {
		    windowHeight = $(window).innerHeight();
		    $('#SlideBox iframe').css('min-height', windowHeight-180);
		    $('#Slide-Detail iframe').css('min-height', windowHeight-60);
		    $('#Slide-Detail .modal-body').css('min-height', windowHeight-50);
		    $('#ViewByGoogleDrive').css('min-height', windowHeight);
		    
		  };
		  setHeight();
		  
		  $(window).resize(function() {
		    setHeight();
		  }); 
	</script>
	
	
 	<%@include file="include/script/script.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/savelist.js"></script> 		
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/save-list.js"></script> 
	
	<!-- Report and Share Linked -->
	<script src="../resources/user/js/report.js"></script>
	<!-- <script src="../resources/user/js/countShare.js"></script>   -->	
</body>
</html>