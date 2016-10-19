
 <%@ page pageEncoding="utf-8"%>
 
<!--  <style>
 input.FileTitle{
 	width: 100%;
 }
 </style> -->

<div class="modal fade" id="upload-document" role="dialog" ng-controller="DocumentCtrl">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"  >
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
      <!--   <h4><span class="glyphicon glyphicon-lock"></span>បញ្ជូលឯកសារនៅទីនេះ</h4> -->                  
      </div>
      <div class="modal-body" style="padding:40px 50px;">      	
      	<div class="form-group" >
	        <label>
	          <input ng-model="uploadOption" type="radio" name="radUploadOption" ng-value="'Single'" ng-click="getUploadOption(uploadOption)" checked>
	          Single
	        </label>
	        <label>
	          <input ng-model="uploadOption" type="radio" name="radUploadOption" ng-value="'Multiple'" ng-click="getUploadOption(uploadOption)">
	          Multiple
	        </label>
        </div>
      
   		  <div ng-show="showSingleInput">
   		  	<form method="post" enctype="multipart/form-data" > 			
	 		 <input type="file" name="Singlefile" id="singleUploadDocument" data-ng-model="selectedFile" accept=".pdf,.doc,.docx,.ppt,.pptx"/>	  		  			 		  					
		  	
			<div ng-show="selectedFile">
			    <div class="form-group" >
			      <label>Title:</label>
			      <input type="text" class="form-control" placeholder="Title" ng-model="selectedFile.name" id="title">
			    </div>
				
			    <div class="form-group">
			      <label>Category:</label>		      
			        <select class="form-control" ng-model="catID">			       
                        <option ng-repeat="x in AllCategory | filter:{ CAT_LEVEL: '!0'}" value="{{x.CAT_ID}}">{{x.CAT_NAME}}</option>
                   	</select>
			    </div>
			    
			    <div class="form-group">
			      <label>Description:</label>
			      <input type="text" class="form-control" placeholder="Description" ng-model="des" >
			    </div>					       
 			</div>
			</form>
   		  </div>
   		  
   		  <div ng-show="showMultipleInput">
   		  	<form method="post" enctype="multipart/form-data" > 			
	 			<input type="file" name="file" id="multipleUploadDocument" multiple="multiple" accept=".pdf,.doc,.docx,.ppt,.pptx"/>	
	 			
	 			<div class="form-group">
			      <label>Category:</label>		      
			        <select class="form-control" ng-model="catID">			       
                        <option ng-repeat="x in AllCategory | filter:{ CAT_LEVEL: '!0'}" value="{{x.CAT_ID}}">{{x.CAT_NAME}}</option>
                   	</select>
			    </div>	  		  			 		  					
			</form>
   		  </div>
			
			
	      </div>
      <div class="modal-footer">
        <button class="btn btn-primary btn-upload"​ alignt="center"​​ id="btnSave" ng-click="uploadDocument($event)" ng-show="showSingleInput || showMultipleInput">រក្សាទុក</button>   
      </div>
    </div>
    
  </div>
</div>
