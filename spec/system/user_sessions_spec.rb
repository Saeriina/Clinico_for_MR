require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  before do
    driven_by(:rack_test)
  end
  let(:user) { create(:user) }

  describe 'ログイン' do
    context "フォームの入力値が正常" do
      it '正しい値を入力した場合、ログインできること' do
        visit login_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        # puts page.body
        click_button 'login-submit'
        expect(page).to have_content "ログインしました"
        expect(current_path).to eq root_path
      end
    end

    context "フォームが未入力" do
      it 'フォームに未入力の場合、ログインできないこと' do
        visit login_path
        # puts "DEBUG: #{user.inspect}"
        fill_in 'user_email', with: ""
        fill_in 'user_password', with: user.password
        click_button 'login-submit'
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end
  end

  describe "ログアウト" do
    include LoginMacros
    context "ログアウトボタンをクリック" do
      it 'ログアウトボタンを押した場合、ログアウトできること' do
        login_as(user)
        # puts "DEBUG: #{user.inspect}"
        click_button "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq root_path
      end
    end
  end
end
