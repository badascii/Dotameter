app.controller('heroShowCtrl', function($scope, $http) {

  // Needs to call get '/hero/win_percent_histogram?hero_id='BLAH'
  var getHeroGraph = function(hero_id) {
    $http.get('/hero/win_percent_histogram?hero_id=' + ).success(function(data) {
      console.log(data);
    }).error(function(data) {
      console.log(data);
    });
  }


});

$(document).ready( function() {

});