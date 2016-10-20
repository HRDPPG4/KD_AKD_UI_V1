<%@ page pageEncoding="utf-8"%>

<a href="/detail/{{slide.DOC_ID}}" class="thumbnail" ng-click="countView(slide.DOC_ID)">
	<span class="img">
		<img data-ng-src="{{slide.THUMBNAIL_URL}}" err-src="{{errorImage2}}" alt="Thumbnail">  
		<!-- <span class="cover"><span class="title-cover">គណិតវិទ្យា</span></span> -->
	</span>
	<span class="title">{{slide.TITLE | strLimit: 22}}</span>
	<span class="user-name">{{slide.USERS[0].USER_NAME | strLimit: 22}}</span>
	<span class="descript">{{slide.DES | strLimit: 22}}</span>
	<span class="view-count"><span>{{slide.VIEW}}</span> បានមើល</span>
	<input type="text" value={{slide.THUMBNAIL_URL}} id="thubnail" ng-show="false">
	<span class="socials">
		<!-- <a href="#" alt="like" class="like">
			<span><i class="fa fa-thumbs-up" aria-hidden="true"></i></span>
		</a> -->
		<a href="{{slide.EXPORT_LINK}}" alt="download" class="download" target="_blank">
			<span><i class="fa fa-arrow-circle-o-down" aria-hidden="true"></i></span>
		</a>
		<a href="#" alt="share" class="share" ng-click="FBShare(slide.DOC_ID,slide.THUMBNAIL_URL)">
			<span><i class="fa fa-share-alt" aria-hidden="true"></i></span>
			
		</a>
	</span>
</a>
    
