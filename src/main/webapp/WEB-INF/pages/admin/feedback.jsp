<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="MainApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Feedback</title>
<%@include file="include/admin-link.jsp"%>
<style>
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
				Feedback Data <small>advanced tables</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active"><a href="#">Feedback</a></li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content" ng-controller="FeedbackCtrl">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Feedbacks Table</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Desciption</th>
										<th>Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="f in feedback" ng-init="rowNumber= 10">
										<td>{{($index + ((filter.page - 1) * rowNumber)) + 1}}</td>
										<td>{{f.DES}}</td>
										<td>{{f.CREATE_DATE}}</td>
										<td><span class="label label-success">{{f.STATUS}}</span></td>
										<td>
											<button ng-click = "readFeedback(this)"class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-read-feedback">
												<i class="fa fa-eye"></i>
											</button>
											<button type="button" class="btn btn-danger btn-sm"
												ng-click="alertDelete(f.FEEDBACK_ID)">
												<i class="fa fa-eraser"></i>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
							<div id="PAGINATION"></div>
							<%@include file="include/modal-read-feedback.jsp"%>
						</div>
						<!-- /.box-body -->
					</div>
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