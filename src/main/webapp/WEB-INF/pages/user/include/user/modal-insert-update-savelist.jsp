<%@ page pageEncoding="utf-8"%>

<div class="modal fade" id="insert-update-savelist" role="dialog">
	<div class="modal-dialog">
	  	<!-- Modal content-->
		<div class="modal-content">
		      <div class="modal-header"  >
		    	<button type="button" class="close" data-dismiss="modal" >&times;</button>
		 		<h4 class="modal-title">បញ្ជីផ្ទុកឯកសារ</h4>               
		      </div>
			  <div class="modal-body" style="padding:40px 50px;">
			  		<div class="form-group">
			            <label>ឈ្មោះបញ្ជី:</label>
			            <input type="text" placeholder="បញ្ចូលចំណងជើងបញ្ជីដាក់ឯកសារ" class="form-control" ng-model="newSavelistName">
		          </div>  
		          <div class="form-group">
			            <label>ពិពណ៌នា:</label>
			            <textarea class="form-control"​ placeholder="មតិខ្លះៗអំពីបញ្ជីគ្រប់គ្រងឯកសារមួយនេះ" ng-model="newSavelistDes"></textarea>
		          </div>	     					       
			  </div>
		    <div class="modal-footer">
		      <button ng-show = "!showUpdate" ng-click="insertSavelistOnly()" class="btn btn-primary"​ data-dismiss="modal"  ng-disabled="!currentClickSavelist.LIST_NAME">រក្សាទុក</button>  <!-- ng-click="saveList()" -->
		      <button ng-show = "showUpdate" ng-click="updateSavelist(currentClickSavelist.LIST_ID)" class="btn btn-primary"​ data-dismiss="modal" ng-disabled="!currentClickSavelist.LIST_NAME	">កែរប្រែ</button>       
		    </div>
		</div>    
	</div>
</div>
    
<!-- <div id="savelist" class="tab-pane fade">
 	<div class="content-savelist-all">
	 	<div id="header-view-savelist">
	 		<ul class="view-savelist">
			  	<li class="savelist"> បញ្ជី​បទ​ដែល​បាន​បង្កើត</li>
			  	<li class="btn-add">
				  <button>
				  	<i class="fa fa-plus-circle" aria-hidden="true"></i>បញ្ជីបង្កើតឯកសារថ្មី
				  </button>
			  </li>
			</ul>
	    </div>
	    <div>
			<div class="list-group" ng-repeat="list in getuserSavelist ">
	 			<a href="/detail/{{list.SAVELISTDETAIL[0].DOCUMENT[0].DOC_ID}}" class="list-group-item">
					<div class="media">		    
						<div class="checkbox pull-right">
						</div>
						<div class="pull-left">
							<img class="media-object" data-ng-src="{{list.SAVELISTDETAIL[0].DOCUMENT[0].THUMBNAIL_URL}}" alt="Image">
						</div>
						<div class="media-body">
							<h4 class="media-heading">{{list.SAVELISTDETAIL[0].DOCUMENT[0].TITLE}}</h4>
							<p>{{list.SAVELISTDETAIL[0].DOCUMENT[0].DES}}</p>
							<p>បង្កើតថ្ងៃទីៈ{{list.CREATED_DATE}}</p>
						</div>		
					</div>							       
			   	</a>
	 		</div>
	    </div>
	</div>
	<div class="createlist-tooltip">
     	<div class="tooltip-header-list">
     	</div>
   		<div class="body-list">
   			<div​​​​​ class="header-list">   			 
    			 <div class="descript-list">
    				<input type="text" placeholder="បញ្ចូលចំណងជើងបញ្ជីដាក់ឯកសារ" ng-model="saveListname"/>
    			</div>
    			<div class="footer-list">
 					<div class="create-playlist-section">
 						<button class="btn-content-list">បោះបង់</button>
 						<button class="btn-create" ng-click="saveList()">បង្កើត</button>
 					</div>
    			</div>
   			</div>   			
   		</div>
     </div>
  </div> -->