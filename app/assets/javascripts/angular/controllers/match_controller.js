app.controller('matchCtrl', function($scope, $http) {

  $scope.matches = $http.get('/matches').success(function(data) {
    $scope.matches = data;
  });

  $scope.getMatch = function(matchID) {
    $http.get('/matches/' + matchID).success(function(data) {
      console.log('success!');
      $scope.showMatch = data;
    });
  };

  // $scope.showMatch = function(){getMatch};

});