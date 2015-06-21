'use strict';
angular.module('icecreamApp', ['ngResource'])
  .controller('MainCtrl', ['$scope', 'iceCreamData', function($scope, iceCreamData){

    $scope.findStores = function(store_name, location_query) {
      var store_name = store_name || "",
          location_query = location_query || "";

      $scope.data = iceCreamData.query({store_name: store_name, location: location_query});
      $scope.data.$promise.then(function(d){
        return d;
      });
    };

  }])
  .controller('StatsCtrl', ['$scope', 'checkInsData', function($scope, checkInsData){

    $scope.checkIns = StatsCtrl.query({user_id: user_id});
    $scope.checkIns.$promise.then(function(d){
      return d;
    });

  }])
  .factory('iceCreamData', ['$resource', function($resource){

    return $resource('/api/icecream_shops/', {}, {
      query: {method: 'GET', params: {}, isArray: false}

    });
  }])
  .factory('checkInsData', ['$resource', function($resource){

    return $resource('/api/favorite_shops/', {}, {
      query: {method: 'GET', params: {}, isArray: false}

    })
  }]);
