'use strict';
angular.module('icecreamApp', [])
  .factory('testData', [ function(){
    // service body
    var data = [1, 2, 3, 4];
    return data;
  }])
  .factory('User', [ function(){
    var user = {'name': 'Sarah'};
    return user;
  }])
  .controller('MainCtrl', ['$scope', 'testData', function($scope, testData){
    $scope.data = testData.data;
  }])
  .controller('UserSessionsCtrl', ['$scope', function ($scope) {
  }])
  .controller('UserCtrl', ['$scope', '$stateParams', 'User', function($scope, $stateParams, User){
    // $scope.user = User.users[$stateParams.id];
  }]);