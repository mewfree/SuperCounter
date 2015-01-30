Counter = new Mongo.Collection("counter")

if Meteor.isClient
  Template.hello.helpers
    counter: ->
      Counter.findOne({}, {sort: {createdAt: -1}})

  Template.hello.events
    "click button": ->
      Counter.insert({num: Counter.findOne({}, {sort: {createdAt: -1}}).num+1, createdAt: new Date()})

if Meteor.isServer
  Meteor.startup ->
    Counter.insert({num: 0, createdAt: new Date()})

