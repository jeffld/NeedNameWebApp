


var createQRCode = function () {
    var data = $('#data').val();
    $('#qrcode').empty();
    $('#qrcode').qrcode(data);
    $('#qrcode').append('</br><strong>' + data + '</strong>');
};

$('#data').keyup(createQRCode);
$('#data').change(createQRCode);