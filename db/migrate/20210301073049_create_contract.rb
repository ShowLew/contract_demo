class CreateContract < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.datetime :begin_at, null: false, comment: "开始日期"
      t.datetime :end_at, null: false, comment: "结束日期"
      t.decimal :total_money, precision: 20, scale: 2, default: 0.0, comment: "合同总金额"
      t.decimal :month_money, precision: 20, scale: 2, default: 0.0, comment: "月租金"
      t.integer :phase, null: false, comment: "交租周期"
      t.datetime :first_pay_at, null: false, comment: "第一次交租时间"

      t.timestamps
    end
  end
end
