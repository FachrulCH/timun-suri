require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'pry-nav'
require 'appom'
require 'dotenv'
Dotenv.load

appium_lib_options = {
  server_url: 'http://0.0.0.0:4723/wd/hub'
}

caps = {
  deviceName: ENV['DEVICE_NAME'],
  automationName: ENV['AUTOMATION_NAME'],
  platformName: ENV['PLATFORM_NAME'],
  platformVersion: ENV['PLATFORM_VERSION'],
  appPackage: ENV['APP_PACKAGE'],
  appActivity: ENV['APP_ACTIVITY'],
  app: ENV['APP_PATH'],
  newCommandTimeout: 3600,
  noReset: true
}

Appom.register_driver do
  options = {
    appium_lib: appium_lib_options,
    caps: caps
  }
  Appium::Driver.new(options, false)
end

Appom.configure do |config|
  config.max_wait_time = 10
end
