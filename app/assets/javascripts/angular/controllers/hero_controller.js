app.controller('heroCtrl', function($scope, $http) {

  // Initialize display arrays
  $scope.radiantAgi = [];
  $scope.radiantStr = [];
  $scope.radiantInt = [];
  $scope.direAgi = [];
  $scope.direStr = [];
  $scope.direInt = [];

  // Initialize empty Character name for the Header
  $scope.characterName = 'Choose a Character';


  // This function populates the heroes scope.
  $scope.heroes = $http.get('/heroes').success(function(data) {
    // Set the heroes var.
    $scope.heroes = data;
    // Adds heroes into session storage for accessibility in matches#show
    sessionStorage.heroes = data;
    setHeroArrays(data);
  }).error(function(data) {
    console.log('Rails is not returning /heroes.');
  });

  // This function will loop through the json passed to it pushing it onto the correct
  // array based on its .radiant_team.
  var setHeroArrays = function(data) {
    // Loop through each of these Heroes, pushing them into the correct display arrays.
    for (var i = 0, max = data.length; i < max; i++) {
      var thisObj = data[i];
      // Radiant Chars
      if(thisObj.radiant_team === true) {
        // push these objects onto the Radiant strength, Agility, Intelligence array.
        switch(thisObj.primary_stat) {
          case 'agi':
            // Push onto the Radiant Agility array.
            inGroupsOf(thisObj, $scope.radiantAgi, 4);
            break;

          case 'str':
            // Push onto the Radiant Strength array.
            inGroupsOf(thisObj, $scope.radiantStr, 4);
            break;

          case 'int':
            // Push onto the Radiant Intelligence array.
            inGroupsOf(thisObj, $scope.radiantInt, 4);
            break;
        }
      } else { // Dire Chars
        // Push these objects onto the Dire strength, Agility, Intelligence array.
        switch(thisObj.primary_stat) {

          case 'agi':
            // Push onto the Dire Agility array.
            inGroupsOf(thisObj, $scope.direAgi, 4);
            break;

          case 'str':
            // Push onto the Dire Strength array.
            inGroupsOf(thisObj, $scope.direStr, 4);
            break;

          case 'int':
            // Push onto the Dire Intelligence array.
            inGroupsOf(thisObj, $scope.direInt, 4);
            break;
        }
      }
    }
  };


  // When called, will make a nested array of arrays containing objects.
  // The length of the groupings is determined by the groups variable.
  // Data is the thing to attach.
  // Receiver will receive the data.
  // Groups determines the length of the second level arrays.
  var inGroupsOf = function(data, receiver, groups) {
    // FIXME: error handling for incorrectly called function, ie. Not enough arguments.
    // If the receiver was recently initialized and is empty
    if (receiver.length === 0) {
      // Push on an empty array
      receiver.push([]);
      // Push the data onto the end of that array (the last array)
      receiver[receiver.length - 1].push(data);
    } else {
      // If the receiver's last array is already full of data
      if (receiver[receiver.length - 1].length % groups === 0) {
        // Push a new array onto the end of the receiver
        receiver.push([]);
        // Append the data into the last array of the receiver
        receiver[receiver.length - 1].push(data);
      }
      else {
        // Append the data into the last array of the receiver
        receiver[receiver.length - 1].push(data);
      }
    }
  };

  // redirects to hero show page when hero img is clicked
  $scope.showHero = function($event) {
    $(location).attr('href', $($event.target).attr('data-heroUrl'));
  };

  // Is attached to all characters on the index page. Will toggle on mouseOver/mouseOut
  $scope.toggleCharDetails = function($event) {
    // Set heroBox to the jquery selector of what was clicked
    var heroBox = $($event.target);
    if ($scope.characterName == heroBox.attr('data-heroName')) {
      $scope.characterName = 'Choose a character';
    } else {
      // Replace the character Name with this characters name.
      $scope.characterName = heroBox.attr('data-heroName');
    }
  };
});
