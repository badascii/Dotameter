app.controller('matchCtrl', function($scope, $http, $cookies) {

  $scope.match = $http.get('/matches/' + $cookies.match_id ).success(function(data) {
    $scope.match = data;
    console.log(data);
  });



});