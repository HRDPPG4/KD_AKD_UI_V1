<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<div class="container">
	<div class="modal fade" id="updateUser" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Update User</h4>
					<div class="imgcontainer">
						<img
							src="${pageContext.request.contextPath}/resources/user/img/login.png"
							alt="Avatar" class="avatar">
					</div>
				</div>
				<div class="modal-body">
					<div class="row main">

						<div class="main-login main-center">
							<form class="form-horizontal" method="post" action="#">

								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Name</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gname"
												placeholder="Ex: Bunhong" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Password</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-key fa" aria-hidden="true"></i></span>
											<input
												type="password" class="form-control" name="name" ng-model="gpass"
												placeholder="Ex: *******" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope-o fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gemail"
												placeholder="Ex: bunhong@gmail.com" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Phone</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-phone fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gphone"
												placeholder="Ex: 012-345-678" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Date</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-calendar fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gdate"
												placeholder="Ex: dd-mm-yyyy" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Remark</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-sticky-note fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gremark"
												placeholder="Remark" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Status</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-pencil fa" aria-hidden="true"></i></span>
											<input
												type="text" class="form-control" name="name" ng-model="gstatus"
												placeholder="0" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Role</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-users fa" aria-hidden="true"></i></span>
											<select name="role" ng-model="grole" class="form-control">
												<option value="ROLE_ADMIN">Admin</option>
												<option value="ROLE_USER">User</option>
											</select>
											
										</div>
									</div>
								</div>

								<button type="button" id="btnUpdate"
									class="btn btn-primary btn-flat btn-block login-button btn-flat"
									ng-click="alertUpdate()" data-dismiss="modal">Update</button>

							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</div>
