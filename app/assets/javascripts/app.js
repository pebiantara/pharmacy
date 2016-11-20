app = angular.module('pharmacy', ['ngResource', 'templates', 'ngRoute', 'angular-loading-bar', 
	'chieffancypants.loadingBar', 'ngAnimate']);

app.config(['$routeProvider', '$locationProvider', '$httpProvider', 'cfpLoadingBarProvider', '$sceDelegateProvider', function($routeProvider, $locationProvider, $httpProvider, $cfpLoadingBarProvider, $sceDelegateProvider){
	$locationProvider.html5Mode(true)
	$cfpLoadingBarProvider.includeSpinner = false;
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

  $routeProvider.when('/', {
    templateUrl: 'products/index.html',
    controller: 'productsController'
  }).when('/products', {
    templateUrl: 'products/index.html',
    controller: 'productsController'
  }).when('/customers', {
    templateUrl: 'customers/index.html',
    controller: 'customersController'
  }).otherwise({
    redirectTo: '/'
  });
}
]);