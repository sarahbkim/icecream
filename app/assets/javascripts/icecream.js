'use strict';
angular.module('icecreamApp', ['ngResource'])
  .controller('MainCtrl', ['$scope', 'iceCreamData', function($scope, iceCreamData){
    $scope.findStores = function(store_name, location_query) {
      var store_name = store_name || "",
          location_query = location_query || "";

      $scope.data = iceCreamData.query({store_name: store_name, location: location_query}, function(data){
        $scope.data = data;
      });
    };
  }])
  .factory('iceCreamData', ['$resource', function($resource){
    return $resource('/api/icecream_shops/', {}, {
      query: {method: 'GET', params: {}, isArray: false}
    });
  }]);
