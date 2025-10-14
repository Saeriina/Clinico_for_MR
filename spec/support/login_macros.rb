module LoginMacros
  def login_as(user)
    visit login_path
    fill_in 'floatingInput', with: user.email
    fill_in 'floatingPassword', with: "password"
    click_button 'ログイン'
  end
end
