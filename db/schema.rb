# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210301073334) do

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "begin_at", null: false, comment: "开始日期"
    t.datetime "end_at", null: false, comment: "结束日期"
    t.decimal "total_money", precision: 20, scale: 2, default: "0.0", comment: "合同总金额"
    t.decimal "month_money", precision: 20, scale: 2, default: "0.0", comment: "月租金"
    t.integer "phase", null: false, comment: "交租周期"
    t.datetime "first_pay_at", null: false, comment: "第一次交租时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "contact_id"
    t.bigint "renting_phase_id"
    t.datetime "pay_at", null: false, comment: "交租日"
    t.decimal "phase_money", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.boolean "paid", default: false, comment: "已经交租？"
    t.datetime "paid_at", null: false, comment: "交租时间"
    t.boolean "whole_month", default: true, comment: "整月？"
    t.integer "day_or_month_count", comment: "月数/天数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_invoices_on_contact_id"
    t.index ["renting_phase_id"], name: "index_invoices_on_renting_phase_id"
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "renting_phases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "contact_id"
    t.datetime "pay_at", null: false, comment: "交租日"
    t.decimal "phase_money", precision: 20, scale: 2, default: "0.0", comment: "交租阶段总租金"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_renting_phases_on_contact_id"
  end

end
