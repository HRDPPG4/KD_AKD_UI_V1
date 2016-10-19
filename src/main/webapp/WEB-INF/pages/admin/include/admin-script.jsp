<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

    
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery.min.js" type="text/javascript"></script>

<!-- If Page is Slide -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery.filer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-upload-file.js"></script>
<!--  End Page Slide script-->

<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/sweetalert/js/sweetalert-dev.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/AdminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/AdminLTE/js/demo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/angular/angular.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/admin/angular/AdminApp.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.bootpage.min.js" type="text/javascript"></script>



<c:choose>
    <c:when test="${CURRENT_PAGE.equals('dashboard')}">
		<script>
			$("li.dashboard").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('slide')}">
        <script>
        	$("li.slide").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('user')}">
     	<script>
     		$("li.user").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('comment')}">
        <script>
        	$("li.comment").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('savelist')}">
       <script>
       	$("li.savelist").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('feedback')}">
        <script>
        	$("li.feedback").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('category')}">
        <script>
        	$("li.category").addClass("active");
		</script>
    </c:when>
    <c:when test="${CURRENT_PAGE.equals('report')}">
       <script>
       		$("li.report").addClass("active");
		</script>
    </c:when>
    <c:otherwise>
        
    </c:otherwise>
</c:choose>
