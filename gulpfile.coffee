### Load plugins ###
gulp = require "gulp"
webserver = require "gulp-webserver"
protractor = require("gulp-protractor").protractor
runSequence = require "run-sequence"

gulp.task "webserver", ->
  gulp.src("").pipe webserver {host: "localhost", port: "8888"}

gulp.task "protractor", ->
  gulp.src(["./test/e2e/spec/*.js"])
  .pipe protractor {
    configFile: "./test/e2e/config.js",
    args: ["--baseUrl", "http://localhost:8888"]
  }
  .on "error", (e) ->
    throw e
    return

gulp.task "test:e2e", (callback) ->
  runSequence "webserver", "protractor", callback
  return
