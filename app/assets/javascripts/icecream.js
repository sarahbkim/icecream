'use strict';

console.log("this is the icecream.js page");
var app = angular.module('icecreamApp', ['ngResource']);

app.factory('iceCreamData', ['$resource', function($resource){

    return $resource('/api/icecream_shops/', {}, {
      query: {method: 'GET', params: {}, isArray: false}

    });
  }])
  .factory('checkInsData', ['$resource', function($resource){

    return $resource('/api/check_ins/', {}, {
      query: {method: 'GET', params: {}, isArray: false}

    })
  }])
  .controller('MainCtrl', ['$scope', 'iceCreamData', function($scope, iceCreamData){
    console.log('mainctrl');

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

    $scope.checkIns = checkInsData.query();
    $scope.checkIns.$promise.then(function(d){
      console.log(d.check_ins);
      return d.check_ins;
    });

  }]);
