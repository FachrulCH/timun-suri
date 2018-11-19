Given(/^user is on login page$/) do
  # visual_match 'container', 'container'
  @login_page = LoginPage.new
  @login_page.load
  @login_page.wait_until_txt_username_visible
end

When(/^login as invalid username$/) do
  @login_page.txt_username.send_keys 'cucok meyong'
  sleep 3
  take_screenshot_and_crop 'container', '.container'
  expect('container.png').to be_visual_match('container')
end

Then(/^password field should not show up$/) do
  expect(@login_page.has_no_txt_password?).to be true
end

When(/^login as "(.*)" with password "(.*)"$/) do |username, paswd|
  @login_page.login_as username, paswd
end

Then(/^show alert "(.*)"$/) do |text|
  expect(@login_page.alert.text).to include text
end

Then (/^user should be redirected to admin dashboard page$/) do
  @admin_page = AdminDashbordPage.new
  expect(@admin_page.current_url).to include 'admin.php'
  expect(@admin_page).to have_side_menu
end
