@HostAgg = new Meteor.Collection "hostagg"

@HostAgg.allow
  insert: () ->
    false
  update: () ->
    false
  remove: () ->
    false 