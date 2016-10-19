
var app = angular.module('UserApp', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);

var API_ACCESS_CONTROLLER_URL = "http://localhost:1111/api/v1";
var API_PATH = "http://localhost:1111";
var UI_PATH = "http://192.168.178.202:2222";




///////////////////		START MAIN CONTROLLLER FOR USER BLOCK	/////////////////
app.controller('UserCtrl',['$scope','$rootScope','$http','$location','$sce', '$window', function($scope,$rootScope,$http,$location,$sce,$window){	//$rootScope, $scope, $http, $location, $localStorage, loginService
	$rootScope.currentSubCategory="currentSubCategory";
	$scope.currentMainCategory="";
	$scope.currentDocumentID="";		
	$rootScope.userID = $window.userID;
	$rootScope.CURRENT_PAGE = $window.CURRENT_PAGE;
	$rootScope.API_PATH_ANGULAR = API_PATH;	// USE IT FOR SET IMAGE URL IN WEB PAGE.
	
	
	$scope.partners = [
		     		      {
		     		        "SITE_URL"	: "http://localhost:2222",
		     		        "SITE_NAME"	: "AKD",
		     		        "SITE_LOGO"	: "http://localhost:2222/resources/user/img/AKD.png"
		     		      },
		     		      {
		     		        "SITE_URL"	: "http://www.knongdai.com/",
		     		        "SITE_NAME"	: "KND",
		     		        "SITE_LOGO"	: "http://www.knongdai.com/resources/static/images/favicon/favicon-16x16.png"
		     		      },
		     		      {
		     		        "SITE_URL"	: "http://www.khmeracademy.org/",
		     		        "SITE_NAME"	: "KA",
		     		        "SITE_LOGO"	: "http://www.khmeracademy.org/resources/assets/img/favicon/android-icon-192x192.png"
		     		      },
		     		      {
		     		        "SITE_URL"	: "http://news.khmeracademy.org/",
		     		        "SITE_NAME"	: "AKN",
		     		        "SITE_LOGO"	: "http://news.khmeracademy.org/resources/images/logo/akn.png"
		     		      },
		     		      {
		     		        "SITE_URL"	: "http://www.kosign.com.kh/k2_layout.act",
		     		        "SITE_NAME"	: "KOSIGN",
		     		        "SITE_LOGO"	: "http://www.kosign.com.kh/img/ico/logo.png"
		     		      }		     		      
	     		    ];
	     		
	
	
	
	////////////////////START SEARCH BLOCK	/////////////////
	var _selected;
	$scope.selected = undefined;

	$scope.searchPage = function(){
		location.href= "/search/"+$scope.selected;
	}
	
	var url = window.location.href;
	var lastPart = url.substr(url.lastIndexOf('/') + 1);
	
	$scope.checkLocation = function(){
		if(lastPart=="recommend"){
			$scope.showRecomment=true;
			$scope.showNewPost=false;
			$scope.showPopular=false;
			$scope.getDocumentByRecommended();
		}else if(lastPart=="popular"){
			$scope.showRecomment=false;
			$scope.showNewPost=false;
			$scope.showPopular=true;
			$scope.getDocumentByPopular();
		}else if(lastPart=="new"){
			$scope.showRecomment=false;
			$scope.showNewPost=true;
			$scope.showPopular=false;
			$scope.getDocumentByNewPost();
		}else{
			$scope.showRecomment=false;
			$scope.showNewPost=false;
			$scope.showPopular=false;
		}
			
		
	}
	$scope.getDocumentByLikeTitle = function(title){			
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocumentByLikeTitle/'+title,
			method:'GET'			
		}).then(function(response){
			
			$scope.documentSearch=response.data.DATA;
			console.log("respone search.");
			console.log(response);
			
			if(response.data.DATA==null){
				$scope.recordNotFound=true;
			}
		}, function(response){
			
		});
	}
 
	  //////////////////// END SEARCH BLOCK	/////////////////

	

	////////////////////	START CATEGORY BLOCK	/////////////////
	
	
	$scope.getAllCategory = function(){
		if(!$scope.checkUserLogin()){
			$http({
				url:API_ACCESS_CONTROLLER_URL + '/category',
				method:'GET'			
			}).then(function(response){

				$scope.category=response.data.DATA;
				
				console.log("Get All Category Test");
				console.log($scope.category);
				
			}, function(response){
			
			});
			
		}
	}	
	
	$scope.getCategoryByParentID=function(parentID){	
		$scope.getCategoryByID(parentID);
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getCategoryByParentID/'+parentID,
			method:'GET'
		}).then(function(response){
			$scope.parentCategory=response.data.DATA;
		}, function(response){

		});	
	}
	//	-----------------Get All Category and Subcategory-----------------------
	
	$scope.getAllCategoryAndSubcategory=function(){	
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getCategoryByParentID/0',
			method:'GET'
		}).then(function(response){
			$scope.getAllCategoryAndSubcategory=response.data.DATA;
		}, function(response){

		});	
	}
	$scope.getAllCategoryAndSubcategory();
	
	$scope.getCategoryByID=function(CatID){		
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/category/'+CatID,
			method:'GET'
		}).then(function(response){
			$scope.getCategoryByID=response.data.DATA;
		}, function(response){

		});	
	}
	
	//	GET MAIN CATEGORY
	/*$scope.getMainCategory=function(parentID){		
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getCategoryByParentIDAndStatusEnable/0',
			method:'GET'
		}).then(function(response){
			$scope.mainCategory=response.data.DATA;
		
		}, function(response){

		});	
	}*/
	
	////////////////////	END CATEGORY BLOCK	/////////////////
	
	///////////////////		START COMMENT BLOCK	/////////////////

	
	$rootScope.UserID=$window.userID;
	
	$scope.getAllCommentByDocID=function(DocID){	

		
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getAllCommentByDocID/'+DocID,
			method:'GET'
		}).then(function(response){
			$scope.commentByDoc=response.data.DATA;
		}, function(response){

		});	

	}

	
	
	$scope.insertComment = function(){
		if($rootScope.UserID==0 || $rootScope.UserID==null ||$rootScope.UserID =="")
		{
			location.href= "/login";
		}else{

			$http({
				url:API_ACCESS_CONTROLLER_URL + '/comment',
				method:'POST',
				data:{				
					"CREATED_DATE": new Date(),
					"DOC_ID": $scope.currentDocumentID,
					"REMARK": $scope.newComment,
					"STATUS": 1,
					"USER_ID": $rootScope.UserID
				}	
				
			}).then(function(response){
				$scope.getAllCommentByDocID($scope.currentDocumentID);
				$scope.newComment="";
			}, function(response){
				alert("Error");
			});	
		}
		
	}

	
	
	///////////////////		END COMMENT BLOCK	/////////////////
	
	///////////////////		START DOCUMENT BLOCK	/////////////////
	
	$scope.showRecomment=false;
	$scope.showNewPost=false;
	$scope.showPopular=false;
	
	$scope.getDocumentByPopular=function(){
		$scope.showRecomment=false;
		$scope.showNewPost=false;
		$scope.showPopular=true;
		
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocumentByPopular/',
			method:'GET',
			params : $scope.filter
		}).then(function(response){
			$scope.popular=response.data.DATA;

			//$scope.setDocumentPagination(response.data.PAGING.TOTAL_PAGES);
		//	console.log("Popular: "+$scope.popular);
		}, function(response){

		});
	}
	
	//TODO: default filter
	$scope.filter = {
		page: 1,
		limit: 20
	};
	
	var PAGINATION = angular.element("#PAGINATION");
	$scope.setDocumentPagination = function(totalPage){
		PAGINATION.bootpag({
			total: totalPage,          // total pages
			page: $scope.filter.page,   // default page
			leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 10
		});		
	}
	
	PAGINATION.on("page", function(event, num){
		//alert(num);
		$scope.filter.page = num;
		$scope.getDocumentByPopular();
	});
	
	$scope.getDocumentByRecommended=function(){
		$scope.showRecomment=true;
		$scope.showNewPost=false;
		$scope.showPopular=false;
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocumentByRecommended/'+$rootScope.userID,
			method:'GET'
		}).then(function(response){
			if(response.data.DATA==null){
				$scope.recordFound=false;
			}else{
				$scope.recordFound=true;
			}
			$scope.recommend=response.data.DATA;
		}, function(response){

		});
	}
	
	
	var PAGINATION = angular.element("#PAGINATION");
	$scope.setDocumentByRecommentPagination = function(totalPage){
		PAGINATION.bootpag({
			total: totalPage,          // total pages
			page: $scope.filter.page,   // default page
			leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 10
		});		
	}
	
	PAGINATION.on("page", function(event, num){
		//alert(num);
		$scope.filter.page = num;
		$scope.getDocumentByRecommended();
	});
	
	
	$scope.getDocumentByNewPost=function(){		
		$scope.showRecomment=false;
		$scope.showNewPost=true;
		$scope.showPopular=false;
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocumentByNewPost/',
			method:'GET',
			params : $scope.filter
		}).then(function(response){
			$scope.newDocument=response.data.DATA;
		//	$scope.setNewPostPagination(response.data.PAGING.TOTAL_PAGES);
			//console.log("New: "+$scope.newDocument);
		}, function(response){

		});
	}
	
//	//TODO: default filter
//	$scope.filter = {
//		page: 1,
//		limit: 20
//	};
	
	var PAGINATION = angular.element("#PAGINATION");
	$scope.setNewPostPagination = function(totalPage){
		PAGINATION.bootpag({
			total: totalPage,          // total pages
			page: $scope.filter.page,   // default page
			leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 10
		});		
	}
	
	PAGINATION.on("page", function(event, num){
		//alert(num);
		$scope.filter.page = num;
		$scope.getDocumentByNewPost();
	});
	
	$scope.getDocumentAndCategoryAndUserAndCommentByDocID = function(DocID){
		fbThumbnail = DocID;
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocDetail/'+DocID,
			method:'GET'
		}).then(function(response){
			$scope.docDetail=response.data.DATA;
			$scope.commentByDocID=response.data.DATA[0].COMMENT;
			$rootScope.currentSubCategory=response.data.DATA[0].CAT_ID;
			$scope.currentDocumentID=DocID;
			$scope.getAllCommentByDocID(DocID);
			$scope.getAllDocumentByCatID($rootScope.currentSubCategory);
		}, function(response){

		});
	}
	
	
	$scope.allDocTitle=[];
	$scope.getAllDocument = function(){
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/document',
			method:'GET'
		}).then(function(response){
			$scope.document=response.data.DATA;
			$scope.allDocTitle=response.data.DATA;						
			for (var i = 0; i < response.data.DATA.length; i++) {
				$scope.allDocTitle[i] = response.data.DATA[i].TITLE;
			   // console.log($scope.allDocTitle);
			}
		}, function(response){

		});
	}
	
		
	$scope.getAllDocument();
	
	$scope.getAllDocumentByCatID=function(CatID){
		$rootScope.currentSubCategory=CatID;		//First It is close!!
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/getDocumentByCatID/'+CatID,
			method:'GET'
		}).then(function(response){
			$scope.documentByCatID=response.data.DATA;
			if(response.data.DATA==null){
				$scope.recordNotFound=true;
			}
			else{
				$scope.recordNotFound=false;
			}
		}, function(response){

		});
	}
	
	$scope.getDocumentById=function(docID){
		
		$scope.countView(docID);
		
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/document/'+docID,
			method:'GET'
		}).then(function(response){
			$scope.doc=response.data.DATA;
			$rootScope.currentSubCategory=$scope.doc.CAT_ID;	//currentSubCategory can get new value here. I dont' know why old value lost???
			$scope.currentDocumentID = $scope.doc.DOC_ID;				
			$scope.getAllCommentByDocID($scope.doc.DOC_ID);			
			$scope.getAllDocumentByCatID($scope.doc.CAT_ID);
		}, function(response){

		});	
		
		
	   
		
	}
	$scope.getDocumentByUser=function(docTypeNum){
		$scope.showsavelist= false;
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/document/user/'+$rootScope.userID,
			method:'GET',
			params: {
				docTypeNum : docTypeNum
			}
		
		}).then(function(response){
			$scope.DocumentUser=response.data.DATA;
		}, function(response){

		});
		
	}
	
	$scope.deleteDocument=function(docID){				
		var typeDoc = $("#typeDoc").val();
		
		swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
			text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
			type: "warning",   showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "យល់ព្រម",   
			cancelButtonText: "បដិសេធ",   
			closeOnConfirm: false,   closeOnCancel: false },
			function(isConfirm){   
			 	if (isConfirm) {     
			 		swal("បានជោគជ័យ!", "ឯកសារត្រូវបានលុប", "success"); 
			 		$http({
						url:API_ACCESS_CONTROLLER_URL + '/document/'+docID,
						method:'DELETE',
					
					
					}).then(function(response){
					  // alert("Deleted!");
					 	$scope.getDocumentByUser($rootScope.userID,typeDoc);
					}, function(response){
			          // alert("Fail");
					});
			 	//	$scope.delete(i);
			 	}
		 		else {     
		 			swal("បានបដិសេធ", "ឯកសាររបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
		 		} 
		 	});
	 
	}
    $scope.countView = function(docID){
    	
    	Des = "View Document";
    	status = 1;
    	$scope.trackLog(docID,Des,status);
    	$http({
    		url : API_ACCESS_CONTROLLER_URL + '/document/counview/'+docID,
    		method : 'PUT',
    		
    	}).then(function(response){
    		
    	},function(response){
    	});
    }
    
    /*$scope.CountDocByCatID = function(catID) {
    	//alert(catID);
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/getDocumentCountByCatID/'+catID,
			method : 'GET'
		}).then(function(response) {
			$scope.docCount = response.data.COUNT;
			console.log($scope.docCount);
		}, function(response) {
			
		});
	}*/
    
    $scope.updateTotalDocByCatID = function(catID) {
    	//alert(catID);
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/document/updateTotalDocByCatID/'+catID,
			method : 'PUT'
		}).then(function(response) {
			/*$scope.docUpdateByCatID = response.data.MESSAGE;
			console.log($scope.docUpdateByCatID);*/
		}, function(response) {
			
		});
	}
    
    $scope.countTotalDocByUserID = function() {
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/document/countTotalDocByUserID/'+$rootScope.userID,
			method : 'GET'
		}).then(function(response) {
			$scope.countDocByUserID = response.data.COUNT;
			console.log($scope.countDocByUserID);
		}, function(response) {
			
		});
	}
    
    $scope.updateDocumentStatus = function(docID,status) {    	
    	swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
			text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
			type: "warning",   showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "យល់ព្រម",   
			cancelButtonText: "បដិសេធ",   
			closeOnConfirm: false,   closeOnCancel: false },
			function(isConfirm){   
			 	if (isConfirm) {     			 		
			 		$http({
						url : API_ACCESS_CONTROLLER_URL + '/updateDocumentStatus?docID=' + docID + '&status='+ status,
						method : 'PUT'
					}).then(function(response) {
						swal("បានជោគជ័យ!", "ឯកសារត្រូវបានលុប", "success"); 
						$scope.countTotalDocByUserID();
						$scope.getDocumentByUser();
					}, function(response) {
						
					});
			 	}
		 		else {     
		 			swal("បានបដិសេធ", "ឯកសាររបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
		 		} 
		 	});
	}
    
    $scope.getDocumentInfoToUpdate = function(docID) {
    	$scope.getAllCategory();
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/document/' + docID,
			method : 'GET'
		}).then(function(response) {
			$scope.documentToUpdate = response.data.DATA;
		}, function(response) {
			
		});
	}
    
    $scope.updateDocument = function(docID) {
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/document',
			method : 'PUT',
			data : {
				'TITLE' : $scope.documentToUpdate.TITLE,
				'DES' : $scope.documentToUpdate.DES,
				'EMBEDED_LINK' : $scope.documentToUpdate.EMBEDED_LINK,
				'THUMBNAIL_URL' : $scope.documentToUpdate.THUMBNAIL_URL,
				'EXPORT_LINK' : $scope.documentToUpdate.EXPORT_LINK,
				'VIEW' : $scope.documentToUpdate.VIEW,
				'SHARE' : $scope.documentToUpdate.SHARE,
				'CREATED_DATE' : $scope.documentToUpdate.CREATED_DATE,
				'DOC_TYPE_NUM' : $scope.documentToUpdate.DOC_TYPE_NUM,
				'USER_ID' : $scope.documentToUpdate.USER_ID,
				'CAT_ID' : $scope.documentToUpdate.CAT_ID,
				'STATUS' : $scope.documentToUpdate.STATUS,
				'DOC_ID' : docID
			}
		}).then(function() {
			$scope.getDocumentByUser();
			swal(
				  'អបអរសាទរ!',
				  'ឯកសារកែរប្រែបានសម្រេច!',
				  'success'
				)
		}, function() {
			swal(
				  'សូមសោកស្តាយ!',
				  'ឯកសារកែរប្រែមិនបានសម្រេច!',
				  'error'
				)
		});
	}
    
    
    
    
	
	///////////////////		END DOCUMENT BLOCK	/////////////////
	
	///////////////////		START FEEDBACK BLOCK	/////////////////
    $scope.feeback_text="";
	$scope.saveFeedBack = function(){	
		$http({
			url:API_ACCESS_CONTROLLER_URL + '/feedback',
			method:'POST',
			data:{
				  'CREATED_DATE': new Date(),
				  'DES': $scope.feeback_text,
				  'STATUS': 1
				  
			}
		}).then(function(response){
			$scope.feeback_text="";
			swal({  
				title: "ជោកជ័យ!",   
				text: "សូមអរគុណចំពោះការកែរកំហុសឆ្គងរបស់យើង!",   
				timer: 800,   
				showConfirmButton: false 
			});
		
			
		}, function(response){
		 console.log(response);
		});
	}
	
	
	///////////////////		END FEEDBACK BLOCK	/////////////////
	
	///////////////////		START LOG BLOCK	/////////////////
	

	 $scope.trackLog=function(docID ,Des,status){
		  
		   if($rootScope.userID ==null || $rootScope.userID=="" ||$rootScope.userID ==0 ){

		   }else{
			   $http({
					url:API_ACCESS_CONTROLLER_URL + '/log',
					method:'POST',
					data :{
						  'CREATED_DATE': new Date(),
						  'DOC_ID': docID, 
						  'REMARK': Des,
						  'STATUS': status,
						  'USER_ID': $rootScope.UserID
					}
				}).then(function(response){

				
				}, function(response){
					
				});	
		   }
			
		}

	
	 $scope.deleteLog =function(docID){
		 swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
			text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
			type: "warning",   showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "យល់ព្រម",   
			cancelButtonText: "បដិសេធ",   
			closeOnConfirm: false,   closeOnCancel: false },
			function(isConfirm){   
			 	if (isConfirm) {     
			 		swal("បានជោគជ័យ!", "ឯកសារត្រូវបានលុប", "success"); 
			 		$http({
						url:API_ACCESS_CONTROLLER_URL + '/log/'+docID,
						method:'DELETE',
					}).then(function(response){
						$scope.getLogByUserID();
					}, function(response){
		              
					});	
			 	}
		 		else {     
		 			swal("បានបដិសេធ", "ឯកសាររបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
		 		} 
		 	});
		}
	 
	  $scope.getLogByUserID =function(){
		  $http({
				url:API_ACCESS_CONTROLLER_URL + '/user/log/'+$rootScope.userID,
				method:'GET'
			}).then(function(response){
				$scope.getLogByUser=response.data.DATA;
			  
			}, function(response){
              
			});		  
  		}
	  
	  $scope.deleteAllLogByUserID =function(){
			 swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
				text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
				type: "warning",   showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "យល់ព្រម",   
				cancelButtonText: "បដិសេធ",   
				closeOnConfirm: false,   closeOnCancel: false },
				function(isConfirm){   
				 	if (isConfirm) {     
				 		swal("បានជោគជ័យ!", "ឯកសារត្រូវបានលុប", "success"); 
				 		$http({
							url:API_ACCESS_CONTROLLER_URL + '/deleteAllLogByUserID/'+$rootScope.userID,
							method:'DELETE',
						}).then(function(response){
							$scope.getLogByUserID();
						}, function(response){
			              
						});	
				 	}
			 		else {     
			 			swal("បានបដិសេធ", "ឯកសាររបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
			 		} 
			 	});
			}
	  
	
	
	///////////////////		END LOG BLOCK	/////////////////
	
	
	    
	///////////////////		START REPORT BLOCK	/////////////////
	  


	
	
		$scope.insertReport = function(){
			if($rootScope.UserID==0 || $rootScope.UserID==null ||$rootScope.UserID =="")
			{
				location.href= "/login";
			}else{
				$http({
					url:API_ACCESS_CONTROLLER_URL + '/report',
					method:'POST',
					data:{	
						"CREATED_DATE": new Date(),
						"DOC_ID": $scope.currentDocumentID,
						"REMARK": $scope.currentReport,
						"STATUS": 1,
						"USER_ID": $rootScope.UserID
					}	
					
				}).then(function(response){
					swal({  
						title: "វាយតម្លៃបានជោកជ័យ!",   
						text: "សូមអរគុណចំពោះការវាយតម្លៃរបស់អ្នក!",   
						timer: 800,   
						showConfirmButton: false 
					});
				
					$scope.report = response.data.DATA;
					$scope.currentReport="";
				
				}, function(response){
					
				});					
			}			
		}

	
	
	
	 ///////////////////		END REPORT BLOCK	/////////////////
		
	
	
	 ///////////////////		START SAVELIST BLOCK	/////////////////
	
	 // create saveList
		$scope.showNew = true;
		$scope.showSave = false;
		$scope.checkSavelist = function(listname){
			
			if (listname != 'undefined' || listname != '')
				$scope.showNew = false;
			   
			    $scope.saveList(listname);
			    
		}
	   $scope.showButtonSave = function(){ $scope.showSave = true;}
	   $scope.enableList=true;

		$scope.saveList = function(savelistID){   
			 
			 

			
		   	  var Savelistname = 0;
		   
		   	  var catename = "";
		      var Des = "";
		      var listname ="";
		      var status =  0;
		         catename = savelistID 
		        
		       
		         
		        listname = $scope.saveListname;
		         
		      
		         doc = $('#doc_id').val();

		       
		        
		         if(catename == undefined ){
		              
		        	 var Des = "Create New Savelist";
		        	 var docID = $('#doc_id').val();
		        	 var status = 0;
		           	  Savelistname = listname;
		           	  $http({
		           			url:API_ACCESS_CONTROLLER_URL + '/savelist',
		           			method:'POST',
		           			data:{
		           				  'CREATED_DATE': new Date(),
		           				  'DOC_ID': docID,
		           				  'LIST_NAME': Savelistname,
		           				  'REMARK': Des,
		           				  'STATUS':1 ,
		           				  'USER_ID': $rootScope.userID

		           			}
		           		}).then(function(response){		
		           			$scope.trackLog(docID,Des,status);
		           			$scope.saveListname="";
		           			swal({  
		        				title: "ជោកជ័យ!",   
		        				text: "ឯកសាររបស់អ្នកត្រូវបានបញ្ចូលទៅក្នុងបញ្ជី!",   
		        				timer: 800,   
		        				showConfirmButton: false 
		        			});
		           			$scope.enableList=false;
		           			
		           		}, function(response){
		          
		           			
		           		});
		       	  
		         }else if(listname ==undefined ){
		        	  Des ="Create into Existing Savelist";
		        	 
		        	
		        	  
		           	  Savelistname = catename;
		           		$http({
		           			url:API_ACCESS_CONTROLLER_URL + '/savelistDetail',
		           			method:'POST',
		           			data:{
		           				  'CREATED_DATE': new Date(),
		           				  'DOC_ID': doc ,
		           				  'LIST_ID': Savelistname
		           				 
		           			}
		           		}).then(function(response){
		           		
		           			$scope.trackLog(docID,Des,status);
		           			$scope.saveListname="";
		           			swal({  
		        				title: "ជោកជ័យ!",   
		        				text: "ឯកសាររបស់អ្នកត្រូវបានបញ្ចូលទៅក្នុងបញ្ជី!",   
		        				timer: 800,   
		        				showConfirmButton: false 
		        			});
		           			$scope.enableList=false;
		           		}, function(response){
		           		
		           			
		           		});

		         }else{
		        	
		          	  /*Savelistname = listname;
		          	  
		          	  Des = "Create Category Savelist";
		          	  $http({
		        			url:API_ACCESS_CONTROLLER_URL + '/saveSavelistOnly',
		        			method:'POST',
		        			data:{
		        				  'CREATED_DATE': new Date(),
		        				  'LIST_NAME': Savelistname,
		        				  'REMARK': Des,
		        				  'STATUS':1 ,
		        				  'USER_ID': $rootScope.userID

		        			}
		        		}).then(function(response){
		        		
		        			$scope.trackLog(docID,Des,status)
		        			$scope.saveListname="";
		        			swal({  
		        				title: "ជោកជ័យ!",   
		        				text: "ឯកសាររបស់អ្នកត្រូវបានបញ្ចូលទៅក្នុងបញ្ជី!",   
		        				timer: 800,   
		        				showConfirmButton: false 
		        			});
		        			$scope.enableList=false;
		        		}, function(response){
		        			
		        		});*/

		        
		         }
		         
		         
		       
				
			}
		
		
		
		
		// NEW SAVELIST FUNCTION UPDATE.
		
		$scope.insertSavelistOnly = function(){
			$http({
				url:API_ACCESS_CONTROLLER_URL + '/saveSavelistOnly',
				method:'POST',
				data:{				
					"LIST_NAME": $scope.newSavelistName,
					"CREATED_DATE": new Date(),
					"REMARK": $scope.newSavelistDes,
					"STATUS": 1,
					"USER_ID": $rootScope.UserID
				}	
				
			}).then(function(response){
				$scope.getSavelistMenuUser();
				$scope.clearSavelistInput();
				swal(
					  'អបអរសាទរ!',
					  'បញ្ជីផ្ទុកឯកសារត្រូវបានបង្កើតជោគជ័យ!',
					  'success'
					)
			}, function(response){
				swal(
					  'សូមសោកស្តាយ!',
					  'បញ្ជីផ្ទុកឯកសារបង្កើតមិនបានសម្រេច!',
					  'error'
					)
			});	
			
		}
		
		$scope.updateSavelist = function(listID){
			$http({
				url:API_ACCESS_CONTROLLER_URL + '/savelist',
				method:'PUT',
				data:{	
					"LIST_ID":listID,
					"LIST_NAME": $scope.newSavelistName,
					"CREATED_DATE": new Date(),
					"REMARK": $scope.newSavelistDes,
					"STATUS": 1,
					"USER_ID": $rootScope.UserID
				}	
				
			}).then(function(response){
				$scope.getDocumentByEachSavelist(listID)
				$scope.getSavelistMenuUser();
				$scope.clearSavelistInput();
				swal(
					  'អបអរសាទរ!',
					  'បញ្ជីផ្ទុកឯកសារត្រូវបានកែរប្រែជោគជ័យ!',
					  'success'
					)
			}, function(response){
				swal(
					  'សូមសោកស្តាយ!',
					  'បញ្ជីផ្ទុកឯកសារកែរប្រែមិនបានសម្រេច!',
					  'error'
					)
			});	
			
		}
		
		$scope.getUpdateSavelistInfo = function(id,name,des){
			$scope.showUpdate = true;
			$scope.newSavelistID = id;
			$scope.newSavelistName = name;
			$scope.newSavelistDes = des; 
		}
		
		$scope.clearSavelistInput = function(){
			$scope.showUpdate = false;
			$scope.newSavelistName="";
			$scope.newSavelistDes="";
		}
		
		
		$scope.deleteSavelist = function(listID){
	           
	           swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
	   			text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
	   			type: "warning",   showCancelButton: true,   
	   			confirmButtonColor: "#DD6B55",   
	   			confirmButtonText: "យល់ព្រម",   
	   			cancelButtonText: "បដិសេធ",   
	   			closeOnConfirm: false,   closeOnCancel: false },
	   			function(isConfirm){   
	   			 	if (isConfirm) {     
	   			 		
 	   			 	$http({
     					url:API_ACCESS_CONTROLLER_URL + '/savelist/'+listID,
     					method:'DELETE',
     				}).then(function(response){    
     					/*$scope.callActiveTab('mydoc');*/
     					$('.nav-tabs a[href="#infor"]').tab('show');
     					swal("បានជោគជ័យ!", "បញ្ជីរត្រូវបានលុប", "success"); 
     					$scope.getSavelistMenuUser();
     				}, function(response){
     	             
     	              
     				});	
	   			 	}
	   		 		else {     
	   		 			swal("បានបដិសេធ", "បញ្ជីរបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
	   		 		} 
	   		 	});
			}
		
		
		

		// END NEW SAVELIST FUNCTION UPDATE
     

     //--------End create saveList------------
     
     //--------- getSavelistUser-----------------
     $scope.getSavelistUser=function(){
    	 $scope.enableList=true;
    	if($rootScope.UserID==0 || $rootScope.UserID==null ||$rootScope.UserID =="")
 		{
 			location.href= "/login";
 		}else{
 			$http({
				url:API_ACCESS_CONTROLLER_URL + '/getuserSavelist/'+$rootScope.userID,
				method:'GET'
			}).then(function(response){
				$scope.getuserSavelist=response.data.DATA;
			
			
			}, function(response){

			});	
 		}     	
   	}
     
    	 //   $scope.getSavelistUser();
     
        //---------getSavelistUser----------
    	    $scope.getSavelistMenuUser=function(){
    	    	if($scope.showsavelist == true){
    	    		$scope.showsavelist = false;
    	    	}else{
    	    		$scope.showsavelist = true;
    	    	}
    	    	
    	    	

    			$http({
    				url:API_ACCESS_CONTROLLER_URL + '/getuserSavelistMenu/'+$rootScope.userID,
    				method:'GET'
	    			}).then(function(response){
	    				$scope.getSavelistMenu=response.data.DATA;	
	    			
	    			}, function(response){
	
	    			});	
        		}
     //-----------getSavelistMenuUser---------------//
    	    /*$scope.saveListIDByUser="";
    	    $scope.saveListNameByUser="";
    	    $scope.totalInSaveListByUser="";*/
    	    
    		$scope.getDocumentByEachSavelist=function(savelistID){
    			
    			/*$scope.saveListIDByUser=savelistID;
    			$scope.saveListNameByUser=listName;
    			$scope.totalInSaveListByUser=totalDoc;*/
    			
    			var userID = $rootScope.userID;
    			$http({
    				url:API_ACCESS_CONTROLLER_URL + '/getEachSavelist/'+userID,
    				method:'GET',
    				params: {
    					savelistID : savelistID
    				}
    			
    			}).then(function(response){
    				$scope.getDocumentInSavelist=response.data.DATA[0].SAVELISTDETAIL;
    				$scope.currentClickSavelist=response.data.DATA[0];
    				console.log("get savelist");
    				console.log($scope.currentClickSavelist);
    			}, function(response){

    			});
    		}
     
    //------------getEachSavelist------------------//	
    		$scope.getDocumentByUser=function(docTypeNum){
    		$scope.showsavelist= false;
    		
    		$http({
    			url:API_ACCESS_CONTROLLER_URL + '/document/user/'+$rootScope.userID,
    			method:'GET',
    			params: {
    				docTypeNum : docTypeNum
    			}
    		
    		}).then(function(response){
    			$scope.DocumentUser=response.data.DATA;
    		}, function(response){

    		});
    	}
    	    
    	    
    //------------EndgetEachSavelist---------------//
    //------------deletSavelistDetail--------------//
    		 $scope.deleteSavelistDetail =function(docID){
    	           var listID = $('#listID').val();
    	           
    	           swal({   title: "តើអ្នកពិតជាចង់លុបមែនទេ?",   
    	   			text: "អ្នកនឹងមិនអាចហៅវាមកវិញបានទេ!",   
    	   			type: "warning",   showCancelButton: true,   
    	   			confirmButtonColor: "#DD6B55",   
    	   			confirmButtonText: "យល់ព្រម",   
    	   			cancelButtonText: "បដិសេធ",   
    	   			closeOnConfirm: false,   closeOnCancel: false },
    	   			function(isConfirm){   
    	   			 	if (isConfirm) {     
    	   			 		swal("បានជោគជ័យ!", "ឯកសារត្រូវបានលុប", "success"); 
	    	   			 	$http({
	        					url:API_ACCESS_CONTROLLER_URL + '/savelist/deleteSavelistDetail/'+docID,
	        					method:'DELETE',
	        				}).then(function(response){    					
	        					$scope.getDocumentByEachSavelist(listID);   
	        					$scope.getSavelistMenuUser();
	        				}, function(response){
	        	             
	        	              
	        				});	
    	   			 	}
    	   		 		else {     
    	   		 			swal("បានបដិសេធ", "ឯកសាររបស់អ្នកគឺមានសុវត្ថិភាព :)", "error");   
    	   		 		} 
    	   		 	});
    			}
    //------------EnddeleteSavelistDetail----------//
     
     //-----------EndgetSavelistMenuUser------------//
     
 
	  ///////////////////	END SAVELIST BLOCK	/////////////////
	
	  ///////////////////	START USER BLOCK	/////////////////
	
 $scope.getUserByID=function(){
	 if(!$scope.checkUserLogin()){
		 $http({
				url:API_ACCESS_CONTROLLER_URL + '/user/'+$rootScope.UserID,
				method:'GET'
			}).then(function(response){
				$scope.userInfoByUserID=response.data.DATA;
			
			}, function(response){

			});
			
		}
	} 
    		 	
    		 
 $scope.checkUserLogin = function(){	
	 if($rootScope.UserID==0 || $rootScope.UserID==null ||$rootScope.UserID =="")
		{
			location.href= "/login";
		}
	}
    		 
    
	$scope.saveUser = function(){	

		$http({
			url:API_ACCESS_CONTROLLER_URL + '/user',
			method:'POST',
			data:{
				  'CREATED_DATE': new Date(),
				  'EMAIL': $scope.userEmail,
				  'PASSWORD': $scope.userPassword,
				  'PHONE': $scope.userPhone,
				  'REMARK': "",
				  
				  'STATUS': 1,	
				  'USER_NAME': $scope.userName,
				  'USER_ROLE': "ROLE_USER"
			}
		}).then(function(response){
			swal({  
    				title: "អបអរសាទរ!",   
    				text: "",   
    				timer: 600,   
    				showConfirmButton: false
    			},function(){
    				location.href = "/login";
    			});
			$scope.userName="";
			$scope.userPassword="";
			
		}, function(response){

		});
	}
    

	
		
	
	$scope.error = false;
	$scope.$watch('userPassword',function() {$scope.check();});
	$scope.$watch('userConfirmpassword',function() {$scope.check();});
	
	$scope.check = function() {
	  if ($scope.userPassword !== $scope.userConfirmpassword) {
	    $scope.error = true;
	    } else {
	    $scope.error = false;
	  }
	};
	
	
	///////////////////		END USER BLOCK	/////////////////
	
	
	
	////////////////////	START UPLOAD BLOCK	/////////////////
	
	$scope.checkBeforeUpload = function() {
		if(!$scope.checkUserLogin()){	
			$scope.callModal('upload','show');
			$scope.getAllCategory();
		}
	};
	$scope.theFile = null;
	$scope.catID="";
	$scope.des="";
	$scope.uploadDocument = function(event) {
		if(!$scope.checkUserLogin()){
			$(".upload_waiting").show();
			event.preventDefault();	
			var files = event.target.files;
			var frmData = new FormData();					
			var file = $('#singleUploadDocument')[0].files[0];
			frmData.append("files", file);				
			frmData.append("title", $scope.theFile.name);
			frmData.append("des", $scope.des);
			frmData.append("usreID", $rootScope.userID);		
			frmData.append("catID", $scope.catID);	
			$http({
				url : API_ACCESS_CONTROLLER_URL + '/uploadDocument',
				method :'POST',
				data : frmData,
				transformRequest : angular.identity,
				headers : {
					'Content-Type' : undefined
				}
			}).then(function(response) {
				$(".upload_waiting").hide();
				
				swal(
					  'អបអរសាទរ!',
					  'ឯកសាររបស់អ្នកត្រូវបានចែកចាយបានសម្រេច!',
					  'success'
					)
				
				$scope.getAllDocumentByCatID($rootScope.currentSubCategory);
			}, function(response) {
				$(".upload_waiting").hide();
		
				swal(
					  'សូមសោកស្តាយ!',
					  'ឯកសារចែកចាយមិនបានសម្រេច!\nសូមព្យាយាមម្តងទៀត',
					  'error'
					)				
			});
		}
	};
	
	
	
	$scope.uploadUserProfile = function(event) {
		if(!$scope.checkUserLogin()){
			event.preventDefault();	
			var files = event.target.files;
			var frmData = new FormData();					
			var file = $('#user')[0].files[0];
			frmData.append("files", file);	
			frmData.append("userID", $rootScope.userID);	
			$http({
				url : API_ACCESS_CONTROLLER_URL + '/uploadUserProfile',
				method :'POST',
				data : frmData,
				transformRequest : angular.identity,
				headers : {
					'Content-Type' : undefined
				}
			}).then(function(response) {
				 $scope.getUserByID();
				 location.href= "/userAccount";
			});
			
		}
	};
	
	$scope.checkDocID = function(docID) {
   
    	$rootScope.docUpdateID=docID;
            
    }
	
	$rootScope.docUpdateID="default";
	$scope.uploadDocThumbnail = function(event) {
		
		if(!$scope.checkUserLogin()){
			event.preventDefault();	
			var files = event.target.files;
			var frmData = new FormData();					
			var file = $('#docThumbnail')[0].files[0];
			frmData.append("files", file);	
			frmData.append("docID", $rootScope.docUpdateID);	
			$http({
				url :API_ACCESS_CONTROLLER_URL + '/uploadDocThumbnail',
				method :'POST',
				data : frmData,
				transformRequest : angular.identity,
				headers : {
					'Content-Type' : undefined
				}
			}).then(function(response) {
				$scope.getDocumentByUser();
				
			});
			
		}
	};
	
	
	

	 $scope.trustSrc = function(src){
		 return $sce.trustAsResourceUrl(src);
	 }

	 $scope.escapeUrl = function(url){
    	return escape(url);
	 }
		
	////////////////////	END UPLOAD BLOCK	/////////////////
	
	 $scope.setFile = function(element) {
	        $scope.$apply(function($scope) {
	            $scope.theFile = element.files[0];
	            
	        });
	    };
	    
	    
	// SHARE TO FACEBOOK
	    
    $scope.FBShare = function(docID,thumbnail) {
		var url = UI_PATH + '/' + window.location.pathname;
		 
		 FB.ui({
		   method: 'share',
		   display: 'popup',
		   caption: 'TESTING',
		   href:  url ,
		   picture: thumbnail,
		   
		 }, function(response){
			 if (response && !response.error_code) {
			        /*status = 'success';
			        $.event.trigger('fb-share.success');
			        alert("success");*/
				 $scope.updateTotalShare(docID);

			    } else {
			        /*status = 'error';
			        $.event.trigger('fb-share.error');
			        alert("fail");*/
			    }
		 });	
	};
	
	$scope.updateTotalShare = function(docID) {
		$http({
			url : API_ACCESS_CONTROLLER_URL + '/document/updateShare/'+docID,
			method : 'PUT'
		}).then(function(response) {
			
		}, function(response) {
			
		});
	}
	
	$scope.numFormat = function(num) {
	    isNegative = false
	    if (num < 0) {
	        isNegative = true
	    }
	    num = Math.abs(num)
	    if (num >= 1000000000) {
	        formattedNumber = (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'G';
	    } else if (num >= 1000000) {
	        formattedNumber =  (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
	    } else  if (num >= 1000) {
	        formattedNumber =  (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
	    } else {
	        formattedNumber = num;
	    }   
	    if(isNegative) { formattedNumber = '-' + formattedNumber }
	    return formattedNumber;
	};
	
	$scope.callModal = function(id,option) {
		$('#'+id).modal(option);
	};
	
	$scope.callActiveTab = function(tabID) {
		alert("Active Tab call: "+tabID);
		$('.nav-tabs a[href="#' + tabID + '"]').tab('show');
	};
	

	   
}]);
///////////////////		END MAIN CONTROLLLER FOR USER BLOCK	/////////////////



///////////////////		START FILTER STRING WITH LIMIT LEGNH	/////////////////

app.filter('strLimit', ['$filter', function($filter) {
	   return function(input, limit) {
	     if (! input) return;
	     if (input.length <= limit) {
	          return input;
	      }
	    
	      return $filter('limitTo')(input, limit) + '...';
	   };
	}]);
///////////////////		END FILTER STRING WITH LIMIT LEGNH	/////////////////


app.directive('myEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.myEnter);
                });

                event.preventDefault();
            }
        });
    };
});



