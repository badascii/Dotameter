app.controller('matchCtrl', function($scope, $http, $cookies) {


  var enrichMatchDataWithHeroes = function(data) {
    for (var i = 0, max = data.players.length; i < max; i++) {
      var thisPlayer = data.players[i];
      // console.log($scope.heroes);

      for (var j = 0, maximum = $scope.heroes.length; j < maximum; j++) {
        var thisHero = $scope.heroes[j];

        if (thisPlayer.hero_id == thisHero.valve_id) {
          console.log(thisHero.valve_id);
          thisPlayer.push(
            { 'hero_name' : thisHero.name,
              'hero_url'  : thisHero.url
            } );
        }
      }
    }
    return data;
  };

  $scope.match = $http.get('/matches/' + $cookies.match_id ).success(function(data) {
    console.log(data);
    $scope.match = enrichMatchDataWithHeroes(data);
  });

  $scope.heroes = JSON.parse(sessionStorage.heroes);

  // console.log($scope.heroes[0]);

});