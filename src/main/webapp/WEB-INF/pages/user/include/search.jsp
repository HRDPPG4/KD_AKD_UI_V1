<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       
<style>
.searchBlock
{
	width:400px;
	display:table-cell;
}
.input-group-btn:last-child>.btn
{
	padding-left: 5px;
}
button.searchBtn
{
	background-color: #106cc8;
}

</style>

<div class="searchBlock"> 
	<div class="input-group">	
		<input myEnter="searchPage()" type="text" class="form-control form-search"  placeholder="ស្វែងរក"  ng-model="selected" uib-typeahead="title for title in allDocTitle | filter:$viewValue | limitTo:8">
	    <!-- <div class="input-group-btn search-panel">
		    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		    	<span id="search_concept">{{btnFilter.value}}</span> <span class="caret"></span>
		    </button>
		    <ul class="dropdown-menu" role="menu">
				<li class="divider"></li>
				<li ng-repeat="search_Filter in searchFilters"> ng-repeat="search_Filter in searchFilters"
				  <a myVal="{{search_Filter.id}}" style="cursor: pointer;" ng-click="searchFilterClicked($index)">{{search_Filter.value}}</a>
				</li>
				<li class="divider"></li>
		    </ul>
		</div> -->
	    <span class="input-group-btn">	    	
	    	<button class="btn btn-primary searchBtn" ng-click="searchPage()" ng-disabled="!selected">
		    	<span >&nbsp</span> <span class="glyphicon glyphicon-search"></span>
		    </button>
	    </span>
	</div>
</div>