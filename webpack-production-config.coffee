webpack           = require 'webpack'
config            = require './webpack-config'

module.exports = Object.assign {}, config,
  entry: [
    './src/app'
  ]
  devtool: 'source-map'
  plugins: [
    new webpack.DefinePlugin
      # This has effect on the react lib size.
      "process.env":
        NODE_ENV: JSON.stringify("production")
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.UglifyJsPlugin()
  ]
