app.controller('heroCtrl', function($scope, $http) {
  $scope.heroes = $http.get('')
});
