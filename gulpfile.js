/*global require, console, process*/
var gulp = require("gulp");
var gutil = require("gulp-util");
var bower = require("bower");
var concat = require("gulp-concat");
var sass = require("gulp-sass");
var coffee = require("gulp-coffee");
var minifyCss = require("gulp-minify-css");
var rename = require("gulp-rename");
var sh = require("shelljs");

//Add for testing
require("coffee-script");
require("coffee-script/register");
require("./gulpfile.coffee");

var paths = {
  sass: ["./scss/**/*.scss"],
  coffee: ["./www/**/*.coffee"]
};

gulp.task("default", ["sass"]);

gulp.task("sass", function(done) {
  "use strict";
  gulp.src("./scss/ionic.app.scss")
    .pipe(sass({
      errLogToConsole: true
    }))
    .pipe(gulp.dest("./www/css/"))
    .pipe(minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(rename({ extname: ".min.css" }))
    .pipe(gulp.dest("./www/css/"))
    .on("end", done);
});

gulp.task("coffee", function(done) {
  "use strict";
  gulp.src(paths.coffee)
  .pipe(coffee({bare: true})
    .on("error", gutil.log.bind(gutil, "Coffee Error")))
  .pipe(concat("application.js"))
  .pipe(gulp.dest("./www/js"))
  .on("end", done);
});

gulp.task("watch", function() {
  "use strict";
  gulp.watch(paths.sass, ["sass"]);
  gulp.watch(paths.coffee, ["coffee"]);
});

gulp.task("install", ["git-check"], function() {
  "use strict";
  return bower.commands.install()
    .on("log", function(data) {
      gutil.log("bower", gutil.colors.cyan(data.id), data.message);
    });
});

gulp.task("git-check", function(done) {
  "use strict";
  if (!sh.which("git")) {
    console.log(
      "  " + gutil.colors.red("Git is not installed."),
      "\n  Git, the version control system, is required to download Ionic.",
      "\n  Download git here:", gutil.colors.cyan("http://git-scm.com/downloads") + ".",
      "\n  Once git is installed, run \"" + gutil.colors.cyan("gulp install") + "\" again."
    );
    //process.exit(1);
    throw "error";
  }
  done();
});
