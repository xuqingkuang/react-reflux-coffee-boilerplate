React     = require 'react'
Router    = require 'react-router'
Layout    = require './components/layout'
NotFound  = require './pages/not-found'
Home      = require './pages/home'

{Route, DefaultRoute, NotFoundRoute}  = Router

# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

module.exports = (
  <Route handler={Layout}>
    <Route name="home" handler={Home} path="/" addHandlerKey={true} />
    <DefaultRoute handler={Home} />
    <NotFoundRoute handler={NotFound} />
  </Route>
)
