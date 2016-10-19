<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/user/img/AKD.png">
	<!-- Sweet Alert -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/style_login.css">
    <!-- AngularJS -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css">	
</head>
<body>
<div class="wrap">
<!-- strat-contact-form -->	
<div class="contact-form">
<!-- start-form -->
	<form class="contact_form" action="/login" method="POST" id="frmLogin" name="contact_form">
		<h4>ចូលប្រើប្រាស់គណនីនៅទីនេះ</h4>
	    <ul>
	        <li>
	            <input type="email" class="textbox1" name="username" placeholder="អីុម៉ែល" required />
	            <span class="form_hint">សូមបញ្ចូលអ៊ីម៉ែលឲ្យបានត្រឹមត្រូវ</span>
	             <p class="mail"><img src="${pageContext.request.contextPath}/resources/user/img/login/contact.png" alt=""></p>
	        </li>
	        <li>
	            <input type="password" name="password" class="textbox2" placeholder="លេខសំងាត់">
	            <span class="form_hint">សូមបញ្ចូលលេខសំងាត់ឲ្យបានត្រឹមត្រូវ</span>
	            <p class="psw"><img src="${pageContext.request.contextPath}/resources/user/img/login/lock.png" alt=""></p>
	        </li>
         </ul>
       	 	<input class="input-login" style="width:30%;position:relative;left:20%;" type="submit"  value="ចូលប្រើប្រាស់"/>
			<div class="clear"></div>	
			<!-- <label class="checkbox"><input type="checkbox" name="checkbox" checked><i></i>Remember me</label>
		<div class="forgot">
			<a href="#">forgot password?</a>
		</div>	 -->
		<div class="clear"></div>	
	</form>
<!-- end-form -->
<!-- start-account -->
<%-- <div class="account">
	<h4>មិនមានគណនីឬ? សូមចុះឈ្មោះជាមួយគណនីបណ្តាញសង្គម!</h4>
    <div class="span"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/img/login/facebook.png" alt=""/><i>ចូលប្រើប្រាស់ជាមួយ Facebook</i><div class="clear"></div></a></div>	
    <div class="span1"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/img/login/twitter.png" alt=""/><i>ចូលប្រើប្រាស់ជាមួយធ្វីសធើ</i><div class="clear"></div></a></div>
    <div class="span2"><a href="#"><img src="${pageContext.request.contextPath}/resources/user/img/login/gplus.png" alt=""/><i>ចូលប្រើប្រាស់ជាមួយហ្គោហ្គោលផ្លើស</i><div class="clear"></div></a></div>
</div>	 --%>
<!-- end-account -->
<div class="clear"></div>	
</div>
<!-- end-contact-form -->
<div class="footer">
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
  	            		alert(data);
  	            	}else if(data == "User is disabled"){
  	            		alert(data);
  	            	}else if(data == "Bad credentials"){
  	            		alert(data);
  	            	}else{
  	            		
  	            		/* swal({  
	  	      				title: "អបអរសាទរ!",   
	  	      				text: "dd",   
	  	      				timer: 2000,   
	  	      				showConfirmButton: false
	  	      			}); */
  	            		
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
        
</body>
</html>