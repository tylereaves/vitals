Template.home.helpers
  hosts: ->
    Hosts.find({}, {sort: {a: 1}})
  formatNum: (value) ->
    value.toFixed(1)
  formatPct: (value) ->
    value.toFixed(1) + "%"
  formatDate: (value) ->
    moment(value).format('YYYY-MM-DD hh:mm:ss')


window.getDataSeries = (start_date, end_date, host, val) ->
  c = DailyStats.find({"h": host, "d": {"$gte": start_date, "$lte": end_date}}, {sort: {"d": 1}, reactive: false})
  return c.map((doc) ->
    return [Date.parse(doc["d"]), doc[val]])

Template.home.rendered = ->
  window.doChart(this)

Template.home.ListObj = (value) ->
  console.log(value)
  _.keys(value)

