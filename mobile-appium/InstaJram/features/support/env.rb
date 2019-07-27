require 'rspec/expectations'
require 'appium_lib'
require 'pry'
# require 'pry-nav'
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
  noReset: true,
  unicodeKeyboard: true,
  resetKeyboard: true
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

# clear report files
report_root = File.absolute_path('./report')

if ENV['REPORT_PATH'].nil?
  # remove report directory when run localy,
  # ENV report will initiate from rakefile, or below this
  puts ' ========Deleting old reports ang logs========='
  FileUtils.rm_rf(report_root, secure: true)
end

ENV['REPORT_PATH'] ||= Time.now.strftime('%F_%H-%M-%S')
path = "#{report_root}/#{ENV['REPORT_PATH']}"
FileUtils.mkdir_p path
