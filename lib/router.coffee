Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/",
    waitOn: ->
      [Meteor.subscribe("current_values")]
  #Meteor.subscribe("hosts")
    data: ->
      current_values: CurrentValues.find()
    onData: ->
      if this.ready()
        window.doChart({data: this.data()})


Router.onBeforeAction('loading');