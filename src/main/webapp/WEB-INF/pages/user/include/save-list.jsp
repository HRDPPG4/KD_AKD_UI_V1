<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<div class="modal fade" id="save-list" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"  >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4><span class="glyphicon glyphicon-lock"></span>តារាងឯកសារសំខាន់</h4>
    <div class="imgcontainer">						     
    
    </div>
			          
        
      </div>
      <div class="modal-body" style="padding:40px 50px;"  >

     		<form action="#" method="post" enctype="multipart/form-data">
     			<div class="row">
  					  
  					   		<div id="message" style="background:#98bf21;height:30px;width:800px;position:absolute;display:none;">
  					   		  
  					   		</div>
    						<div class="thumbnail">
     						 <img src="${pageContext.request.contextPath}/resources/user/img/book.jpg" alt="Thumbnail" style=" width:400px; height:300px;position:relative;" >
      				         
   			 			
   			 			<!-- 	<button type="button" class="btn btn-success" id="list-save" >SaveList</button> -->
   			 				<div class="form-group" id="catsavelist"  >
   			 				 
  							 <div ng-if="getuserSavelist[0]">
  							 
  								  	
  									<select class="form-control"  id ="saveListnames">
  								         <option  value=""></option>
  										 <option ng-repeat="c in getuserSavelist"  value="{{c.LIST_ID}}">{{c.LIST_NAME}}</option>
  									
						       		 </select>
						       		 
						       		 
						       	</div> 
						     <button type="button" class="btn btn-info" id="bnt-create"​ >បង្កើតថ្មី</button>
						    <div class="form-group" style="padding-top:10px;padding-top:20px;display:none;" id="newsavelist" >
						    
							   	<input   type="text" class="form-control" ng-model="saveListname">					      
							    <input   type="hidden" class="form-control" value="{{docDetail[0].DOC_ID}}" id="doc_id">
							   
							  ​​	
  								
							</div>
							
							<div class="form-group" style="padding-top:10px;padding-top:20px;"  >
						    
							   ​<button type="button" class="btn btn-info" id="btn-savelist"​ ng-click="saveList()">រក្សាទុក</button>
  								
							</div>
							
						       
						       	
							 </div>
   			 				   
   			 				 
   			 				<div id="showSavelist" style="padding-bottom:10px;padding-top:20px; "  >
   			 				 <div class="form-group" style="padding-bottom:10px;padding-top:20px; "  >
   			 				 
  			
  						
  						
							</div>
							
							
   			 			    </div>
   			 		 </div>
  					
				</div>
     			 		
     					
			</form>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/save-list.js"></script>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
    
  </div>
</div>
