<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    

<div class="container" id="register " >
	<div class="modal fade" id="register" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
        
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <div class="imgcontainer">						     
	      <img data-ng-src="${pageContext.request.contextPath}/resources/user/img/login.png" alt="Avatar" class="avatar">
	    </div>
        <!-- <h4><span class="glyphicon glyphicon-lock"></span> ចុះឈ្មោះ</h4> -->
          
        </div>
        <div class="modal-body" >
          	<div class="row main">
				 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="#">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">ឈ្មោះ</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" ng-model="userName" class="form-control" name="name" id="name"  placeholder="Ex: Chivorn"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">អ៊ីម៉ែល</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" ng-model ="userEmail" class="form-control" name="email" id="email"  placeholder="Ex: chivorn@live.com"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">លេខទូរស័ព្ទ</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
									<input type="number" ng-model="userPhone" class="form-control" name="phone" id="phone"  placeholder="Ex: 010 11 22 33"/>
									
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">ពាក្យសំងាត់</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" ng-model="userPassword" class="form-control" name="password" id="password"  placeholder="Ex: 947akd@$Khmer"/>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">បញ្ជាក់ពាក្យសំងាត់ប្តងទៀត</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" ng-model="userConfirmpassword"class="form-control" name="confirm" id="confirm" pw-check ="userPassword"  placeholder="Ex: 947akd@$Khmer"/>
									

								</div>
							</div>
						</div>
						
						<div class="form-group ">
							<button type="button" class="btn-register" ng-disabled="error" ng-click="saveUser()"><span class="glyphicon glyphicon-lock"></span>ចុះឈ្មោះ</button>
						</div>
					</form>
				</div>
			</div>
        </div>
       
      </div>
    </div>
  </div>
			
			
</div>
