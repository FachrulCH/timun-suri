Before do
  driver.start_driver
end

After do |scenario|
  driver.driver_quit
  if scenario.failed?
    p 'Failed euy gan!'
    # TODO: take screenshot device
  end
end
