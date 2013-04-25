require 'capybara'
require 'capybara/cucumber'
require 'capybara-webkit'
require 'capybara/webkit'
Capybara.default_driver = :webkit
# Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 5