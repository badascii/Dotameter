$(window).load(function() {

  var data = angular.element($('.hero-show')).scope().heroWinPercent;
  // data.push(100);
  // var data = [0.5,2.2,3.2,4.2,5.2,6.2,7.2,7.2,6.2,10.2];
  // var data = [1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2];


  var margin = 0,
      h = 100,
      w = 400;

  console.log(d3.max(data));

  // The domain is the set of all first elements of ordered pairs (x-coordinates).
  var x = d3.scale.linear().domain([0, data.length]).range([0 + margin, w - margin]);
  // The range is the set of all second elements of ordered pairs (y-coordinates).
  // FIXME: d3.max can be re-factored to operate on a specific attribute of data, this means we can put the node meta data back in.
  var y = d3.scale.linear().domain([d3.min(data), d3.max(data)]).range([0 + margin, h - margin]);

  // Creates the d3 SVG element in the page.
  var winPercentGraph = d3.select('.win-percent-graph')
    .append("svg:svg")
    .attr("width", w)
    .attr("height", h);

  // Creates a grouping with which to put all the points inside.
  var group = winPercentGraph.append("svg:g")
    .attr("transform", "translate(0, " + h + ")");

  // Defines a function to return properly formatted svg path nodes.
  var line = d3.svg.line()
    .x(function(d,i) { return x(i); })
    .y(function(d) { return - 1 * y(d); });

  // Appends a SVG path to the group. There is some implicit iteration here.
  group.append("svg:path")
    .attr("d", line(data));


  group.append("svg:line")
    .attr("x1", x(0))
    .attr("y1", -1 * y(0))
    .attr("x2", x(w))
    .attr("y2", -1 * y(0));

  group.append("svg:line")
    .attr("x1", x(0))
    .attr("y1", -1 * y(0))
    .attr("x2", x(0))
    .attr("y2", -1 * y(d3.max(data)));

});