<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="MainApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | User</title>
<%@include file="include/admin-link.jsp"%>
<style>
.form-horizontal .form-group {
	margin-right: 20px;
	margin-left: 20px;
}
.btn-flat {
	border-radius: 0;
	margin-left: 20px;
}
#PAGINATION{
	text-align:center;
}
</style>

</head>
<body ng-cloak class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="include/admin-header.jsp"%>
		<%@include file="include/layout/left-side-bar.jsp"%>
				
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Users Tables <small>advanced tables</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="dashboard"><i class="fa fa-dashboard"></i>
						Home</a></li>
				<li class="active"><a href="#">User</a></li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content" ng-controller="UserCtrl">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">User Data</h3>
						</div>
						<!-- box-header -->
						<div class="box-body">


							<button class="btn btn-flat btn-primary" data-toggle="modal"
								data-target="#addUser">Add User</button>
							<br /> <br />


							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Email</th>
										<th>Date</th>
										<th>Role</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="u in user" ng-init="rowNumber= 10">
										<td>{{($index + ((filter.page - 1) * rowNumber)) + 1}}</td>
										<td>{{u.USER_NAME}}</td>
										<td>{{u.EMAIL}}</td>
										<td>{{u.CREATED_DATE}}</td>
										<td>{{u.USER_ROLE}}</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												ng-click="getDataForUpdate(this)" data-toggle="modal"
												data-target="#updateUser">
												<i class="fa fa-edit"></i>
											</button>

											<button type="button" class="btn btn-danger btn-sm"
												ng-click="alertDelete(u.USER_ID)">
												<i class="fa fa-eraser"></i>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div id="PAGINATION"></div>
						</div>
						<!-- /.box-body -->

					</div>


					<!-- ===================================Modal============================== -->

					<%@include file="include/add-user.jsp"%>
					<%@include file="include/update-user.jsp"%>
					<!-- Modal End -->

					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
			<!-- /.content -->
		</div>
	</div>
	<%@include file="include/admin-script.jsp"%>
</body>
</html>