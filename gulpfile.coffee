# gulp modules
gulp                    = require 'gulp'
gulpMinifyHTML          = require 'gulp-minify-html'

# webpack modules
webpack                 = require 'webpack'
webpackDevMiddleware    = require 'webpack-dev-middleware'
webpackHotMiddleware    = require 'webpack-hot-middleware'
webpackConfig           = require './webpack-config'
webpackProductionConfig = require './webpack-production-config'

# Others
path                    = require 'path'
express                 = require 'express'
del                     = require 'del'

devCompiler             = webpack(webpackConfig)

config =
  port: 8000
  host: 'localhost'
  minifyHTML:
    comments: yes
    spare: yes
  devServer:
    noInfo: yes
    publicPath: webpackConfig.output.publicPath

#
# Development tasks
#

gulp.task "dev-server", (callback) ->
  app = express()
  app.use webpackDevMiddleware devCompiler, config.devServer
  app.use webpackHotMiddleware devCompiler
  app.get '*', (req, res) ->
    res.sendFile(path.join(path.join(__dirname, "assets/#{req.url}")))
  app.listen config.port, config.host, (err) ->
    return console.error err if err?
    console.log("Listening at http://#{config.host}:#{config.port}");

#
# Production tasks
#
gulp.task 'minify', ->
  gulp.src('assets/**/*.html')
    .pipe(gulpMinifyHTML(config.minifyHTML))
    .pipe(gulp.dest(webpackConfig.output.path))

gulp.task "build", (callback) ->
  webpack webpackProductionConfig, (err, stats) ->
    throw "webpack:build - #{err}" if err?
    console.log "[webpack:build]", stats.toString(colors: true)
    callback()

# Common tasks
gulp.task 'copy-assets', ->
  gulp.src(['assets/**']).pipe(gulp.dest(webpackConfig.output.path))

gulp.task 'clean', (done) -> del ["#{webpackConfig.output.path}/*"], done
gulp.task 'default', ['dev-server']
gulp.task 'production', [ 'copy-assets', 'build', 'minify']
