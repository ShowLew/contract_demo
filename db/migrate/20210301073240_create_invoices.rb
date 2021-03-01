class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.belongs_to :contact
      t.belongs_to :renting_phase

      t.datetime :pay_at, null: false, comment: "交租日"
      t.decimal :phase_money, precision: 20, scale: 2, default: 0.0, comment: "交租阶段总租金"
      t.boolean :paid, default: false, comment: "已经交租？"
      t.datetime :paid_at, null: false, comment: "交租时间"
      t.boolean :whole_month, default: true, comment: "整月？"
      t.integer :day_or_month_count, comment: "月数/天数"

      t.timestamps
    end
  end
end
