function chart(start_date, end_date, host, id) {
  $('#' + id).highcharts({
    chart: {
      type: 'line',
      zoomType: 'x'
    },
    title: {
      text: host
    },
    plotOptions: {
      line: {
        animation: false
      }
    },
    xAxis: {
      'type': 'datetime'
    },
    yAxis: {
      title: {
        text: 'Usage (%)'
      }
    },
    series: [
      {
        name: 'CPU',
        data: window.getDataSeries(start_date, end_date, host, "cpu")
      },
      {
        name: 'Mem',
        data: window.getDataSeries(start_date, end_date, host, "mem")
      },
      {
        name: 'Disk',
        data: window.getDataSeries(start_date, end_date, host, "disk")
      },
    ]
  });
}

window.doChart = function (e) {
  sd = e.data.start_date;
  ed = e.data.end_date;
  $("div.chart").each(function (i, elem) {
    elem = $(elem)
    id = elem.attr("id");
    host = elem.attr("rel");
    chart(sd, ed, host, id);
  });
}