# # Load all required libraries.
gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
browserify = require 'browserify'
browserSync = require('browser-sync').create()
fs = require 'fs'
watch = require 'gulp-watch'
minify = require 'gulp-minify'


swallowError = (error) ->
  console.log "ERROR", error.toString
  @emit 'end'

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe coffee bare: true
    .on 'error', swallowError
    .pipe gulp.dest './js/'

gulp.task 'browserify', ['coffee'], ->
	browserify 'js/main.js', {debug: true, standalone: 'MIModel'}
	.bundle()
	.pipe fs.createWriteStream 'resources/public/dist/mi-model.js'

gulp.task 'watch-src', ['serve'], ->
  gulp.watch("./src/**/*", ['coffee', 'browserify'])


gulp.task 'dist-watch', ['browserify'], (done) ->
  browserSync.reload()
  done()

gulp.task 'compress', ->
  gulp.src "./resources/public/dist/mi-model.js"
    .pipe minify
      ext:
          src: ".js",
          min: ".min.js"
          ignoreFiles: [".min.js"]
    .pipe gulp.dest './resources/public/dist'

gulp.task 'serve', ['browserify'], ->
  gulp.watch("resources/public/dist/*.js", ['dist-watch'])
	browserSync.init
		server: "./resources/public"

gulp.task 'default', ['coffee', 'browserify', 'watch-src', 'serve']
