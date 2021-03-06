# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "account", primary_key: "account_id", force: true do |t|
    t.string  "product_cd",         limit: 10, null: false
    t.integer "cust_id",                       null: false
    t.date    "open_date",                     null: false
    t.date    "close_date"
    t.date    "last_activity_date"
    t.string  "status",             limit: 6
    t.integer "open_branch_id",     limit: 2
    t.integer "open_emp_id",        limit: 2
    t.float   "avail_balance",      limit: 24
    t.float   "pending_balance",    limit: 24
  end

  add_index "account", ["cust_id"], name: "fk_a_cust_id", using: :btree
  add_index "account", ["open_branch_id"], name: "fk_a_branch_id", using: :btree
  add_index "account", ["open_emp_id"], name: "fk_a_emp_id", using: :btree
  add_index "account", ["product_cd"], name: "fk_product_cd", using: :btree

  create_table "branch", primary_key: "branch_id", force: true do |t|
    t.string "name",    limit: 20, null: false
    t.string "address", limit: 30
    t.string "city",    limit: 20
    t.string "state",   limit: 2
    t.string "zip",     limit: 12
  end

  create_table "business", primary_key: "cust_id", force: true do |t|
    t.string "name",        limit: 40, null: false
    t.string "state_id",    limit: 10, null: false
    t.date   "incorp_date"
  end

  create_table "customer", primary_key: "cust_id", force: true do |t|
    t.string "fed_id",       limit: 12, null: false
    t.string "cust_type_cd", limit: 1,  null: false
    t.string "address",      limit: 30
    t.string "city",         limit: 20
    t.string "state",        limit: 20
    t.string "postal_code",  limit: 10
  end

  create_table "department", primary_key: "dept_id", force: true do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "employee", primary_key: "emp_id", force: true do |t|
    t.string  "fname",              limit: 20, null: false
    t.string  "lname",              limit: 20, null: false
    t.date    "start_date",                    null: false
    t.date    "end_date"
    t.integer "superior_emp_id",    limit: 2
    t.integer "dept_id",            limit: 2
    t.string  "title",              limit: 20
    t.integer "assigned_branch_id", limit: 2
  end

  add_index "employee", ["assigned_branch_id"], name: "fk_e_branch_id", using: :btree
  add_index "employee", ["dept_id"], name: "fk_dept_id", using: :btree
  add_index "employee", ["superior_emp_id"], name: "fk_e_emp_id", using: :btree

  create_table "individual", primary_key: "cust_id", force: true do |t|
    t.string "fname",      limit: 30, null: false
    t.string "lname",      limit: 30, null: false
    t.date   "birth_date"
  end

  create_table "officer", primary_key: "officer_id", force: true do |t|
    t.integer "cust_id",               null: false
    t.string  "fname",      limit: 30, null: false
    t.string  "lname",      limit: 30, null: false
    t.string  "title",      limit: 20
    t.date    "start_date",            null: false
    t.date    "end_date"
  end

  add_index "officer", ["cust_id"], name: "fk_o_cust_id", using: :btree

  create_table "product", primary_key: "product_cd", force: true do |t|
    t.string "name",            limit: 50, null: false
    t.string "product_type_cd", limit: 10, null: false
    t.date   "date_offered"
    t.date   "date_retired"
  end

  add_index "product", ["product_type_cd"], name: "fk_product_type_cd", using: :btree

  create_table "product_type", primary_key: "product_type_cd", force: true do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "transaction", primary_key: "txn_id", force: true do |t|
    t.datetime "txn_date",                       null: false
    t.integer  "account_id",                     null: false
    t.string   "txn_type_cd",         limit: 3
    t.float    "amount",              limit: 53, null: false
    t.integer  "teller_emp_id",       limit: 2
    t.integer  "execution_branch_id", limit: 2
    t.datetime "funds_avail_date"
  end

  add_index "transaction", ["account_id"], name: "fk_t_account_id", using: :btree
  add_index "transaction", ["execution_branch_id"], name: "fk_exec_branch_id", using: :btree
  add_index "transaction", ["teller_emp_id"], name: "fk_teller_emp_id", using: :btree

end
