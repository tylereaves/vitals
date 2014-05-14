Meteor.publish "current_values", ->
  CurrentValues.find()
