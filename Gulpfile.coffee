# # Load all required libraries.
gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
browserify = require 'browserify'
browserSync = require('browser-sync').create()
fs = require 'fs'
watch = require 'gulp-watch'
livereload = require 'gulp-livereload'


gulp.task 'browser-sync', ->
	browserSync.init
		server: baseDir: "./"



gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe coffee bare: true
    .pipe gulp.dest './js/'

gulp.task 'browserify', ->
	browserify 'js/entry.js', {debug: true, standalone: 'MICircle'}
	.bundle()
	.pipe fs.createWriteStream 'dist/micircle.js'

gulp.task 'stream', ->
	gulp.watch './src/**/*.coffee', ['coffee', 'browserify']

gulp.task 'watch', ['browserify'], ->
  watcher = gulp.watch './dist/**/*'

gulp.task 'refresh', ['browserify'], browserSync.reload

gulp.task 'default', ['stream', 'coffee', 'browserify', 'browser-sync']
