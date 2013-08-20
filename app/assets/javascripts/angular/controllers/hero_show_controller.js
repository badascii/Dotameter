app.controller('heroShowCtrl', function($scope, $http, $cookies) {

  $scope.getHeroGraph = function(hero_id, batch) {
    ((typeof batch == 'undefined') ? (batch = 10) : (batch = batch) );
    ((typeof hero_id == 'undefined') ? (hero_id = $cookies.hero_id.to_i) : (hero_id = hero_id.to_i));

    $http.get('/heroes/win_percent_histogram?hero_id=' + hero_id + '&batch=' + batch).success(function(data) {
      $scope.heroWinPercent = data;
      $scope.heroWinPercentError = '';
    }).error(function(data) {
      console.log("There was an error getting the Hero Graph from Rails." + data);
      $scope.heroWinPercentError = 'There was an error. Try refreshing.';
    });
  }();

});
