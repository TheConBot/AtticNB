$(function() {

    $("#jsGrid").jsGrid({
        height: "auto",
        width: "100%",

        filtering: true,
        sorting: true,
        paging: true,
        autoload: true,
        editing: false,

        pageSize: 10,
        pageButtonCount: 5,
        
        controller: {
            loadData: function (filter) {
                var d = $.Deferred();
                return $.ajax({
                    type: "GET",
                    url: "Gridlet",
                    dataType: "json"
                    }).done(function(response){
                        d.resolve(response.value);
                });
                return d.promise();
            }
        },

        fields: [
            { name: "Nickname", type: "text", width: 150 },
            { name: "House Number", type: "number", width: 50 },
            { name: "Street Name", type: "text", width: 100 },
            { name: "Street Suffix", type: "text", width: 100 },
            { name: "City", type: "text", width: 100 },
            { name: "State", type: "text", width: 50 },
            { name: "Zip Code", type: "number", width: 75 },
            { name: "Floors", type: "number", width: 50 }
            //{ name: "Rooms", type: "number", width: 50 }
        ]
    });
});