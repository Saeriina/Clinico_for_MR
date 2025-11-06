require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "バリデーションチェック" do
    it "すべてのバリデーションを満たす場合、有効である" do
      product = build(:product)
      expect(product).to be_valid
    end

    context "必須項目のバリデーション" do
      it "product_nameが無い場合、無効である" do
        product = build(:product, product_name: nil)
        expect(product).to be_invalid
      end

      it "diagnosisが無い場合、無効である" do
        product = build(:product, diagnosis: nil)
        expect(product).to be_invalid
      end

      it "product_numberが無い場合、無効である" do
        product = build(:product, product_number: nil)
        expect(product).to be_invalid
      end
    end

    context "文字数制限のバリデーション" do
      it "product_nameが255文字を超える場合、無効である" do
        product = build(:product, product_name: "a" * 256)
        expect(product).to be_invalid
      end

      it "diagnosisが255文字を超える場合、無効である" do
        product = build(:product, diagnosis: "a" * 256)
        expect(product).to be_invalid
      end

      it "product_numberが255文字を超える場合、無効である" do
        product = build(:product, product_number: "a" * 256)
        expect(product).to be_invalid
      end
    end
  end
end
