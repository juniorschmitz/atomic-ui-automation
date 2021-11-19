# frozen_string_literal: true

require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'cucumber'
require 'rspec'
require 'faker'
require 'net/http'
require 'uri'

ENVIRONMENT = ENV['ENVIRONMENT']
ENVIRONMENT_CONFIG = YAML.load_file(File.dirname(__FILE__) + "/environment/#{ENVIRONMENT}.yml")
URL = ENVIRONMENT_CONFIG['url']
BROWSER = ENV['BROWSER'].to_sym

Capybara.register_driver :selenium do |app|
  case BROWSER
  when :chrome
    caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => { 'args' => ['--ignore-ssl-errors', '--ignore-certificate-errors', '--disable-popup-blocking',
                                                                                                 '--disable-gpu', '--disable-translate', '--start-maximized', '--incognito', '--no-sandbox', '--acceptInsecureCerts=true', '--window-size=1420,835',
                                                                                                 '--disable-impl-side-painting', '--debug_level=3'] })
    if ENV['HEADLESS']
      caps['goog:chromeOptions']['args'] << '--headless'
      caps['goog:chromeOptions']['args'] << '--disable-site-isolation-trials'
    end
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 90
    options = { browser: :chrome, desired_capabilities: caps, http_client: client }
  else
    raise 'Browser not found'
  end

  puts 'Raising driver'
  Capybara::Selenium::Driver.new(app, options)
end

Capybara.default_driver        = :selenium
Capybara.app_host              = URL
Capybara.default_max_wait_time = 10
