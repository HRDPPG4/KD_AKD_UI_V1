 <%@ page pageEncoding="utf-8"%>

<div class="modal fade" id="updateDocument" role="dialog">
	<div class="modal-dialog">
	  	<!-- Modal content-->
		<div class="modal-content">
		      <div class="modal-header"  >
		    	<button type="button" class="close" data-dismiss="modal" >&times;</button>
		 		<h4 class="modal-title">រូបភាពព័ត៌មានផ្ទាល់ខ្លួន</h4>               
		      </div>
			  <div class="modal-body" style="padding:40px 50px;">
			  	 <form method="post">     			
					<input type="file" name="docThumbnail" id="docThumbnail" onchange="angular.element(this).scope().setFile(this)" accept="image/*">									 			  				 		  				
			     </form>  	     					       
			  </div>
		    <div class="modal-footer">
		      <button class="btn-upload"​ alignt="center"​​ id="btnSave" ng-click="uploadDocThumbnail($event)" data-dismiss="modal">កែរប្រែរូបភាព</button>        
		    </div>
		</div>    
	</div>
</div>

  