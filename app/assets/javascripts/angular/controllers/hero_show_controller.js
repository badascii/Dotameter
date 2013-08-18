app.controller('heroShowCtrl', function($scope, $http) {

  // Needs to call get '/hero/win_percent_histogram?hero_id='BLAH'
  $scope.getHeroGraph = function(hero_id) {
    $http.get('/hero/win_percent_histogram?hero_id=' + hero_id).success(function(data) {
      $scope.heroWinPercent = data;
    }).error(function(data) {
      console.log("There was an error getting the Hero Graph from Rails." + data);
    });
  };


});

$(document).ready( function() {
  angular.element($('.hero-show')).scope().getHeroGraph(1590);
});

