 <%@ page pageEncoding="utf-8"%>

<div class="modal fade" id="modal-update-document" role="dialog">
	<div class="modal-dialog">
	  	<!-- Modal content-->
		<div class="modal-content">
		      <div class="modal-header"  >
		    	<button type="button" class="close" data-dismiss="modal" >&times;</button>
		 		<h4 class="modal-title">កែរប្រែព័ត៌មានឯកសារ</h4>           
		      </div>
			  <div class="modal-body" style="padding:40px 50px;">
			  
			  	 <div class="form-group">
					<label>ឈ្មោះឯកសារ</label> 
					<input type="text" class="form-control" placeholder="ឈ្មោះឯកសារ" ng-model="documentToUpdate.TITLE">
				</div>	
				<div class="form-group">
					<label>ប្រភេទកញ្ចប់</label>
					<select class="form-control" ng-model="documentToUpdate.CAT_ID">			       
                        <option ng-repeat="x in category | filter:{ CAT_LEVEL: '!0'}" value="{{x.CAT_ID}}">{{x.CAT_NAME}}</option>
                   	</select>
				</div>
				 <div class="form-group">
					<label>ការរៀបរាប់ពីឯកសារ</label> 
					<textarea type="text" class="form-control" placeholder="ការរៀបរាប់ពីឯកសារ" ng-model="documentToUpdate.DES"></textarea>
				</div>
				
				     					       
			  </div>
		    <div class="modal-footer">
		      <button class="btn btn-primary"​ alignt="center"​​ id="btnSave" ng-click="updateDocument(documentToUpdate.DOC_ID)" data-dismiss="modal" ng-disabled="!documentToUpdate.TITLE">កែរប្រែ</button>        
		    </div>
		</div>    
	</div>
</div>

  