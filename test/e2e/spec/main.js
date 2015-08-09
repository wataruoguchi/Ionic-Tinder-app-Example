/*global describe, beforeEach, browser, it, expect, $*/
describe("gulp-protractor-sample", function() {
  "use strict";
  beforeEach(function() {
    browser.get(browser.baseUrl);
  });
  it("myName is John", function() {
    expect($(".me").getText()).toBe("John");
  });
});
