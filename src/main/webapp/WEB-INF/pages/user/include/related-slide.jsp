<%@ page pageEncoding="utf-8"%>

<div class="related-slide">
	<div class="col-md-4">
		<div class="row col-sm-12" >
			<div class="related-container">																					
				<h4>ឯកសារដែលមានទំនាក់ទំនងនឹងគ្នា</h4>
				<hr>													
				<div class="col-xs-12 col-sm-6 col-md-12" ng-repeat="related in documentByCatID | filter:{DOC_ID: '!' + docDetail[0].DOC_ID} | limitTo : 10">  												     									 		 
			 		<div style="width:170px;float:left;position: relative;left:-5px;">	
							<input type="hidden" class="form-control" value="{{related.DOC_ID}}" id="slide_id">						 												 																		
				 		 <a href="/detail/{{related.DOC_ID}}" class="thumbnail-detail" ng-click="getDocumentById(related.DOC_ID)" >
							<div class="img-detail">
								<img id="thumnail" src="{{related.THUMBNAIL_URL}}" alt="Thumbnail" style="">  
							</div>
						</a>
					</div>
					<div style="width:170px;position:relative;float:left;left:10px;top:20px;">
						<div class="title-detail">
							<div id="Title">
				 				{{related.TITLE | strLimit: 30}}
				 			</div>
				 			<div id="View">												 		
				 				{{related.USERS[0].USER_NAME | strLimit: 30}}
				 			</div>
				 			<div id="Des">
				 				{{related.DES | strLimit: 30}}
				 			</div>
						</div>								
			     	</div> 
				 </div> 													 
			</div>
		</div>
	</div> 
</div>
    
