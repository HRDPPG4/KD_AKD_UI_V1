<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<div class="modal fade" id="login" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"  >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
    <div class="imgcontainer">	
    <img src="${pageContext.request.contextPath}/resources/user/img/login.png" alt="Avatar" class="avatar">					     
    </div>
		<!-- <h4><span class="glyphicon glyphicon-lock"></span> ចូលប្រើប្រាស់</h4> -->	          
        
      </div>
      <div class="modal-body" style="padding:40px 50px;">
        <form role="form" id="frmLogin">
          <div class="form-group">
            <label for="usrname"><span class="glyphicon glyphicon-envelope"></span> អ៊ីម៉ែល</label>
            <input type="text" name="username" class="form-control" id="usrname" data-ng-model="email"placeholder="សូមបញ្ចូល អ៊ីម៉ែល">
          </div>
          <div class="form-group">
            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> ពាក្យសំងាត់</label>
            <input name="password" type="password" class="form-control" id="psw" data-ng-model="password" placeholder="សូមបញ្ចូលពាក្យសំងាត់">
          </div>      
            <button type="submit" class="btn-login"><i class="fa fa-sign-in" aria-hidden="true"></i>ចូលប្រើប្រាស់</button>
        </form>
      </div>
      <div class="modal-footer">
        <!-- <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button> -->
        <p>មិនទាន់ជាសមាជិក? <a href="#" data-toggle="modal" data-target="#register" data-dismiss="modal">ចុះឈ្មោះ</a></p>
        <!-- <p> <a href="#">ភ្លេចពាក្យសំងាត់?</a></p> -->
      </div>
    </div>
    
  </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
        
        $(function() {
        	
        	$("#frmLogin").submit(function(e){
       		
       		  e.preventDefault();
       			
       		  $.ajax({
  	            url: "${pageContext.request.contextPath}/login",
  	            type: "POST",
  	            data: $("#frmLogin").serialize(),
//   	            beforeSend: function (xhr) {
//   	                xhr.setRequestHeader("X-Ajax-call", "true");
//   	            },
  	            success: function(data) {
  	            	if(data == "User account is locked"){
  	            		swal({  
	  	      				title:data,   
	  	      				text: "",   
	  	      				timer: 600,   
	  	      				showConfirmButton: false
	  	      			});
  	            	}else if(data == "User is disabled"){
  	            		swal({  
	  	      				title:data,   
	  	      				text: "",   
	  	      				timer: 600,   
	  	      				showConfirmButton: false
	  	      			});
  	            	}else if(data == "Bad credentials"){
  	            		swal({  
	  	      				title:data,   
	  	      				text: "",   
	  	      				timer: 600,   
	  	      				showConfirmButton: false
	  	      			});
  	            	}else{
  	            		swal({  
	  	      				title: "អបអរសាទរ!",   
	  	      				text: "",   
	  	      				timer: 600,   
	  	      				showConfirmButton: false
	  	      			},function(){
	  	      				location.href = "${pageContext.request.contextPath}/"+data;
	  	      			});
  	            	}  	            	
  	            },
  	         	error: function(data){
  	         		console.log(data);
  				}
  	        });
       			
       		});
	      
        	
        
        });
        </script>
