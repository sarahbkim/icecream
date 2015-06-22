'use strict';

var app = angular.module('icecreamApp', [ 'ngResource', 'nvd3ChartDirectives', 'services', 'controllers']),
    services = angular.module('services', ['ngResource']),
    controllers = angular.module('controllers', []);

services.factory('iceCreamData', ['$resource', function($resource){

    return $resource('/api/icecream_shops/', {}, {
      query: {method: 'GET', params: {}, isArray: false}

    });
  }])
  .factory('checkInsData', ['$resource', function($resource){

    return $resource('/api/check_ins/', {}, {
      query: {
        method: 'GET',
        params: {},
        isArray: false,
        transformResponse: function(data, headers){
          var jsonData = JSON.parse(data),
              nvd3Data = {},
              counts = [];

          jsonData.check_ins.forEach(function(d){
            counts.push([d.date, d.count]);
          });

          nvd3Data['counts'] = counts;

          return nvd3Data;
        }
      }
    });

  }]);

controllers.controller('MainCtrl', ['$scope', 'iceCreamData', function($scope, iceCreamData){

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

    $scope.checkIns = checkInsData.query({});
    $scope.checkIns.$promise.then(function(d){
      $scope.checkInCounts = [{"key": "Check Ins", "values": $scope.checkIns.counts}];

      $scope.test = [{"key": "Test", "values": [[1, 2], [2, 3], [3, 10]]}];

    });

    $scope.xFunction = function() {
      return function(d, i){
        return i;
      }
    };

    $scope.xAxisTickFormat = function(d){
       if(typeof $scope.checkIns.counts[d] !== 'undefined') {
          return $scope.checkIns.counts[d][0];
       }

	 };

  }]);
