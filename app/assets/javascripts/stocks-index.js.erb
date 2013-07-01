$(document).ready(function() { 
  getCurrentData();
  drawChart( window.default_stock );
  setInterval(getCurrentData, 15000);
});

function getCurrentData() {
  $.ajax({
    url: 'http://query.yahooapis.com/v1/public/yql?q=select%20symbol%2C%20LastTradePriceOnly%2C%20PercentChange%20from%20yahoo.finance.quotes%20where%20symbol%3D%22' + window.stock_names + '%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=cbcurrent',
    dataType: 'jsonp',
    jsonp: 'callback',
    jsonpCallback: 'cbcurrent'
  });
}

function cbcurrent(data) {
  var total = 0;

  $.each(data.query.results.quote, function(i,item) {
    var purchase_price_td = $('#' + item.symbol + ' td.purchase-price');
    var amount_td         = $('#' + item.symbol + ' td.amount');
    var percent_change_td = $('#' + item.symbol + ' td.percent-change');
    var last_price_td     = $('#' + item.symbol + ' td.last-price');

    var purchase_price    = parseFloat( purchase_price_td.text() );
    var amount            = parseFloat( amount_td.text() );
    var percent_change    = parseFloat( item.PercentChange );
    var last_price        = parseFloat( item.LastTradePriceOnly );

    last_price_td.text( last_price );
    percent_change_td.text( item.PercentChange );

    if ( percent_change > 0 ) {
      percent_change_td.css("color", "green");
    }
    else if ( percent_change < 0 ) {
      percent_change_td.css("color", "red");
    }
    else {
      percent_change_td.css("color", "black");
    }

    total += ( amount * last_price );
  });

  $("#refresh-time").text('Last updated: ' + formatAMPM(new Date()));
  $("#total-value").text(total.toFixed(2));
}

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var seconds = date.getSeconds();
  var ampm = hours >= 12 ? 'PM' : 'AM';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  seconds = seconds < 10 ? '0'+seconds : seconds;
  var strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
  return strTime;
}

function drawChart(symbol) {

  var chart_data = [];
  var chart_data_min = 0;

  var options = {
    title: {
      text: symbol
    },
    rangeSelector: {
      selected: 1,
      buttons: [{
        type: 'day',
        count: 5,
        text: '5d'
      }, {
        type: 'month',
        count: 1,
        text: '1m'
      }, {
        type: 'month',
        count: 3,
        text: '3m'
      }, {
        type: 'month',
        count: 6,
        text: '6m'
      }, {
        type: 'ytd',
        text: 'YTD'
      }, {
        type: 'year',
        count: 1,
        text: '1y'
      }]
    },
    plotOptions: {
      area: {
        fillColor: {
          linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
          stops: [
            [0, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0.5).get('rgba')],
            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
          ]
        },
        lineWidth: 1,
        marker: {
          enabled: false
        },
        shadow: false,
        states: {
          hover: {
              lineWidth: 1
          }
        },
        threshold: null
      }
    },
    series: [{
      type: 'area',
      data: chart_data
    }]
  };

  $("tr").css("background-color", "white");
  $("#" + symbol).css("background-color", "rgba(187, 226, 255, 0.54)");

  $.get('stocks/api?s=' + symbol, function(data) {
    var lines = data.substring(0, data.length - 1).split("\n");

    // Since Highcharts requires that data proceed from oldest to newest,
    // we need to start the iteration at the end of the CSV and work
    // our way back. The iteration stops when i == 0 because we need
    // to exclude the header of the CSV file.

    for (var i = lines.length - 1; i > 0; i--) {
      var line_array = lines[i].split(",");
      var date = Date.parse( line_array[0] );
      var price = parseFloat( line_array[4] );

      chart_data_min = Math.min(chart_data_min, price) || price
      chart_data.push( [date, price] );
    }

    $("#stock_chart").highcharts('StockChart', options);
  });

}

