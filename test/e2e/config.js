/*global exports*/
exports.config = {
  seleniumServerJar: "../../node_modules/gulp-protractor/" + "node_modules/protractor/selenium/selenium-server-standalone-2.45.0.jar",
  capabilities: {
    browserName: "chrome"
  },
  framework: "jasmine",
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
};
