<%@ page pageEncoding="utf-8"%>


<style>
.upload_waiting{
 display: none;
 position:fixed;
 top:50%;
 left:50%;
 margin:-35px 0px 0px -35px;
 background:#fff url(${pageContext.request.contextPath}/resources/user/img/loader.gif) no-repeat center center;
 width:150px;
 height:150px;
 z-index:9999;
 -moz-border-radius:10px;
 -webkit-border-radius:10px;
 border-radius:10px;
 -moz-box-shadow:1px 1px 3px #000;
 -webkit-box-shadow:1px 1px 3px #000;
 box-shadow:1px 1px 3px #000;
 opacity:0.7;
 filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
</style>

<div class="upload_waiting"></div>