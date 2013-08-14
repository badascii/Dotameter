app.controller('matchCtrl', function($scope, $http, $cookies) {

  $scope.heroes = $http.get('/heroes').success(function(data) {
    $scope.heroes = data;
  });

  $scope.match = $http.get('/matches/' + $cookies.match_id ).success(function(data) {
    $scope.match = enrichMatchDataWithHeroes(data);
  });

  // adds hero_url and hero_name to player object
  var enrichMatchDataWithHeroes = function(data) {
    for (var i = 0, max = data.players.length; i < max; i++) {
      var thisPlayer = data.players[i];

      for (var j = 0, total = $scope.heroes.length; j < total; j++) {
        var thisHero = $scope.heroes[j];

        if (thisPlayer.hero_id == thisHero.valve_id) {
          thisPlayer['hero_name'] = thisHero.name;
          thisPlayer['hero_url'] = thisHero.url;
        }
      }
    }
    return data;
  };

});
