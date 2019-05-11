Before do
  @screens = Screens.new
end

After do |scenario|
  p 'Stelah itu semua'
  pp scenario
  if scenario.failed?
    p 'Scenario failed euy :('
    report_root = File.absolute_path('./report')

    Appom.driver.save_viewport_screenshot("#{report_root}/#{ENV['REPORT_PATH']}/#{scenario.__id__}.png")
    embed("#{report_root}/#{ENV['REPORT_PATH']}/#{scenario.__id__}.png", 'image/png', 'SCREENSHOT')
    # encoded_img = Appom.driver.screenshot_as(:base64)
    # embed("data:image/png;base64,#{encoded_img}", 'image/png', "----- Take screenshoot on: #{scenario.__id__} -----")
    p "FAILED ==> #{scenario.feature.name} => #{scenario.name}"
  else
    p "PASSED ==> #{scenario.feature.name} => #{scenario.name}"
  end
end
