class WelcomeScreen < Appom::Page
  element :menu_home, :xpath, '//android.widget.LinearLayout[@resource-id="com.instagram.android:id/tab_bar"]/android.widget.FrameLayout[1]'
  element :menu_explore, :xpath, '//android.widget.LinearLayout[@resource-id="com.instagram.android:id/tab_bar"]/android.widget.FrameLayout[2]'
  element :menu_likes, :xpath, '//android.widget.LinearLayout[@resource-id="com.instagram.android:id/tab_bar"]/android.widget.FrameLayout[4]'
  element :menu_profile, :xpath, '//android.widget.LinearLayout[@resource-id="com.instagram.android:id/tab_bar"]/android.widget.FrameLayout[5]'
  # element :menu_like, :xpath, '//android.widget.FrameLayout[@content-desc="Aktivitas"]'
  # element :menu_home, :xpath, '//android.widget.FrameLayout[@content-desc="Beranda"]'
  elements :loveit, :xpath, '//android.widget.ImageView[@resource-id="com.instagram.android:id/row_feed_button_like"]'
  elements :group_actions, :accessibility_id, 'com.instagram.android:id/row_feed_view_group_buttons'
  elements :group_actions_like, :accessibility_id, 'row_feed_button_like'
end
