require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe "バリデーションチェック" do
    it "すべての条件を満たす場合、有効である" do
      submission = build(:submission)
      expect(submission).to be_valid
    end

    context "必須項目のpresence: true" do
      it "titleがnilの場合、無効である" do
        submission = build(:submission, title: nil)
        expect(submission).to be_invalid
      end

      it "descriptionがnilの場合、無効である" do
        submission = build(:submission, description: nil)
        expect(submission).to be_invalid
      end

      it "due_dateがnilの場合、無効である" do
        submission = build(:submission, due_date: nil)
        expect(submission).to be_invalid
      end
    end

    context "文字数制限のlength: { maximum: 255 }" do
      it "titleが255文字を超える場合、無効である" do
        submission = build(:submission, title: "a" * 256)
        expect(submission).to be_invalid
      end

      it "descriptionが255文字を超える場合、無効である" do
        submission = build(:submission, description: "a" * 256)
        expect(submission).to be_invalid
      end
    end
  end
end
