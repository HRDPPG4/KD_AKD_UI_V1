<%@ page 
    pageEncoding="utf-8"%>
    
    
<div id="mysavelist" class="tab-pane fade main-list">
	<div class="content-mydoc">	        
	   <div class="pdf-ppt-doc-edit tab-content">
	   		 <div id="pdf-edit" class="tab-pane fade in active">	   	
	   		 	<div class="main-savelist">
	   		 		<div class="col-md-3">	   		 			
	   		 			<img data-ng-src="${pageContext.request.contextPath}/resources/user/img/savelist.jpg" >
	   		 		</div>
	   		 		<div class="col-md-8">
	   		 			<h3>{{currentClickSavelist.LIST_NAME}}</h3>
		   		 		<h4><!-- <span><i class="fa fa-globe" aria-hidden="true"></i></span> | --> ${userName}</h4>
		   		 		<!-- <p>{{totalInSaveListByUser}}</p> -->
		   		 		<p>{{currentClickSavelist.REMARK}}</p>
	   		 		</div>
	   		 		<div class="col-md-1">
	   		 			<button ng-click="clearSavelistInput()" class="btn btn-danger" data-toggle="modal" data-target="#insert-update-savelist"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>	   		 			
	   		 			<button ng-click="getUpdateSavelistInfo(currentClickSavelist.LIST_ID,currentClickSavelist.LIST_NAME,currentClickSavelist.REMARK)" class="btn btn-danger" data-toggle="modal" data-target="#insert-update-savelist"><i class="fa fa-pencil" aria-hidden="true"></i></button>
	   		 			<button ng-click="deleteSavelist(currentClickSavelist.LIST_ID)" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
	   		 		</div>
	   		 	</div>
	   		 	<ol class="main-list-data">
	   		 		<li ng-repeat ="slide in getDocumentInSavelist">
	   		 			<div class="list-data">	   		 		
			 				<div class="col-md-3">
			 					<span class="no-savelist">{{$index+1}}</span>
			 					<a href="/detail/{{slide.DOCUMENT[0].DOC_ID}}">
			 						<img data-ng-src="{{slide.DOCUMENT[0].THUMBNAIL_URL}}" alt="Thumbnail">
			 					</a>
					 			
					 		</div>
					 		<div class="col-md-8">
					 			<h4>{{slide.DOCUMENT[0].TITLE}}</h4>
			 		 			<h4>{{slide.DOCUMENT[0].USERS[0].USER_NAME}}</h4>
			 		 			<p>{{slide.DOCUMENT[0].CREATED_DATE}}</p>
			 		 			<!-- <p>{{slide.DOCUMENT[0].DES}}</p> -->
					 		</div>
					 		<div class="col-md-1">
					 			<button class="btn btn-danger" ng-click="deleteSavelistDetail(slide.DOCUMENT[0].DOC_ID)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
					 			<input type="hidden" value="{{slide.DOCUMENT[0].USER_ID}}" id ="userID">
								<input type="hidden" value="{{slide.LIST_ID}}" id ="listID">
					 		</div>	   		 		
			   		 	</div>
	   		 		</li>
	   		 	</ol>	   		 		
	   		</div>	
	   </div>
	</div>
</div>