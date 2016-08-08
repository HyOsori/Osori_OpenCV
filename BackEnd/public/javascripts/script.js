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

var data = new Array;
var refresh = function() {
    console.log("aaaa");
    $.get(
        "http://192.168.0.12:3000/count",
        function (response) {
            $('#people_count').text(response[response.length-1].num);
        }
    );
    new Chart(document.getElementById("canvas").getContext("2d")).Line(drawGraph());
}

var submit = function(){
    var d = new Date();
    var date = d.getHours() +"h" + d.getMinutes() + "m" + d.getSeconds() + "s";
    var obj = new Object();
    obj.date = date;
    obj.comment = document.insert.comment.value;
    var json_data = JSON.constructor(obj);
    var request = $.ajax({
        url: "http://192.168.0.12:3000/",
        type: "POST",
        data: json_data,
        dataType: "json"
    });

    request.done(function (data) {
         $('#board').text(data.comment);
    })


};


var drawGraph = function(){
    var arr = new ArrayBuffer(5);
    for (var i = 0; i < 5; i++) {
        arr[i] = (Math.floor(Math.random() * 10) + 1);
     //   console.log(arr[i]);
    }
    var myData = {
        labels : ["1h","2h","3h","4h","5h"],
        datasets : [
            {
                fillColor : "rgba(90,190,90,.5)",
                strokeColor : "rgba(90,190,90,1)",
                pointColor : "rgba(90,190,90,1)", 
                pointStrokeColor : "#fff",
                data : [arr[0],arr[1],arr[2],arr[3],arr[4]]
                }
            ]
        };
    return myData;
};

/**
 * Created by OhSo on 2016-07-23.
 */





// refreshData();
//
// new Chart(document.getElementById("canvas").getContext("2d")).Line(myData);