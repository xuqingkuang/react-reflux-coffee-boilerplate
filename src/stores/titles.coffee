Reflux        = require('reflux')
TitleActions  = require('../actions/titles')

titles = [
  'React Reflux Boilerplate',
  'React',
  'Reflux',
  'Coffee'
  'Boilerplate'
];

module.exports = Reflux.createStore
  init: ->
    @listenTo(TitleActions.nextTitle, @getNextTitle)

  getInitialState: -> {title: titles[0]}

  getNextTitle: (currentTitle) ->
    next = titles.indexOf(currentTitle)
    next += 1
    next = 0 if next is titles.length
    @trigger {title: titles[next]}
