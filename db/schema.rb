# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_01_093122) do

  create_table "contracts", charset: "utf8", force: :cascade do |t|
    t.datetime "begin_at", null: false, comment: "开始日期"
    t.datetime "end_at", null: false, comment: "结束日期"
    t.decimal "total_money", precision: 20, scale: 2, default: "0.0", comment: "合同总金额"
    t.decimal "month_money", precision: 20, scale: 2, default: "0.0", comment: "月租金"
    t.integer "phase", null: false, comment: "交租周期"
    t.datetime "first_pay_at", null: false, comment: "第一次交租时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", charset: "utf8", force: :cascade do |t|
    t.bigint "contract_id"
    t.bigint "renting_phase_id"
    t.datetime "pay_at", null: false, comment: "交租日"
    t.decimal "phase_money", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.boolean "paid", default: false, comment: "已经交租？"
    t.datetime "paid_at", null: false, comment: "交租时间"
    t.boolean "whole_month", default: true, comment: "整月？"
    t.integer "day_or_month_count", comment: "月数/天数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_invoices_on_contract_id"
    t.index ["renting_phase_id"], name: "index_invoices_on_renting_phase_id"
  end

  create_table "line_items", charset: "utf8", force: :cascade do |t|
    t.bigint "invoice_id"
    t.datetime "begin_at", null: false, comment: "开始日期"
    t.datetime "end_at", null: false, comment: "结束日期"
    t.decimal "phase_money", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.boolean "whole_month", default: true, comment: "整月？"
    t.integer "day_or_month_count", comment: "月数/天数"
    t.decimal "per_price", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
  end

  create_table "renting_phases", charset: "utf8", force: :cascade do |t|
    t.bigint "contract_id"
    t.datetime "pay_at", null: false, comment: "交租日"
    t.decimal "phase_money", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "begin_at"
    t.datetime "end_at"
    t.index ["contract_id"], name: "index_renting_phases_on_contact_id"
  end

end
