app.controller('heroShowCtrl', function($scope, $http) {

  $scope.getHeroGraph = function(hero_id, batch) {
    $http.get('/hero/win_percent_histogram?hero_id=' + hero_id + '&batch=' + batch).success(function(data) {
      $scope.heroWinPercent = data;
    }).error(function(data) {
      console.log("There was an error getting the Hero Graph from Rails." + data);
    });
  };

});


//////////THIS NEEDS TO BE MADE REAL!!!!!!!!!
///// IT NEEDS TO GET THE HERO ID FROM THE PAGE!!!!
///// ALSO, IT NEEDS TO GET the BATCH SIZE FROM A DROP DOWN
///// FIXME: NEEDS TO BE BUILT OUT!!
$(document).ready( function() {
  angular.element($('.hero-show')).scope().getHeroGraph(1590, 30);
});

