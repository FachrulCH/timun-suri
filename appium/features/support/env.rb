# frozen_string_literal: true

require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'dotenv'
# require 'parallel'
Dotenv.load

# if ENV['PLATFORM'] == 'ios'
#   caps = Appium.load_appium_txt file: File.join('./ios_appium.txt')
# elsif ENV['PLATFORM'] == 'android'
#   caps = Appium.load_settings file: File.join('./caps_android', 'oreo.txt'), verbose: true
# end

# case ENV['DEVICE']
# when 'nougat'
#   caps = Appium.load_settings file: File.join('./caps_android', 'nougat.txt')
# when 'oreo'
#   caps = Appium.load_settings file: File.join('./caps_android', 'oreo.txt')
# when 'mars'
#   caps = Appium.load_settings file: File.join('./caps_android', 'mars.txt')
# end

desired_caps = {
  caps:       {
    platformName: ENV['PLATFORM_NAME'],
    deviceName: ENV['DEVICE_NAME'],
    automationName: ENV['AUTOMATION_NAME'],
    # platformVersion: ENV[''],
    appPackage: ENV['APP_PACKAGE'],
    appActivity: ENV['APP_ACTIVITY']
    # app:        APP_PATH,
  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object
