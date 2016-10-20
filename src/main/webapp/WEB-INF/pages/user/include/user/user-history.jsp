<%@ page pageEncoding="utf-8"%>

<div id="viewed" class="tab-pane fade main-list" >
	<div class="history-header">
		<h3>ប្រវត្តិនៃការមើលរបស់អ្នក</h3>
		<div class="btn-clear-history">
			<button class="clear-history btn btn-primary" ng-click="deleteAllLogByUserID()">លុបទាំងអស់</button>
		</div>
	</div>
	<ol class="main-list-data">
		<li ng-repeat="log in getLogByUser">
			<div class="list-data">	   		 		
				<div class="col-md-3">
					<span class="no-savelist">{{$index+1}}</span>
					<a href="/detail/{{log.DOCUMENT.DOC_ID}}">
						<img data-ng-src="{{log.DOCUMENT.THUMBNAIL_URL}}" alt="Thumbnail">
					</a>					
				</div>
				<div class="col-md-8">
					<h4>{{log.DOCUMENT.TITLE}}</h4>
					<!-- <h4>{{slide.DOCUMENT[0].USERS[0].USER_NAME}}</h4>
					<p>{{slide.DOCUMENT[0].CREATED_DATE}}</p> -->
				 	<p>{{log.DOCUMENT.DES}}</p>
				</div>
				<div class="col-md-1">
					<button class="btn btn-danger" ng-click="deleteLog(log.LOG_ID)"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
					<input type="hidden" value="{{log.DOCUMENT.USER_ID}}" id="userID">
				</div>	   		 		
			</div>
		</li>
	</ol>
</div>