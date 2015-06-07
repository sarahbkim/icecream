'use strict';

angular.module('icecreamApp')
  .controller('MainCtrl', ['$scope', 'testData', function($scope, testData){
    $scope.data = testData.data;
  }])
  .controller('UserSessionsCtrl', ['$scope', function ($scope) {
  }])
  .controller('UserCtrl', ['$scope', '$stateParams', 'User', function($scope, $stateParams, User){
    // $scope.user = User.users[$stateParams.id];
  }]);