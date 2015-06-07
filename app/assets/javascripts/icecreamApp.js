'use strict';

angular.module('icecreamApp', ['ui.router', 'ng-token-auth'])
  .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: '/home.html', 
        controller: 'MainCtrl'
      })
      .state('login', {
        url: '/login',
        templateUrl: '/login.html', 
        controller: 'UserSessionsCtrl'
      })
      .state('signup', {
        url: '/signup',
        templateUrl: '/signup.html',
        controller: 'UserCtrl'
      })
      .state('user', {
        url: '/user/{id}',
        templateUrl: '/profile.html',
        controller: 'UserCtrl'
      })
      .state('about', {
        url: '/about',
        templateUrl: '/about.html',
        controller: 'UserCtrl'
      });

    $urlRouterProvider.otherwise('home');
  }])
