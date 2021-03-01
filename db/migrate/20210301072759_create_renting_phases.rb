class CreateRentingPhases < ActiveRecord::Migration[5.1]
  def change
    create_table :renting_phases do |t|
      t.belongs_to :contact

      t.datetime :pay_at, null: false, comment: "交租日"
      t.decimal :phase_money, precision: 20, scale: 2, default: 0.0, comment: "交租阶段总租金"

      t.timestamps
    end
  end
end
