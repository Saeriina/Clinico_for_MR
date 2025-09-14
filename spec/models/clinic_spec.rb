require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      clinic = build(:clinic, clinic_name: "aaa", doctor_name: "aaa")
      expect(clinic).to be_valid
      expect(clinic.errors).to be_empty
    end
    it 'クリニック名の文字数が255以下である場合にエラーが起きないか' do
      clinic = build(:clinic, clinic_name: "a" * 255)
      expect(clinic).to be_valid
    end
    it 'クリニック名が空の場合にバリデーションが機能してinvalidになるか' do
      clinic = build(:clinic, clinic_name: nil)
      expect(clinic).to be_invalid
    end
    it 'ドクター名の文字数が255以下である場合にエラーが起きないか' do
      clinic = build(:clinic, doctor_name: "a" * 255)
      expect(clinic).to be_valid
    end
    it 'ドクター名が空の場合にバリデーションが機能してinvalidになるか' do
      clinic = build(:clinic, doctor_name: nil)
      expect(clinic).to be_invalid
    end
    it 'クリニック名の文字数が255より多い場合にlengthのバリデーションが機能してinvalidになるか' do
      clinic = build(:clinic, clinic_name: "a" * 256)
      expect(clinic).to be_invalid
    end
    it 'ドクター名の文字数が255より多い場合にlengthのバリデーションが機能してinvalidになるか' do
      clinic = build(:clinic, doctor_name: "a" * 256)
      expect(clinic).to be_invalid
    end
  end
end
