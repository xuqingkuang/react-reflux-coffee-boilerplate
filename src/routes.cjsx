React           = require 'react'
ReactRouter     = require 'react-router'
Layout          = require './components/layout'
NotFound        = require './pages/not-found'
Home            = require './pages/home'

{Router, Route, IndexRoute}  = ReactRouter

# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

module.exports = (
  <Router>
    <Route path="/" component={Layout}>
      <IndexRoute component={Home} />
    </Route>
    <Route path="*" component={NotFound} />
  </Router>
)
