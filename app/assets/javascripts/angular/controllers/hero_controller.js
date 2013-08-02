app.controller('heroCtrl', function($scope, $http) {

  $scope.heroes = $http.get('/heroes').success(function(data) {
    $scope.heroes = data;
  });
});
