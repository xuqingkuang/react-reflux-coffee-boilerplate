path              = require 'path'
webpack           = require 'webpack'

module.exports =
  entry: [
    # FIXME: hot middleware is buggy for Coffee, reload should canceled
    #        after it works with Coffee, but you can have a try to remove it.
    # FIXME: After reload set to false, the redbox-react could be install
    #        for error prompts.
    'webpack-hot-middleware/client?reload=true'
    './src/app'
  ]
  devtool: "eval"
  debug: yes
  output:
    path: path.join(__dirname, 'public')
    publicPath: '/'
    filename: 'bundle.js'
  resolveLoader:
    modulesDirectories: ['node_modules']
  plugins: [
    new webpack.HotModuleReplacementPlugin()
    new webpack.NoErrorsPlugin()
  ]
  resolve:
    extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']
  module:
    loaders: [
      {test: /.*\.json$/, loader: 'json'}
      {test: /\.jpe?g$|\.gif$|\.png$|\.svg$|\.woff$|\.ttf$|\.wav$|\.mp3$/, loader: "file-loader"}
      {test: /\.(cjsx|coffee)$/, loaders: ['coffee', 'cjsx']}
    ]
