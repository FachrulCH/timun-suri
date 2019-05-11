class ExploreScreen < Appom::Page
  element :input_search, :id, 'action_bar_search_edit_text'
  element :image_group, :id, 'media_group'
  elements :feed_photo, :id, 'row_feed_photo_imageview'
  elements :search_result, :id, 'com.instagram.android:id/row_hashtag_textview_tag_name'
  elements :list_images, :xpath, '//android.widget.ListView[@resource-id="android:id/list"]//android.widget.ImageView'

  def search(something)
    input_search.type something.to_s
    # Appom.driver.press_keycode 66 # enter
    Appom.driver.press_keycode 160 # enter
    sleep 2
    # search_result.first.click
    swipe_up
  end
end
