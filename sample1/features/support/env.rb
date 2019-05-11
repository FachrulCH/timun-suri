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
    appActivity: ENV['APP_ACTIVITY'],
    app:        ENV['APP_PATH'],
    newCommandTimeout: '3600'
  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object

# clear report files
report_root = File.absolute_path('./report')
if ENV['REPORT_PATH'].nil?
  # remove report directory when run localy,
  # ENV report will initiate from rakefile, or below this
  puts ' ========Deleting old reports ang logs========='
  FileUtils.rm_rf(report_root, secure: true)
end
ENV['REPORT_PATH'] ||= Time.now.strftime('%F_%H-%M-%S')
ENV['OUTPUT_PATH'] = "#{report_root}/#{ENV['REPORT_PATH']}"
FileUtils.mkdir_p ENV['OUTPUT_PATH']
