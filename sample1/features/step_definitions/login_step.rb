Given 'I open the app' do
  p ' Pertamax gan'
  sleep 2
end

When 'I login with invalid cred' do
  # binding.pry
  # button('LOGIN').click
  find_element(:xpath, "//android.widget.TextView[@text='LOGIN']").click
  sleep 2
  Screenshot.capture_screenshot
  # find_element(:id, '').click
end
