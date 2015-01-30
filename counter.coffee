Counter = new Mongo.Collection("counter")

if Meteor.isClient
  Template.hello.helpers
    counter: ->
      Counter.findOne({})

  Template.hello.events
    "click button": ->
      Counter.update({}, {$inc: {num: 1}})

if Meteor.isServer
  Meteor.startup ->
    Counter.insert({num: 0})

