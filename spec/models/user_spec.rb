require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do
	  it "設定したすべてのバリデーションが機能しているか" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

		it "ユーザーネーム(name)が無い場合にバリデーションが機能してinvalidになるか" do
		  user_without_name = build(:user, name: "")
		  expect(user_without_name).to be_invalid
		end

		it "メールアドレス(email)が無い場合にバリデーションが機能してinvalidになるか" do
		  user_without_email = build(:user, email: "")
		  expect(user_without_email).to be_invalid
		end

		it "パスワード(password)が無い場合にバリデーションが機能してinvalidになるか" do
		  user_without_password = build(:user, password: "")
		  expect(user_without_password).to be_invalid
		end

		it "確認用パスワード(password_confirmation)が無い場合にバリデーションが機能してinvalidになるか" do
		  user_without_password_confirmation = build(:user, password_confirmation: "")
		  expect(user_without_password_confirmation).to be_invalid
		end

		it "メールアドレス(email)が重複している場合にバリデーションが機能してinvalidになるか" do
			create(:user, email: "test@example.com")
		  duplicate_user = build(:user, email: "test@example.com")
		  expect(duplicate_user).to be_invalid
		end

		it "ユーザーネームが255文字より多い場合にバリデーションが機能してinvalidになるか" do
		  user = build(:user, name: "a" * 256)
		  expect(user).to be_invalid
		end

		it "パスワードが3文字より少ない場合にバリデーションが機能してinvalidになるか" do
		  user = build(:user, password: "aa")
		  expect(user).to be_invalid
		end
	end
end
