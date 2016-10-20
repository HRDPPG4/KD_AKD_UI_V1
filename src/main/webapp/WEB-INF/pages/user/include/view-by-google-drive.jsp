<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>



<div id="Slide-Detail" ng-if="docDetail[0].DOC_TYPE_NUM == 2 || docDetail[0].DOC_TYPE_NUM == 3">
    <div class="modal fade" id="ViewByGoogleDrive" role="dialog">
    <div class="modal-dialog#">
      <div class="modal-content">
        <div class="modal-header"  >
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div class="modal-body">          
           
          <button id="btn-hide" class="btn btn-primary">Hide</button>
          <iframe data-ng-src='{{trustSrc(docDetail[0].EMBEDED_LINK)}}'></iframe>
        	
        </div>
        <!-- <div class="modal-footer">
                  
        </div> -->
      </div>      
    </div>
  </div>  
</div> 



<%-- <% if(2==2) {%>
 
<% } %> --%>