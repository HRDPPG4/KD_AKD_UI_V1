<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<div class="container">
	<div class="modal fade" id="updateSavelist" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Update Save List</h4>
				</div>
				<div class="modal-body">
					<div class="row main">

						<div class="main-login main-center">
							<div class="box-body">
								<div class="form-group">
									<label for="document">List Name</label> <input
										type="text" class="form-control"
										name="listName" ng-model="listName">
								</div>
								
								<div class="form-group">
									<label for="user">User</label> <input
										type="text" class="form-control"
										name="user" ng-model="user" disabled>
								</div>

								<div class="form-group">
									<label> Status </label>
									<div class="radio">
										 <label> 
										 	<input	ng-model="status" type="radio" name="rdoResult" ng-value="'1'">
												Enable
										 </label> 
										 <label> 
										  	<input ng-model="status" type="radio"
												name="rdoResult" ng-value="'0'"> 
												Disable
										 </label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
								<input type="submit" class="btn btn-primary btn-flat"
									value="Submit" ng-click="alertUpdateSavelist()" data-dismiss="modal">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>