class LoginPage < SitePrism::Page
  set_url "/po-admin"

  element :txt_username,'#login-username'
  element :txt_password, '#login-password'
  element :btn_login, '#btn-login'
  element :alert, ".alert.alert-warning"
  
  def login_as(username, password)
    txt_username.send_keys [username, ' ']
    wait_for_txt_password
    txt_password.set password
    btn_login.click
  end
end
