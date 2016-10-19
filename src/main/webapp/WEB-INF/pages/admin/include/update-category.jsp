<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<div class="container">
	<div class="modal fade" id="updateCategory" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Update Category</h4>
				</div>
				<div class="modal-body">
					<div class="row main">

						<div class="main-login main-center">
							<div class="box-body">
								<div class="form-group">
									<label for="categoryTitle">Category Title</label> <input
										type="text" class="form-control" placeholder="Category title "
										name="folderName" ng-model="folderName">
								</div>
								
								<div class="form-group">
									<label for="categoryTitle">Category Icon</label> 
									<input type="text" class="form-control" placeholder="Icon"
										ng-model="icon">
								</div>
								
								<div class="form-group"​ ng-show="!showCatBox">
									<label for="categoryTitle">Category Order Number</label> 
									<input type="number" class="form-control" placeholder="Order Number"
										ng-model="catNumOrder">
								</div>
								
								<div class="form-group" ng-show="catLevel!=0">
									<label>Category:</label> 
									<select class="form-control" ng-model="parentID">			       
				                        <option ng-repeat="cat in allCategoryNewFun | filter:{CAT_LEVEL:'0'}" value="{{cat.CAT_ID}}">{{cat.CAT_NAME}}</option>
				                   	</select>
								</div>


								<div class="form-group">
									<label for="description">Description</label>
									<textarea class="form-control" placeholder="Description..."
										rows="4" ng-model="des"></textarea>
								</div>

								<div class="form-group">
									<label> Status </label>
									<div class="radio">
										 <label> <input
											ng-model="sta" type="radio" name="rdoResult" ng-value="'1'">
											Enable
										</label> <label> <input ng-model="sta" type="radio"
											name="rdoResult" ng-value="'0'"> Disable
										</label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
								<input type="submit" class="btn btn-primary btn-flat"
									value="Submit" ng-click="alertUpdate()" data-dismiss="modal">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>