app.controller("productsController", ['$scope', '$http', 'Product', function($scope, $http, Product) {

  Product.all(function(resp){
    $scope.products = resp;
  })
}]);