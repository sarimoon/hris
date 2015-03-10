hrisAngularjs = angular.module('hrisAngularjs', [
	'templates',
	'ngRoute',
	'controllers'
])

hrisAngularjs.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'HomeController'
      )
])

religions = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("HomeController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)
    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.religions = religions.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.religions = []
])