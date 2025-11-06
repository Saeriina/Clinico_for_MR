require 'rails_helper'

RSpec.describe VisitInterval, type: :model do
  describe "バリデーションチェック" do
    it "すべての条件を満たす場合、有効である" do
      visit_interval = build(:visit_interval)
      expect(visit_interval).to be_valid
    end

    context "intervalのpresence: true" do
      it "intervalがnilの場合、無効である" do
        visit_interval = build(:visit_interval, interval: nil)
        expect(visit_interval).to be_invalid
      end
    end

    context "intervalの数値制約" do
      it "整数でない場合、無効である" do
        visit_interval = build(:visit_interval, interval: 10.5)
        expect(visit_interval).to be_invalid
      end

      it "0以下の場合、無効である" do
        visit_interval = build(:visit_interval, interval: 0)
        expect(visit_interval).to be_invalid
      end

      it "360を超える場合、無効である" do
        visit_interval = build(:visit_interval, interval: 361)
        expect(visit_interval).to be_invalid
      end
    end
  end
end
