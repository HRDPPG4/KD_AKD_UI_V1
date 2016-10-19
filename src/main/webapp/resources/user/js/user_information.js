 
	       var myApp = angular.module('myApp',[]);
	       function mycontrol($scope) {
	           $scope.stepsModel = [];

	           $scope.imageUpload = function(element){
	               var reader = new FileReader();
	               reader.onload = $scope.imageIsLoaded;
	               reader.readAsDataURL(element.files[0]);
	           }

	           $scope.imageIsLoaded = function(e){
	               $scope.$apply(function() {
	                   $scope.stepsModel.push(e.target.result);
	               });
	           }
	       }
	       	