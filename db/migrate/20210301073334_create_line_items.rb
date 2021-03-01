class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :invoice

      t.datetime :begin_at, null: false, comment: "开始日期"
      t.datetime :end_at, null: false, comment: "结束日期"
      t.decimal :phase_money, precision: 20, scale: 2, default: 0.0, comment: "交租阶段总租金"
      t.boolean :whole_month, default: true, comment: "整月？"
      t.integer :day_or_month_count, comment: "月数/天数"
      t.decimal :per_price, precision: 20, scale: 2, default: 0.0, comment: "交租阶段总租金"

      t.timestamps
    end
  end
end
