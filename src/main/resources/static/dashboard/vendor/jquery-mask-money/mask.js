$(document).ready(function () {
    $("#valorSolicitado").maskMoney({showSymbol: true, symbol: 'R$ ', thousands: '.', decimal: ','});
    $("#valorTotal").maskMoney({showSymbol: true, symbol: 'R$ ', thousands: '.', decimal: ','});
});