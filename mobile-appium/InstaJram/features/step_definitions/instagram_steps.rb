Given 'user is opening Instagram homescreen' do
  p 'masuk gan'
  @screens.homescreen.menu_likes.click

  # binding.pry
end

Given 'user searching for following data:' do |tables|
  tableWithKeys = tables.hashes
  pp tableWithKeys
  @screens.homescreen.menu_explore.click
  @screens.explore.search tableWithKeys[0][:keywords]
  # binding.pry
  # puts tableWithKeys[0][:keywords]
  # puts tableWithKeys[0][:numer_of_likes]
end

Given 'user open explore' do
  @screens.homescreen.menu_explore.click
  @screens.explore.list_images.first.click
  binding.pry
end
