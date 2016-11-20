app.controller("customersController", ['$scope', '$http', 'Customer', '$routeParams', '$location',
	function($scope, $http, Customer, $routeParams, $location) {

  Customer.all(function(resp){
    $scope.customers = resp;
  })
}]);