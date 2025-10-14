require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  before do
    driven_by(:rack_test)
  end
  let(:user) { create(:user) }

  describe 'ログイン' do
    context "フォームの入力値が正常" do
      it '正しい値を入力した場合、ログインできること', js: true do
        visit login_path
        fill_in 'floatingInput', with: user.email
        fill_in 'floatingPassword', with: "password"
        # puts page.body
        # puts "DEBUG: #{user.inspect}"
        click_button 'ログイン'
        expect(page).to have_content "ログインしました"
        expect(current_path).to eq root_path
      end
    end

    context "フォームが未入力" do
      it 'フォームに未入力の場合、ログインできないこと', js: true do
        visit login_path
        # puts "DEBUG: #{user.inspect}"
        fill_in 'floatingInput', with: ""
        fill_in 'floatingPassword', with: "passwprd"
        click_button 'ログイン'
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end
  end

  describe "ログアウト" do
    include LoginMacros
    context "ログアウトボタンをクリック" do
      it 'ログアウトボタンを押した場合、ログアウトできること',js: true do
        login_as(user)
        # puts page.body
        # puts "DEBUG: #{user.inspect}"
        click_button "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq root_path
      end
    end
  end
end
