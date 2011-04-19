require 'watir-webdriver-performance'
require 'watir-webdriver'
b = Watir::Browser.new :chrome
b.goto "altentee.com"
p b.performance
b.close
