require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
require 'date'
require 'time'
require 'allure-cucumber'
require_relative '../config/reader/config_reader'

include Capybara::DSL
include RSpec::Matchers

RSpec.configure { |config| config.include Capybara::DSL, type: :feature }

#https://www.youtube.com/watch?v=k8YrTR4NI-0
Capybara.configure do |config|
  config.app_host = ConfigReader.prod_url  #sets the base URL for the application being tested
  config.default_selector = :xpath
  config.default_max_wait_time = ConfigReader.wait_time    #sets the maximum amount of time to wait for an element to appear on the page
  config.default_driver = :selenium
  config.default_normalize_ws = true  #normalize white spaces
end

#https://github.com/allure-examples/allure-cucumber-example/blob/master/features/support/env.rb
AllureCucumber.configure do |config|
  config.results_directory = 'output/allure-results'  #test results go to this dir
  config.clean_results_directory = true #which causes the directory to be cleaned before each test run
end

