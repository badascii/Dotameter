app.controller('heroCtrl', function($scope, $http) {

  // Initialize display arrays
  $scope.radiantAgi = [];
  $scope.radiantStr = [];
  $scope.radiantInt = [];
  $scope.direAgi = [];
  $scope.direStr = [];
  $scope.direInt = [];

  $scope.heroes = $http.get('/heroes').success(function(data) {
    // Set the heroes var.
    $scope.heroes = data;

    // Loop through each of these Heroes, pushing them into the correct arrays to display them in.
    for (var i = 0, max = data.length; i < max; i++) {
      var thisObj = data[i];
      // Radiant Chars
      if(thisObj.radiant_team === true) {
        // push these objects onto the Radiant strength, Agility, Intelligence array
        switch(thisObj.primary_stat) {
          case 'agi':
            // Push onto the Radiant Agility array.
            $scope.radiantAgi.push(thisObj);
            break;
          case 'str':
            // Push onto the Radiant Strength array.
            $scope.radiantStr.push(thisObj);
            break;
          case 'int':
            // Push onto the Radiant Intelligence array.
            $scope.radiantInt.push(thisObj);
            break;
        }
      } else { // Dire Chars
        // push these objects onto the Dire strength, Agility, Intelligence array
        switch(thisObj.primary_stat) {
          case 'agi':
            // Push onto the Dire Agility array.
            $scope.direAgi.push(thisObj);
            break;
          case 'str':
            // Push onto the Dire Strength array.
            $scope.direStr.push(thisObj);
            break;
          case 'int':
            // Push onto the Dire Intelligence array.
            $scope.direInt.push(thisObj);
            break;
        }
      }
    }
  });

});