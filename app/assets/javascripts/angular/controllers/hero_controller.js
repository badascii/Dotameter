app.controller('heroCtrl', function($scope, $http) {

  $scope.heroes = $http.get('/heroes').success(function(data) {
    $scope.heroes = data;
  });

  // $scope.thisHero = $http.get('/heroes/' + )

  // $scope.getThisHero = function(heroID) {
  //   $scope.thisHero = $http.get('/heroes/' + heroID + '.json').success(function(data) {
  //     $scope.thisHero = data;
  //     console.log(data);
  //   });
  // };
});
