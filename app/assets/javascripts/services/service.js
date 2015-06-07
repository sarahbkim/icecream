'use strict';

angular.module('icecreamApp')
  .factory('testData', [ function(){
    // service body
    var data = [1, 2, 3, 4];
    return data;
  }])
  .factory('User', [ function(){
    var user = {'name': 'Sarah'};
    return user;
  }])