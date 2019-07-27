def swipe(start_x, end_x, start_y, end_y)
  opts = { start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y, duration: 600 }
  action = Appium::TouchAction.new(Appom.driver).swipe(opts)
  action.perform
end

# going down
def swipe_up
  width = Appom.driver.window_size[:width]
  height = Appom.driver.window_size[:height]
  start_x = width * 50 / 100 # 50%
  start_y = height * 90 / 100
  end_y = height * 10 / 100
  swipe start_x, start_x, start_y, end_y
end

# going up
def swipe_down
  width = Appom.driver.window_size[:width]
  height = Appom.driver.window_size[:height]
  start_x = width * 50 / 100 # 50%
  start_y = height * 10 / 100
  end_y = height * 90 / 100
  swipe start_x, start_x, start_y, end_y
end

def double_click(access_type, access_value)
  element = Appom.driver.find_element(:"#{access_type}" => access_value.to_s)
  action.double_click(element).perform
end

def single_tap(access_type, access_value)
  element = Appom.driver.div(:"#{access_type}" => access_value.to_s)
  element.touch_action(:tap)
end
