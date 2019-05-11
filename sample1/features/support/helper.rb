# def screenshot(png_file_name, error = false)
#   p 'taking screenshoot'
#   report_path = ENV['OUTPUT_PATH']
#   # binding.pry
#   png_file_name = png_file_name.strip.gsub(/\s/, '_')
#   time = Time.now.strftime '%H_%M_%S'
#   file_name = "#{time}_#{png_file_name}"
#   screenshot_save_file = File.join(report_path, "#{file_name}.png")
#   driver.screenshot_as screenshot_save_file
#   FileUtils.cp(screenshot_save_file, ENV['OUTPUT_PATH']) if error
#   xml_save_file = File.join(report_path, "#{file_name}.dom")
#   dump_xml(xml_save_file, error)
# end

# def dump_xml(xml_save_file, error = false)
#   open(xml_save_file, 'w') do |f|
#     f.puts driver.get_source
#   end
#   FileUtils.cp(xml_save_file, ENV['OUTPUT_PATH']) if error
# end

def wait_for
  Selenium::WebDriver::Wait.new(timeout: 10).until { yield }
end
