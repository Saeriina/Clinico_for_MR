require 'rails_helper'

RSpec.describe AvailableTime, type: :model do
  describe "バリデーションチェック" do
    it "すべてのバリデーションを満たす場合、有効である" do
      available_time = build(:available_time)
      expect(available_time).to be_valid
    end

    context "必須項目のチェック" do
      it "weekdayが無い場合、無効である" do
        available_time = build(:available_time, weekday: nil)
        expect(available_time).to be_invalid
      end

      it "available_time_slotが無い場合、無効である" do
        available_time = build(:available_time, available_time_slot: nil)
        expect(available_time).to be_invalid
      end
    end
  end
end
