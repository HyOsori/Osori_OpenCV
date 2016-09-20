// var refresh = function() {
//     console.log('refresh');
//
//     $.get(
//         "http://localhost:3000/count",
//         function(response) {
//             $('#people_count').text(response[11].num);
//         }
//     );
// }

var data_length = 10;
var data = [];

for(var i = 0; i < data_length; ++i)
    data.push({index:i, num:0});

var refresh = function() {
    console.log("aaaa");
    $.get(
        // "http://192.168.0.12:3000/count",
        "http://localhost:3000/count",
        function (response) {
            console.log('response.length : ' + response.length);

            for(var i = 0; i < data_length; ++i) {
                data[i].index = i;
                data[i].num = response[response.length - data_length - 1 + i].num;
            }

            //console.log('data : ' + JSON.stringify(data, null, 4));

            $('#people_count').text(data[data.length - 1].num);

            InitChart(data);
        }
    );
};

var submit = function(){
    var d = new Date();
    var date = d.getHours() +"h" + d.getMinutes() + "m" + d.getSeconds() + "s";
    var obj = new Object();
    obj.date = date;
    obj.comment = document.insert.comment.value;

    console.log('submit : ' + obj.comment);

    var json_data = JSON.constructor(obj);
    var request = $.ajax({
        // url: "http://192.168.0.12:3000/",
        url:"http://localhost:3000/",
        type: "POST",
        data: json_data,
        dataType: "json"
    });

    request.done(function (data) {
        console.log("request.done : " + data.comment);
         $('#board').text(data.comment);
    })


};


var drawGraph = function(){
    var myData = {
        labels : ["1h","2h","3h","4h","5h"],
        datasets : [
            {
                fillColor : "rgba(90,190,90,.5)",
                strokeColor : "rgba(90,190,90,1)",
                pointColor : "rgba(90,190,90,1)", 
                pointStrokeColor : "#fff",
                data : data
                }
            ]
        };
        console.log("draw graph");
    return myData;
};

/**
 * Created by OhSo on 2016-07-23.
 */



function InitChart(data) {
    console.log('data : ' + JSON.stringify(data));

    var wrapper = d3.select('#wrapper');

    wrapper.select('svg').remove();

    var vis = wrapper.append('svg');

    var WIDTH = 900,
        HEIGHT = 200,
        MARGINS = {
            top: 20,
            right: 20,
            bottom: 20,
            left: 50
        },
        xScale = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([0, data_length - 1]),
        yScale = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([0, 15]),
        xAxis = d3.svg.axis()
            .scale(xScale)
            .ticks(data_length),

        yAxis = d3.svg.axis()
            .scale(yScale)
            .orient("left");

    vis.attr('width', WIDTH);
    vis.attr('height', HEIGHT);

    var area = d3.svg.area()
        .x(function(d) { return xScale(d.index);})
        .y0(yScale(0))
        .y1(function(d){ return yScale(d.num); })
        .interpolate("basis");

    vis.append("svg:g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + (HEIGHT - MARGINS.bottom) + ")")
        .attr("fill", "#A6A6A6")
        // .attr("stroke", "#777")
    // shape-rendering: crispEdges;
        .call(xAxis);

    vis.append("svg:g")
        .attr("class", "y axis")
        .attr("transform", "translate(" + (MARGINS.left) + ",0)")
        .attr("fill", "#A6A6A6")
        .call(yAxis);

    vis.append("path")
        .datum(data)
        .attr("class", "area")
        .attr("d", area);


    var lineGen = d3.svg.line()
        .x(function(d) {
            return xScale(d.index);
        })
        .y(function(d) {
            return yScale(d.num);
        })
        .interpolate("basis");

    vis.append('svg:path')
        .attr('d', lineGen(data))
        .attr('stroke-width', 2)
        .attr('fill','none');
        // .attr('fill', '#e7e7e7');

}


refresh();
InitChart(data);


// refreshData();
//
// new Chart(document.getElementById("canvas").getContext("2d")).Line(myData);