<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>	


<html>
<head>

<script>
window.userID = "${userID}"; 
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Slide</title>
<%@include file="include/admin-link.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jQuery/css/jquery.filer.css" type="text/css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jQuery/css/jquery.filer-dragdropbox-theme.css" type="text/css" >

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
<body​​ ng-app="MainApp" ng-cloak class="skin-blue sidebar-mini">
	<%@include file="../user/include/image-loader.jsp"%>
	<div class="wrapper">
		<%@include file="include/admin-header.jsp"%>
		<%@include file="include/layout/left-side-bar.jsp"%>
		
		
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Slide Information <small>advanced tables</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active"><a href="#">Slide</a></li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content" ng-controller="DocumentCtrl" ><!-- ng-init="getDocumentByStatus(1)" -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Slide Data</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							
							<button class="btn btn-flat btn-primary" data-toggle="modal"
								data-target="#upload-document" ng-click="getAllCategory()">Upload More
							</button>
							
							<div class="filter-btn" style="float: right;">
								<div class="form-group">
									<label>Filter By Status: </label> {{selectedStatus}}
									<select class="form-control" ng-model="selectedStatus" ng-change="getDocumentByStatus(selectedStatus)">			       
				                        <option ng-repeat="status in documentStatus" value="{{status.STATUS_VALUE}}">{{status.STATUS_NAME}}</option>
				                   	</select>
								</div>
							</div>
							<div style="clear: both;"></div>
							<br><br>


							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Posted By</th>
										<th>Posted Date</th>
										<th>View</th>
										<th>Share</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="d in document" ng-init="rowNumber= 10">
										<td>{{($index + ((filter.page - 1) * rowNumber)) + 1}}</td>
										<td>{{d.TITLE | strLimit: 22}}</td>
										<td>{{d.USERS[0].USER_NAME | strLimit: 22}}</td>
										<td>{{d.CREATED_DATE}}</td>
										<td>{{d.VIEW}}</td>
										<td>{{d.SHARE}}</td>
										<td><span class="label label-success">{{d.STATUS}}</span></td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												ng-click="getDataForUpdate(this)"
												data-toggle="modal"	data-target="#updateDocument">
												<i class="fa fa-edit"></i>
											</button>
											<button type="button" class="btn btn-danger btn-sm"
												ng-click="updateDocumentStatus(d.DOC_ID,3)">
												<i class="fa fa-eraser"></i>
											</button>
											<a href="/detail/{{d.DOC_ID}}" type="button" class="btn btn-primary btn-sm">
												<i class="fa fa-eye"></i>
											</a>
										</td>
									</tr>

								</tbody>
								
							</table>
							<div id="PAGINATION"></div>
						</div>
						<!-- /.box-body -->
					</div>

					<!-- Modal Start -->
					<%@include file="include/update-document.jsp"%>
					<%@include file="include/upload-document.jsp"%>

					<!-- Modal End -->
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> 
			</section>
			<!-- /.content -->
		</div>
	</div>
	</div>
	</div>
<%@include file="include/admin-script.jsp"%> 
</body>
</html>