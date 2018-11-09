function simulateQRCodeScan() {



    // get values
    var memberid = $("#data").val();

    var strDateTime = "";
    strDateTime = moment().format('YYYYMMDDHHMMSS');

    var postURL = "ajax/AddQRCodeScan.aspx?memberid=" + memberid + "&refreshnow=" + strDateTime;

    //alert(postURL);

    // Add record
    $.post(postURL, {
        username: memberid,
        cache: false,
        async: false
    }, function (data, status) {

        var ArrData = data.split(",");

        if (ArrData[0] === "Y") {
            $("#result").html("Submitted QR Code: " + memberid  + " for " + ArrData[1] +  " at " + strDateTime);
        }
        else {
            $("#result").html("QR Code: " + memberid + " Not Found!");
        }

    });



    

    //window.location.href = "myappointments.aspx";
}