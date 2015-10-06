Reflux = require('reflux')
EventActions = require('../actions/events')

module.exports = Reflux.createStore
  listenables: [EventActions]

  onGet: () ->
    items = @get(key)
    @trigger items

  onPost: (item) ->
    items = @get(key)
    items = [] unless?
    items.push(item)
    @set(key, items)
    @trigger items

  onPut: (items) ->
    @set(key, items)
    @trigger items
  
  onDelete: (event) ->
    no
