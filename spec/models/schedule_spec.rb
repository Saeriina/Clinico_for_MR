require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "バリデーションチェック" do
    it "設定したすべてのバリデーションが機能しているか" do
      schedule = build(:schedule)
      expect(schedule).to be_valid
    end

    it "アポ日程（appointment_date）が無い場合にバリデーションが機能してinvalidになるか" do
      schedule = build(:schedule, appointment_date: nil)
      expect(schedule).to be_invalid
    end

    it "アポ時間(scheduled_time)が無い場合にバリデーションが機能してinvalidになるか" do
      schedule = build(:schedule, scheduled_time: nil)
      expect(schedule).to be_invalid
    end

    it "アポ日程(appointment_date)が255文字より多い場合にバリデーションが機能してinvalidになるか" do
      schedule = build(:schedule, scheduled_time: "a" * 256)
      expect(schedule).to be_invalid
    end
  end
end
