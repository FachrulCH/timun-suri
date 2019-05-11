class Screens
  def homescreen
    @homescreen ||= WelcomeScreen.new
  end

  def explore
    @explore ||= ExploreScreen.new
  end
end
