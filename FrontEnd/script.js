var refresh = function() {
    console.log('refresh');

    $.get(
        "http://localhost:3000/count",
        function(response) {
            $('#people_count').text(response.count);
        }
    );
    /*
    {
        [
            {
                count:3
            },
            {
                count:34
            },
        ]
    }
    */
};