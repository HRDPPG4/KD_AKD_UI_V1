<%@ page pageEncoding="utf-8"%>

<style>
.feedback{
	position: fixed;
	right: 0px;
	z-index: 9999;
	bottom: 2px
}
.btn-feedback,.btn-feedback:active,.btn-feedback:focus {
    color: #fff;
    background-color: #26a63c;
    border-color: #26a63c;
}
.btn-feedback:hover {
    color: #fff;
    background-color: #31ba66;
    border-color: #31ba66;
}

</style>

<div class="feedback">
	<button class="btn btn-feedback" data-toggle="modal" data-target="#modal-feedback">Feedback</button>
</div>

<div class="modal fade" id="modal-feedback" role="dialog">
	<div class="modal-dialog">
	  	<!-- Modal content-->
		<div class="modal-content">
		      <div class="modal-header"  >
		    	<button type="button" class="close" data-dismiss="modal" >&times;</button>
		 		<h4 class="modal-title">សូមធ្វើការបញ្ចេញមតិរបស់អ្នកចំពោះគេហៈទំព័ររបស់យើង</h4>               
		      </div>
		      
		      <div class="modal-body" >
			  	<div class="form-group">
			  		<textarea placeholder="សូមសរសេរមតិរបស់អ្នក"​ data-ng-model="feeback_text" class="form-control" style="min-height: 150px;"></textarea>
			  	</div>    					       
			  </div>
			  
		    <div class="modal-footer">
		      <button class="btn btn-feedback"​ alignt="center"​​ data-dismiss="modal"​ data-ng-click="saveFeedBack()" data-ng-disabled="!feeback_text">Feedback</button>        
		    </div>
		</div>    
	</div>
</div>