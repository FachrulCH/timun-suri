# !/usr/bin/env ruby
def mouse_hover(elmt)
  element = Capybara.page.driver.browser.find_element(:css, elmt)
  Capybara.page.driver.browser.mouse.move_to element
end

# def take_screenshot
#   p 'taking sceenshot'
#   encoded_img = Capybara.page.driver.browser.screenshot_as(:base64)
#   embed("data:image/png;base64,#{encoded_img}", 'image/png', "Taken at: #{Capybara.page.driver.current_url}")
# end

def take_screenshot(name_file, folder = 'report/screenshots')
  file = "#{folder}/#{name_file}.png"
  FileUtils.mkdir_p(folder) unless File.exist?(folder)
  Capybara.page.driver.browser.save_screenshot(file)
end

def take_screenshot_and_crop(name_file, css_element_crop, folder = 'report/screenshots/croped_files')
  file = "#{folder}/#{name_file}.png"
  FileUtils.mkdir_p(folder) unless File.exist?(folder)
  # scroll to element
  element = Capybara.page.driver.browser.find_element(:css, css_element_crop)
  element.location_once_scrolled_into_view

  # get location and size of element
  location = element.location
  size = element.size

  # take original screenshot
  take_screenshot('image_to_crop')

  # read original screenshot
  image = ChunkyPNG::Image.from_file('report/screenshots/image_to_crop.png')

  # get X, Y, width and height
  left = location['x']
  top = location['y']
  right = size['width']
  bottom = size['height']
  p [left, top, right, bottom]
  new_image = image.flip_horizontally.rotate_right

  # crop original image and save
  # crop original image
  # if OS.mac?
  #   image.crop!(left * 2, top * 2, right * 2, bottom * 2)
  # else
  image.crop!(left, top, right, bottom)
  # end
  image.save(file)
end

def visual_match(actual, expected)
  imchr = Imatcher::Matcher.new threshold: 0.05, mode: :grayscale
  base_path = File.expand_path('.', Dir.pwd) + '/screenshots/'
  file_atual = File.join(base_path, 'current_images/') + actual + '.png'
  file_baseline = File.join(base_path, 'baseline/') + expected + '.png'
  file_diff = File.join(base_path, 'diffs/') + actual + '_diff_' + expected + '.png'
  comparison = imchr.compare(file_atual, file_baseline)
  @score = comparison.score
  p @score
  comparison.difference_image.save(file_diff) if comparison.match? != true
  expect(comparison.match?).to be true
end
