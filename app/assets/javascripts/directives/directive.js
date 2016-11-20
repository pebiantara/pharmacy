app.directive("limitTo", [function() {
  return {
    restrict: "A",
    link: function(scope, elem, attrs) {
      var limit = parseInt(attrs.limitTo);
      angular.element(elem).on("keydown", function(e) {
       if(event.keyCode > 47 && event.keyCode < 127) {
         if (this.value.length >= limit) e.preventDefault();
       }
     });
    }
  }
}]);