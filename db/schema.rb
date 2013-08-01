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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130801080304) do

  create_table "account_details", :force => true do |t|
    t.integer  "user_id",        :precision => 38, :scale => 0,                   :null => false
    t.string   "user_name"
    t.integer  "direction",      :precision => 38, :scale => 0,                   :null => false
    t.decimal  "money",          :precision => 12, :scale => 2,                   :null => false
    t.string   "relatable_type",                                                  :null => false
    t.integer  "relatable_id",   :precision => 38, :scale => 0,                   :null => false
    t.integer  "description",    :precision => 38, :scale => 0
    t.string   "remark"
    t.boolean  "is_valid",       :precision => 1,  :scale => 0, :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_details", ["description"], :name => "i_account_details_description"
  add_index "account_details", ["direction"], :name => "account_details_direction"
  add_index "account_details", ["user_id"], :name => "i_account_details_user_id"
  add_index "account_details", ["user_name"], :name => "i_account_details_user_name"

  create_table "account_subjects", :force => true do |t|
    t.string "name"
    t.text   "remark"
  end

  create_table "account_subjects_account_types", :id => false, :force => true do |t|
    t.integer  "account_type_id",    :precision => 38, :scale => 0
    t.integer  "account_subject_id", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_types", :force => true do |t|
    t.string   "name"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_hide",          :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "business_type_id", :precision => 38, :scale => 0
  end

  create_table "admins", :force => true do |t|
    t.string   "login",                   :limit => 200,                                                   :null => false
    t.string   "name",                    :limit => 100,                                                   :null => false
    t.string   "email",                   :limit => 200,                                                   :null => false
    t.string   "crypted_password",        :limit => 200,                                                   :null => false
    t.string   "password_salt",           :limit => 200,                                                   :null => false
    t.string   "persistence_token",       :limit => 200,                                                   :null => false
    t.string   "single_access_token",     :limit => 200,                                                   :null => false
    t.boolean  "active",                                 :precision => 1,  :scale => 0, :default => false, :null => false
    t.string   "perishable_token"
    t.integer  "dept",                    :limit => 2,   :precision => 2,  :scale => 0,                    :null => false
    t.integer  "failed_login_count",                     :precision => 38, :scale => 0, :default => 0,     :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "last_change_password_at"
    t.integer  "login_count",                            :precision => 38, :scale => 0, :default => 0
    t.datetime "last_request_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "partner_id",                             :precision => 38, :scale => 0, :default => 10000
    t.integer  "department_id",                          :precision => 38, :scale => 0
    t.integer  "office_id",                              :precision => 38, :scale => 0
  end

  add_index "admins", ["last_login_at"], :name => "index_admins_on_last_login_at"
  add_index "admins", ["login"], :name => "index_admins_on_login"
  add_index "admins", ["persistence_token"], :name => "i_admins_persistence_token"

  create_table "admins_roles", :id => false, :force => true do |t|
    t.integer "admin_id", :precision => 38, :scale => 0, :null => false
    t.integer "role_id",  :precision => 38, :scale => 0, :null => false
  end

  create_table "admins_worker_groups", :id => false, :force => true do |t|
    t.integer  "admin_id",        :precision => 38, :scale => 0
    t.integer  "worker_group_id", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advance_items", :force => true do |t|
    t.integer  "auction_id",       :precision => 38, :scale => 0
    t.integer  "advance_id",       :precision => 38, :scale => 0
    t.decimal  "estimated_amount", :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "advance_amount",   :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.integer  "status",           :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id",      :precision => 38, :scale => 0
  end

  create_table "advances", :force => true do |t|
    t.integer  "user_id",                         :precision => 38, :scale => 0,                  :null => false
    t.decimal  "advance_amount",                  :precision => 12, :scale => 2,                  :null => false
    t.integer  "status",                          :precision => 38, :scale => 0,                  :null => false
    t.string   "op"
    t.datetime "op_time"
    t.string   "created_by"
    t.integer  "account_detail_id",               :precision => 38, :scale => 0
    t.text     "description"
    t.integer  "pay_way_id",                      :precision => 38, :scale => 0
    t.integer  "company_bank_id",                 :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_bank_id",                    :precision => 38, :scale => 0
    t.string   "alipay_number"
    t.datetime "appoint_date"
    t.decimal  "estimated_amount",                :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "pay_back_amount",                 :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.integer  "contract_id",                     :precision => 38, :scale => 0
    t.integer  "advance_type",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "lock_version",      :limit => 10, :precision => 10, :scale => 0, :default => 0,   :null => false
  end

  create_table "apply_for_re_commissions", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                 :null => false
    t.integer  "contract_id",         :precision => 38, :scale => 0
    t.integer  "auction_type",        :precision => 38, :scale => 0,                 :null => false
    t.decimal  "settlement_percent",  :precision => 5,  :scale => 3
    t.string   "contract_number"
    t.decimal  "taxes_rate",          :precision => 5,  :scale => 3,                 :null => false
    t.decimal  "insurance_rate",      :precision => 5,  :scale => 3,                 :null => false
    t.string   "apply_by",                                                           :null => false
    t.string   "verify_by"
    t.datetime "verify_at"
    t.integer  "status",              :precision => 38, :scale => 0, :default => 0
    t.text     "remark",                                             :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sales_rep_id",        :precision => 38, :scale => 0
    t.integer  "particular_topic_id", :precision => 38, :scale => 0
    t.integer  "site_id",             :precision => 38, :scale => 0
  end

  create_table "auction_bidding_metas", :force => true do |t|
    t.integer  "auction_id",      :precision => 38, :scale => 0,                :null => false
    t.integer  "bidding_count",   :precision => 38, :scale => 0, :default => 0, :null => false
    t.decimal  "current_bidding", :precision => 12, :scale => 2,                :null => false
    t.datetime "created_at",                                                    :null => false
  end

  add_index "auction_bidding_metas", ["auction_id"], :name => "index_abms_on_auction_id"
  add_index "auction_bidding_metas", ["current_bidding"], :name => "index_abms_on_cprice"

  create_table "auction_biddings", :force => true do |t|
    t.integer  "auction_id",               :precision => 38, :scale => 0,                   :null => false
    t.integer  "user_id",                  :precision => 38, :scale => 0,                   :null => false
    t.integer  "delayed_bidding_id",       :precision => 38, :scale => 0
    t.string   "user_name"
    t.decimal  "amount",                   :precision => 12, :scale => 2,                   :null => false
    t.string   "user_agent"
    t.string   "user_ip"
    t.boolean  "is_valid",                 :precision => 1,  :scale => 0,                   :null => false
    t.boolean  "is_proxy",                 :precision => 1,  :scale => 0,                   :null => false
    t.integer  "auction_proxy_bidding_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                                                :null => false
    t.boolean  "is_show",                  :precision => 1,  :scale => 0, :default => true
  end

  create_table "auction_days", :force => true do |t|
    t.integer  "particular_topic_id", :precision => 38, :scale => 0, :null => false
    t.datetime "auction_at"
    t.datetime "preview_at"
    t.datetime "netbid_start_at"
    t.datetime "netbid_end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at"
  end

  create_table "auction_infos", :force => true do |t|
    t.integer  "particular_topic_id", :precision => 38, :scale => 0
    t.text     "description"
    t.string   "location"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "auction_infos", ["particular_topic_id"], :name => "i_auc_inf_par_top_id"

  create_table "auction_orders", :force => true do |t|
    t.integer  "user_id",              :precision => 38, :scale => 0,                    :null => false
    t.integer  "auction_id",           :precision => 38, :scale => 0,                    :null => false
    t.string   "auction_name",                                                           :null => false
    t.integer  "unite_payment_id",     :precision => 38, :scale => 0
    t.integer  "unite_consign_id",     :precision => 38, :scale => 0
    t.integer  "seller_user_id",       :precision => 38, :scale => 0
    t.integer  "order_type",           :precision => 38, :scale => 0,                    :null => false
    t.decimal  "end_price",            :precision => 12, :scale => 2,                    :null => false
    t.decimal  "service_fee",          :precision => 12, :scale => 2,                    :null => false
    t.decimal  "order_price",          :precision => 12, :scale => 2,                    :null => false
    t.integer  "status",               :precision => 38, :scale => 0, :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "paid_at"
    t.datetime "cancel_at"
    t.integer  "cancel_type",          :precision => 38, :scale => 0
    t.datetime "limit_pay_at"
    t.string   "op"
    t.text     "remark"
    t.integer  "lock_version",         :precision => 38, :scale => 0, :default => 0,     :null => false
    t.integer  "partner_id",           :precision => 38, :scale => 0, :default => 10000
    t.boolean  "is_partner_delivered", :precision => 1,  :scale => 0, :default => false
    t.decimal  "discount_rate",        :precision => 10, :scale => 4, :default => 1.0,   :null => false
    t.decimal  "discount",             :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.integer  "paddle_history_id",    :precision => 38, :scale => 0
    t.datetime "updated_at"
  end

  create_table "auction_pictures", :force => true do |t|
    t.integer  "auction_id",          :precision => 38, :scale => 0,                :null => false
    t.string   "base_url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size",    :precision => 38, :scale => 0
    t.string   "ip_address"
    t.datetime "avatar_updated_at"
    t.boolean  "avatar_processing",   :precision => 1,  :scale => 0
    t.string   "uploaded_by"
    t.integer  "position",            :precision => 38, :scale => 0, :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_processes", :force => true do |t|
    t.string   "auction_id",                                            :null => false
    t.string   "auction_no",                                            :null => false
    t.integer  "status",     :limit => 2, :precision => 2, :scale => 0, :null => false
    t.string   "remark",                                                :null => false
    t.string   "created_by",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_processes", ["auction_id"], :name => "i_auction_processes_auction_id"
  add_index "auction_processes", ["auction_no"], :name => "i_auction_processes_auction_no"

  create_table "auction_proxy_biddings", :force => true do |t|
    t.integer  "auction_id", :precision => 38, :scale => 0, :null => false
    t.integer  "user_id",    :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.decimal  "amount",     :precision => 12, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "set_at"
  end

  create_table "auction_quantities", :force => true do |t|
    t.integer  "auction_quantity_no", :precision => 38, :scale => 0,                :null => false
    t.integer  "category_id",         :precision => 38, :scale => 0,                :null => false
    t.string   "name",                                                              :null => false
    t.string   "name_symbol"
    t.string   "name_en"
    t.string   "description"
    t.integer  "position",            :precision => 38, :scale => 0, :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_quantities", ["category_id"], :name => "i_auc_qua_cat_id"

  create_table "auction_series", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name",          :limit => 20
    t.string   "magic_paddle_number", :limit => 30
  end

  create_table "auction_standards", :force => true do |t|
    t.string   "name",                                      :null => false
    t.integer  "min_price",  :precision => 38, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auctions", :force => true do |t|
    t.integer  "contract_id",                             :precision => 38, :scale => 0,                    :null => false
    t.string   "auction_no",                                                                                :null => false
    t.string   "name",                                                                                      :null => false
    t.string   "name_big5"
    t.string   "name_en"
    t.integer  "category_id",                             :precision => 38, :scale => 0,                    :null => false
    t.integer  "auction_quantity_id",                     :precision => 38, :scale => 0
    t.integer  "particular_topic_id",                     :precision => 38, :scale => 0
    t.integer  "apply_for_re_commission_id",              :precision => 38, :scale => 0
    t.integer  "status",                     :limit => 2, :precision => 2,  :scale => 0, :default => 0,     :null => false
    t.text     "description"
    t.text     "description_big5"
    t.text     "description_en"
    t.integer  "auction_type",               :limit => 2, :precision => 2,  :scale => 0,                    :null => false
    t.datetime "start_at"
    t.datetime "pre_shown_at"
    t.datetime "end_at"
    t.datetime "re_commissioned_time"
    t.decimal  "process_cost_fee",                        :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "start_price",                             :precision => 12, :scale => 2
    t.decimal  "end_price",                               :precision => 12, :scale => 2
    t.decimal  "buyer_service_fee_percent",               :precision => 5,  :scale => 3,                    :null => false
    t.decimal  "custodial_fee",                           :precision => 12, :scale => 2,                    :null => false
    t.decimal  "timeout_custodial_fee",                   :precision => 12, :scale => 2, :default => 1.0,   :null => false
    t.boolean  "is_settlement",                           :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "click_count",                             :precision => 38, :scale => 0, :default => 0,     :null => false
    t.boolean  "can_bargain",                             :precision => 1,  :scale => 0, :default => false, :null => false
    t.string   "remark"
    t.string   "barcode"
    t.integer  "re_commissioned",                         :precision => 38, :scale => 0
    t.boolean  "is_changed",                              :precision => 1,  :scale => 0, :default => false, :null => false
    t.text     "active_changes"
    t.integer  "auction_standard_id",                     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_go_abroad",                           :precision => 1,  :scale => 0, :default => true
    t.integer  "lock_version",                            :precision => 38, :scale => 0, :default => 0,     :null => false
    t.string   "lot_number"
    t.string   "tradition_hope_price"
    t.integer  "tradition_status",                        :precision => 38, :scale => 0, :default => 0
    t.integer  "partner_id",                              :precision => 38, :scale => 0, :default => 10000
    t.integer  "department",                 :limit => 5, :precision => 5,  :scale => 0
    t.string   "errata"
    t.decimal  "lowest_price",                            :precision => 12, :scale => 2
    t.decimal  "lot_fee",                                 :precision => 12, :scale => 2
    t.decimal  "seller_service_fee_rate",                 :precision => 6,  :scale => 3,                    :null => false
    t.decimal  "insurance_rate",                          :precision => 6,  :scale => 3,                    :null => false
    t.integer  "site_id",                                 :precision => 38, :scale => 0
    t.integer  "reserve_price",                           :precision => 38, :scale => 0
    t.integer  "auction_day_id",                          :precision => 38, :scale => 0
  end

  add_index "auctions", ["auction_no"], :name => "index_auctions_on_auction_no"
  add_index "auctions", ["auction_quantity_id"], :name => "index_auctions_on_quantity_id"
  add_index "auctions", ["auction_type"], :name => "index_auctions_on_auction_type"
  add_index "auctions", ["barcode"], :name => "index_auctions_on_barcode"
  add_index "auctions", ["category_id"], :name => "index_auctions_on_category_id"
  add_index "auctions", ["contract_id"], :name => "index_auctions_on_contract_id"
  add_index "auctions", ["particular_topic_id"], :name => "index_auctions_on_pts_id"
  add_index "auctions", ["status"], :name => "index_auctions_on_status"

  create_table "authors", :force => true do |t|
    t.string "name"
    t.string "name_big5"
    t.string "name_en"
    t.text   "info"
    t.text   "info_big5"
    t.text   "info_en"
    t.string "birth_to_death", :limit => 20
  end

  create_table "authors_paintings", :id => false, :force => true do |t|
    t.integer "author_id",   :precision => 38, :scale => 0, :null => false
    t.integer "painting_id", :precision => 38, :scale => 0, :null => false
  end

  create_table "bail_rate_lock_details", :force => true do |t|
    t.integer  "user_id",     :precision => 38, :scale => 0, :null => false
    t.string   "op",                                         :null => false
    t.string   "lock_reason"
    t.decimal  "bail_rate",   :precision => 5,  :scale => 3
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "balance_change_components", :force => true do |t|
    t.integer  "balance_change_id",  :precision => 38, :scale => 0
    t.integer  "account_subject_id", :precision => 38, :scale => 0
    t.decimal  "amount",             :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balance_changes", :force => true do |t|
    t.integer  "account_type_id", :precision => 38, :scale => 0
    t.integer  "user_id",         :precision => 38, :scale => 0
    t.decimal  "money",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.integer  "status",          :precision => 38, :scale => 0, :default => 0,   :null => false
    t.string   "exe_record"
    t.string   "created_by"
    t.string   "process_by"
    t.datetime "process_date"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relatable_type"
    t.integer  "relatable_id",    :precision => 38, :scale => 0
  end

  create_table "banks_account_details", :force => true do |t|
    t.integer  "company_bank_id",   :precision => 38, :scale => 0, :null => false
    t.integer  "account_type",      :precision => 38, :scale => 0, :null => false
    t.integer  "money",             :precision => 38, :scale => 0, :null => false
    t.string   "description",                                      :null => false
    t.string   "payee",                                            :null => false
    t.string   "payee_bank_number",                                :null => false
    t.string   "payee_city",                                       :null => false
    t.string   "operator_by",                                      :null => false
    t.string   "operator_at",                                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "barcode_prints", :force => true do |t|
    t.string   "barcode"
    t.integer  "op_by",       :precision => 38, :scale => 0
    t.integer  "get_by",      :precision => 38, :scale => 0
    t.integer  "print_count", :precision => 38, :scale => 0, :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bargain_prices", :force => true do |t|
    t.integer  "auction_id",        :precision => 38, :scale => 0, :null => false
    t.string   "auction_no"
    t.string   "auction_name"
    t.integer  "user_id",           :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.decimal  "price",             :precision => 12, :scale => 2, :null => false
    t.integer  "status",            :precision => 38, :scale => 0, :null => false
    t.text     "remark"
    t.string   "user_agent"
    t.string   "user_ip"
    t.datetime "created_at",                                       :null => false
    t.datetime "refused_at"
    t.datetime "agreed_at"
    t.decimal  "seller_price",      :precision => 12, :scale => 2
    t.datetime "invalid_at"
    t.datetime "seller_bargain_at"
  end

  create_table "bid_orders", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0
    t.string   "lot_number"
    t.decimal  "price",               :precision => 12, :scale => 2
    t.integer  "particular_topic_id", :precision => 38, :scale => 0
    t.integer  "auction_id",          :precision => 38, :scale => 0
    t.string   "paddle_number"
    t.datetime "bid_time"
    t.integer  "status",              :precision => 38, :scale => 0, :default => 0, :null => false
    t.integer  "bid_type",            :precision => 38, :scale => 0, :default => 1, :null => false
    t.string   "telephone_one"
    t.string   "telephone_two"
    t.integer  "position",            :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bid_orders", ["auction_id"], :name => "index_bid_orders_on_auction_id"
  add_index "bid_orders", ["lot_number"], :name => "index_bid_orders_on_lot_number"
  add_index "bid_orders", ["particular_topic_id"], :name => "i_bid_ord_par_top_id"
  add_index "bid_orders", ["user_id"], :name => "index_bid_orders_on_user_id"

  create_table "business_types", :force => true do |t|
    t.string "name"
    t.string "business"
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "owner_id",   :precision => 38, :scale => 0
    t.string   "owner_type"
    t.integer  "quantity",   :precision => 38, :scale => 0
    t.integer  "item_id",    :precision => 38, :scale => 0
    t.string   "item_type"
    t.decimal  "price"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "front_name",                                                                 :null => false
    t.string   "backend_name",                                                               :null => false
    t.string   "category_code",                                                              :null => false
    t.string   "backend_code",                                                               :null => false
    t.integer  "position",                  :precision => 38, :scale => 0, :default => 0,    :null => false
    t.boolean  "is_show",                   :precision => 1,  :scale => 0, :default => true, :null => false
    t.string   "name_big5"
    t.string   "name_en"
    t.integer  "parent_id",                 :precision => 38, :scale => 0
    t.integer  "depth",                     :precision => 38, :scale => 0
    t.string   "created_by"
    t.string   "remark"
    t.integer  "lft",                       :precision => 38, :scale => 0
    t.integer  "rgt",                       :precision => 38, :scale => 0
    t.decimal  "buyer_service_fee_percent", :precision => 5,  :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zhao_category_id",          :precision => 38, :scale => 0
  end

  add_index "categories", ["category_code"], :name => "i_categories_category_code"
  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "checking_activation_logs", :force => true do |t|
    t.integer  "user_id",         :precision => 38, :scale => 0,                :null => false
    t.string   "mobile_or_email",                                               :null => false
    t.string   "link_or_code",                                                  :null => false
    t.integer  "type",            :precision => 38, :scale => 0,                :null => false
    t.integer  "status",          :precision => 38, :scale => 0, :default => 1, :null => false
    t.datetime "actived_at"
    t.datetime "actived_ip"
    t.string   "created_ip"
    t.datetime "expiration_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "province_id",      :precision => 38, :scale => 0, :null => false
    t.string   "english_name"
    t.string   "traditional_name"
    t.integer  "position",         :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
  end

  add_index "cities", ["province_id"], :name => "index_cities_on_province_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                                                    :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size",                  :precision => 38, :scale => 0
    t.integer  "assetable_id",                    :precision => 38, :scale => 0
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.boolean  "locale",                          :precision => 1,  :scale => 0, :default => false
    t.integer  "user_id",                         :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "collection_ranges", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "name_cht"
    t.string   "name_en"
    t.boolean  "is_show",    :precision => 1,  :scale => 0, :default => true, :null => false
    t.integer  "position",   :precision => 38, :scale => 0
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_ranges_users", :id => false, :force => true do |t|
    t.integer "collection_range_id", :precision => 38, :scale => 0
    t.integer "user_id",             :precision => 38, :scale => 0
  end

  create_table "company_banks", :force => true do |t|
    t.integer  "category",         :limit => 2, :precision => 2, :scale => 0,                    :null => false
    t.string   "bank_name",                                                                      :null => false
    t.string   "bank_number",                                                                    :null => false
    t.string   "bank_owner",                                                                     :null => false
    t.boolean  "is_used",                       :precision => 1, :scale => 0, :default => true,  :null => false
    t.integer  "position",         :limit => 2, :precision => 2, :scale => 0, :default => 0,     :null => false
    t.string   "inital_bank_name"
    t.boolean  "is_hidden",                     :precision => 1, :scale => 0, :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_categories", :force => true do |t|
    t.integer "contract_id",                  :precision => 38, :scale => 0
    t.integer "category_id",                  :precision => 38, :scale => 0
    t.integer "lot_number",                   :precision => 38, :scale => 0
    t.string  "remark"
    t.integer "factory_number", :limit => 30, :precision => 30, :scale => 0, :default => 0
  end

  create_table "contracts", :force => true do |t|
    t.integer  "user_id",                             :precision => 38, :scale => 0,                    :null => false
    t.string   "contract_number"
    t.integer  "contract_type",          :limit => 2, :precision => 2,  :scale => 0,                    :null => false
    t.integer  "auctions_count",         :limit => 3, :precision => 3,  :scale => 0,                    :null => false
    t.integer  "status",                              :precision => 38, :scale => 0, :default => 9,     :null => false
    t.integer  "worker_group_id",                     :precision => 38, :scale => 0
    t.string   "user_name",                                                                             :null => false
    t.string   "discard_by"
    t.string   "discard_reason"
    t.string   "created_by"
    t.string   "dispatched_by"
    t.string   "collecting_finished_by"
    t.string   "audit_finished_by"
    t.string   "send_to_consign_by"
    t.string   "confirmed_by"
    t.decimal  "settlement_percent",                  :precision => 5,  :scale => 3,                    :null => false
    t.decimal  "taxes_rate",                          :precision => 5,  :scale => 3,                    :null => false
    t.decimal  "insurance_rate",                      :precision => 5,  :scale => 3,                    :null => false
    t.decimal  "per_process_cost_fee",                :precision => 9,  :scale => 2,                    :null => false
    t.decimal  "per_storage_fee",                     :precision => 9,  :scale => 2
    t.boolean  "is_discard",                          :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_complete",                         :precision => 1,  :scale => 0, :default => false, :null => false
    t.text     "remark"
    t.text     "apply_content"
    t.text     "again_review_content"
    t.datetime "discard_at"
    t.datetime "in_storage_at"
    t.datetime "dispatched_at"
    t.datetime "collecting_started_at"
    t.datetime "collecting_finished_at"
    t.datetime "audit_started_at"
    t.datetime "audit_finished_at"
    t.datetime "send_to_consign_at"
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_sent_to_client",                   :precision => 1,  :scale => 0, :default => false
    t.integer  "partner_id",                          :precision => 38, :scale => 0, :default => 10000
    t.integer  "sales_rep_id",                        :precision => 38, :scale => 0
    t.boolean  "is_tax_paid",                         :precision => 1,  :scale => 0, :default => false, :null => false
    t.string   "auctions_category"
    t.integer  "particular_topic_id",                 :precision => 38, :scale => 0
    t.boolean  "finance_review",                      :precision => 1,  :scale => 0, :default => false
    t.integer  "site_id",                             :precision => 38, :scale => 0
    t.integer  "gathering_way",          :limit => 2, :precision => 2,  :scale => 0
    t.boolean  "salesman_confirm",                    :precision => 1,  :scale => 0, :default => false, :null => false
  end

  add_index "contracts", ["status"], :name => "index_contracts_on_status"
  add_index "contracts", ["user_id"], :name => "index_contracts_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name",                                            :null => false
    t.string   "english_name"
    t.string   "traditional_name"
    t.integer  "position",         :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_categories", :force => true do |t|
    t.string  "name"
    t.integer "code", :limit => 11, :precision => 11, :scale => 0
  end

  create_table "coupon_histories", :force => true do |t|
    t.integer  "user_id",               :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "user_coupon_detail_id", :limit => 11, :precision => 11, :scale => 0
    t.integer  "direction",             :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.string   "relatable_type"
    t.integer  "relatable_id",          :limit => 11, :precision => 11, :scale => 0
    t.integer  "description",           :limit => 11, :precision => 11, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_units", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "coupon_values", :force => true do |t|
    t.integer "value", :limit => 11, :precision => 11, :scale => 0, :null => false
  end

  create_table "cre", :force => true do |t|
    t.integer  "user_id",                         :precision => 38, :scale => 0,                  :null => false
    t.decimal  "advance_amount",                  :precision => 12, :scale => 2,                  :null => false
    t.integer  "status",                          :precision => 38, :scale => 0,                  :null => false
    t.string   "op"
    t.datetime "op_time"
    t.string   "created_by"
    t.integer  "account_detail_id",               :precision => 38, :scale => 0
    t.text     "description"
    t.integer  "pay_way_id",                      :precision => 38, :scale => 0
    t.integer  "company_bank_id",                 :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_bank_id",                    :precision => 38, :scale => 0
    t.string   "alipay_number"
    t.datetime "appoint_date"
    t.decimal  "estimated_amount",                :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "pay_back_amount",                 :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.integer  "contract_id",                     :precision => 38, :scale => 0
    t.integer  "advance_type",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "lock_version",      :limit => 10, :precision => 10, :scale => 0, :default => 0,   :null => false
  end

  create_table "credit_coupon_rule_details", :force => true do |t|
    t.integer  "credit_coupon_rule_id", :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "coupon_category_id",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "coupon_unit_id",        :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "coupon_value_id",       :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "amount",                :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "valid_days",            :limit => 11, :precision => 11, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_coupon_rule_details", ["credit_coupon_rule_id", "coupon_category_id", "coupon_unit_id", "coupon_value_id"], :name => "ind_cret_coun_ruls_dets_all"

  create_table "credit_coupon_rules", :force => true do |t|
    t.integer  "credit_value", :limit => 11, :precision => 11, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_coupon_rules", ["credit_value"], :name => "ind_cret_coun_ruls_value"

  create_table "credit_frozen_histories", :force => true do |t|
    t.integer  "user_id",        :limit => 11, :precision => 11, :scale => 0, :null => false
    t.decimal  "amount",                       :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type"
    t.integer  "relatable_id",   :limit => 11, :precision => 11, :scale => 0
    t.integer  "description",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "credit_rule_id", :limit => 11, :precision => 11, :scale => 0
    t.integer  "status",         :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_frozen_histories", ["relatable_type", "relatable_id", "credit_rule_id", "user_id"], :name => "ind_cret_fron_hiss_all"

  create_table "credit_histories", :force => true do |t|
    t.integer  "user_id",        :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "direction",      :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.decimal  "amount",                       :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type"
    t.integer  "relatable_id",   :limit => 11, :precision => 11, :scale => 0
    t.integer  "description",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "credit_rule_id", :limit => 11, :precision => 11, :scale => 0, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_histories", ["user_id", "relatable_type", "relatable_id", "credit_rule_id"], :name => "ind_cret_hiss_all"

  create_table "credit_order_rules", :force => true do |t|
    t.decimal  "buyer_service_fee", :precision => 5, :scale => 3, :null => false
    t.decimal  "exchange_rate",     :precision => 5, :scale => 3, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_order_rules", ["buyer_service_fee"], :name => "ind_cret_ordr_ruls_fee"

  create_table "credit_rules", :force => true do |t|
    t.integer  "is_valid",       :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.integer  "apply_to",       :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.integer  "direction",      :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.string   "relatable_type",                                              :null => false
    t.integer  "relatable_id",   :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "description",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.string   "remark",                                                      :null => false
    t.datetime "invalid_at"
    t.string   "invalid_by"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_rules", ["is_valid", "apply_to", "direction", "relatable_type"], :name => "ind_cret_ruls_"

  create_table "currency_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    :limit => 2, :precision => 2, :scale => 0, :default => 0
    t.integer  "is_show",     :limit => 2, :precision => 2, :scale => 0, :default => 0
  end

  create_table "delayed_biddings", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.string   "user_name"
    t.decimal  "amount",        :precision => 10, :scale => 2
    t.datetime "bid_at"
    t.string   "user_ip"
    t.boolean  "status",        :precision => 1,  :scale => 0, :default => false
    t.integer  "auction_id",    :precision => 38, :scale => 0
    t.datetime "operated_at"
    t.string   "user_agent"
    t.integer  "result_status", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "set_at"
  end

  add_index "delayed_biddings", ["amount"], :name => "amount_index_on_dbs"
  add_index "delayed_biddings", ["status"], :name => "status_index_on_dbs"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :precision => 38, :scale => 0, :default => 0
    t.integer  "attempts",   :precision => 38, :scale => 0, :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "queue"
  end

  add_index "delayed_jobs", ["locked_by"], :name => "delayed_jobs_locked_by"
  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deliver_invoices", :force => true do |t|
    t.integer  "unite_consign_id", :precision => 38, :scale => 0
    t.integer  "xh",               :precision => 38, :scale => 0
    t.datetime "kprq"
    t.string   "fphm"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.decimal  "je",               :precision => 12, :scale => 2
  end

  create_table "deliver_ways", :force => true do |t|
    t.string   "name"
    t.boolean  "is_hide",                    :precision => 1,  :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "office_id",                  :precision => 38, :scale => 0
    t.decimal  "frozen_amount",              :precision => 6,  :scale => 2
    t.integer  "country_id",                 :precision => 38, :scale => 0
    t.integer  "deliver_way",   :limit => 3, :precision => 3,  :scale => 0
    t.integer  "deliver_type",  :limit => 3, :precision => 3,  :scale => 0
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "city_id",          :precision => 38, :scale => 0, :null => false
    t.string   "english_name"
    t.string   "traditional_name"
    t.integer  "position",         :precision => 38, :scale => 0
    t.string   "zip_code"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "exchange_rates", :force => true do |t|
    t.integer  "currency_category_id", :precision => 38, :scale => 0
    t.decimal  "buying_rate",          :precision => 20, :scale => 10, :default => 0.0
    t.decimal  "selling_rate",         :precision => 20, :scale => 10, :default => 0.0
    t.decimal  "buying_price",         :precision => 20, :scale => 10, :default => 0.0
    t.decimal  "selling_price",        :precision => 20, :scale => 10, :default => 0.0
    t.string   "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export000001", :id => false, :force => true do |t|
    t.decimal  "process_order"
    t.decimal  "duplicate"
    t.decimal  "dump_fileid"
    t.decimal  "dump_position"
    t.decimal  "dump_length"
    t.decimal  "dump_allocation"
    t.decimal  "completed_rows"
    t.decimal  "error_count"
    t.decimal  "elapsed_time"
    t.string   "object_type_path",       :limit => 200
    t.decimal  "object_path_seqno"
    t.string   "object_type",            :limit => 30
    t.string   "in_progress",            :limit => 1
    t.string   "object_name",            :limit => 500
    t.string   "object_long_name",       :limit => 4000
    t.string   "object_schema",          :limit => 30
    t.string   "original_object_schema", :limit => 30
    t.string   "partition_name",         :limit => 30
    t.string   "subpartition_name",      :limit => 30
    t.decimal  "flags"
    t.decimal  "property"
    t.datetime "completion_time"
    t.string   "object_tablespace",      :limit => 30
    t.decimal  "size_estimate"
    t.decimal  "object_row"
    t.string   "processing_state",       :limit => 1
    t.string   "processing_status",      :limit => 1
    t.decimal  "base_process_order"
    t.string   "base_object_type",       :limit => 30
    t.string   "base_object_name",       :limit => 30
    t.string   "base_object_schema",     :limit => 30
    t.decimal  "ancestor_process_order"
    t.decimal  "domain_process_order"
    t.decimal  "parallelization"
    t.decimal  "unload_method"
    t.decimal  "granules"
    t.decimal  "scn"
    t.string   "grantor",                :limit => 30
    t.text     "xml_clob"
    t.string   "name",                   :limit => 30
    t.string   "value_t",                :limit => 4000
    t.decimal  "value_n"
    t.decimal  "is_default"
    t.decimal  "file_type"
    t.string   "user_directory",         :limit => 4000
    t.string   "user_file_name",         :limit => 4000
    t.string   "file_name",              :limit => 4000
    t.decimal  "extend_size"
    t.decimal  "file_max_size"
    t.string   "process_name",           :limit => 30
    t.datetime "last_update"
    t.string   "work_item",              :limit => 30
    t.decimal  "object_number"
    t.decimal  "completed_bytes"
    t.decimal  "total_bytes"
    t.decimal  "metadata_io"
    t.decimal  "data_io"
    t.decimal  "cumulative_time"
    t.decimal  "packet_number"
    t.string   "old_value",              :limit => 4000
    t.decimal  "seed"
    t.decimal  "last_file"
    t.string   "user_name",              :limit => 30
    t.string   "operation",              :limit => 30
    t.string   "job_mode",               :limit => 30
    t.string   "control_queue",          :limit => 30
    t.string   "status_queue",           :limit => 30
    t.string   "remote_link",            :limit => 4000
    t.decimal  "version"
    t.string   "db_version",             :limit => 30
    t.string   "timezone",               :limit => 64
    t.string   "state",                  :limit => 30
    t.decimal  "phase"
    t.raw      "guid",                   :limit => 16
    t.datetime "start_time"
    t.decimal  "block_size"
    t.decimal  "metadata_buffer_size"
    t.decimal  "data_buffer_size"
    t.decimal  "degree"
    t.string   "platform",               :limit => 101
    t.decimal  "abort_step"
    t.string   "instance",               :limit => 60
  end

  add_index "export000001", ["object_schema", "object_name", "object_type"], :name => "sys_mtable_000016e12_ind_1"
  add_index "export000001", ["process_order", "duplicate"], :name => "sys_c0041390", :unique => true

  create_table "export000002", :id => false, :force => true do |t|
    t.decimal  "process_order"
    t.decimal  "duplicate"
    t.decimal  "dump_fileid"
    t.decimal  "dump_position"
    t.decimal  "dump_length"
    t.decimal  "dump_allocation"
    t.decimal  "completed_rows"
    t.decimal  "error_count"
    t.decimal  "elapsed_time"
    t.string   "object_type_path",       :limit => 200
    t.decimal  "object_path_seqno"
    t.string   "object_type",            :limit => 30
    t.string   "in_progress",            :limit => 1
    t.string   "object_name",            :limit => 500
    t.string   "object_long_name",       :limit => 4000
    t.string   "object_schema",          :limit => 30
    t.string   "original_object_schema", :limit => 30
    t.string   "partition_name",         :limit => 30
    t.string   "subpartition_name",      :limit => 30
    t.decimal  "flags"
    t.decimal  "property"
    t.datetime "completion_time"
    t.string   "object_tablespace",      :limit => 30
    t.decimal  "size_estimate"
    t.decimal  "object_row"
    t.string   "processing_state",       :limit => 1
    t.string   "processing_status",      :limit => 1
    t.decimal  "base_process_order"
    t.string   "base_object_type",       :limit => 30
    t.string   "base_object_name",       :limit => 30
    t.string   "base_object_schema",     :limit => 30
    t.decimal  "ancestor_process_order"
    t.decimal  "domain_process_order"
    t.decimal  "parallelization"
    t.decimal  "unload_method"
    t.decimal  "granules"
    t.decimal  "scn"
    t.string   "grantor",                :limit => 30
    t.text     "xml_clob"
    t.string   "name",                   :limit => 30
    t.string   "value_t",                :limit => 4000
    t.decimal  "value_n"
    t.decimal  "is_default"
    t.decimal  "file_type"
    t.string   "user_directory",         :limit => 4000
    t.string   "user_file_name",         :limit => 4000
    t.string   "file_name",              :limit => 4000
    t.decimal  "extend_size"
    t.decimal  "file_max_size"
    t.string   "process_name",           :limit => 30
    t.datetime "last_update"
    t.string   "work_item",              :limit => 30
    t.decimal  "object_number"
    t.decimal  "completed_bytes"
    t.decimal  "total_bytes"
    t.decimal  "metadata_io"
    t.decimal  "data_io"
    t.decimal  "cumulative_time"
    t.decimal  "packet_number"
    t.string   "old_value",              :limit => 4000
    t.decimal  "seed"
    t.decimal  "last_file"
    t.string   "user_name",              :limit => 30
    t.string   "operation",              :limit => 30
    t.string   "job_mode",               :limit => 30
    t.string   "control_queue",          :limit => 30
    t.string   "status_queue",           :limit => 30
    t.string   "remote_link",            :limit => 4000
    t.decimal  "version"
    t.string   "db_version",             :limit => 30
    t.string   "timezone",               :limit => 64
    t.string   "state",                  :limit => 30
    t.decimal  "phase"
    t.raw      "guid",                   :limit => 16
    t.datetime "start_time"
    t.decimal  "block_size"
    t.decimal  "metadata_buffer_size"
    t.decimal  "data_buffer_size"
    t.decimal  "degree"
    t.string   "platform",               :limit => 101
    t.decimal  "abort_step"
    t.string   "instance",               :limit => 60
  end

  add_index "export000002", ["object_schema", "object_name", "object_type"], :name => "sys_mtable_000016e40_ind_1"
  add_index "export000002", ["process_order", "duplicate"], :name => "sys_c0041391", :unique => true

  create_table "export000003", :id => false, :force => true do |t|
    t.decimal  "process_order"
    t.decimal  "duplicate"
    t.decimal  "dump_fileid"
    t.decimal  "dump_position"
    t.decimal  "dump_length"
    t.decimal  "dump_allocation"
    t.decimal  "completed_rows"
    t.decimal  "error_count"
    t.decimal  "elapsed_time"
    t.string   "object_type_path",       :limit => 200
    t.decimal  "object_path_seqno"
    t.string   "object_type",            :limit => 30
    t.string   "in_progress",            :limit => 1
    t.string   "object_name",            :limit => 500
    t.string   "object_long_name",       :limit => 4000
    t.string   "object_schema",          :limit => 30
    t.string   "original_object_schema", :limit => 30
    t.string   "partition_name",         :limit => 30
    t.string   "subpartition_name",      :limit => 30
    t.decimal  "flags"
    t.decimal  "property"
    t.datetime "completion_time"
    t.string   "object_tablespace",      :limit => 30
    t.decimal  "size_estimate"
    t.decimal  "object_row"
    t.string   "processing_state",       :limit => 1
    t.string   "processing_status",      :limit => 1
    t.decimal  "base_process_order"
    t.string   "base_object_type",       :limit => 30
    t.string   "base_object_name",       :limit => 30
    t.string   "base_object_schema",     :limit => 30
    t.decimal  "ancestor_process_order"
    t.decimal  "domain_process_order"
    t.decimal  "parallelization"
    t.decimal  "unload_method"
    t.decimal  "granules"
    t.decimal  "scn"
    t.string   "grantor",                :limit => 30
    t.text     "xml_clob"
    t.string   "name",                   :limit => 30
    t.string   "value_t",                :limit => 4000
    t.decimal  "value_n"
    t.decimal  "is_default"
    t.decimal  "file_type"
    t.string   "user_directory",         :limit => 4000
    t.string   "user_file_name",         :limit => 4000
    t.string   "file_name",              :limit => 4000
    t.decimal  "extend_size"
    t.decimal  "file_max_size"
    t.string   "process_name",           :limit => 30
    t.datetime "last_update"
    t.string   "work_item",              :limit => 30
    t.decimal  "object_number"
    t.decimal  "completed_bytes"
    t.decimal  "total_bytes"
    t.decimal  "metadata_io"
    t.decimal  "data_io"
    t.decimal  "cumulative_time"
    t.decimal  "packet_number"
    t.string   "old_value",              :limit => 4000
    t.decimal  "seed"
    t.decimal  "last_file"
    t.string   "user_name",              :limit => 30
    t.string   "operation",              :limit => 30
    t.string   "job_mode",               :limit => 30
    t.string   "control_queue",          :limit => 30
    t.string   "status_queue",           :limit => 30
    t.string   "remote_link",            :limit => 4000
    t.decimal  "version"
    t.string   "db_version",             :limit => 30
    t.string   "timezone",               :limit => 64
    t.string   "state",                  :limit => 30
    t.decimal  "phase"
    t.raw      "guid",                   :limit => 16
    t.datetime "start_time"
    t.decimal  "block_size"
    t.decimal  "metadata_buffer_size"
    t.decimal  "data_buffer_size"
    t.decimal  "degree"
    t.string   "platform",               :limit => 101
    t.decimal  "abort_step"
    t.string   "instance",               :limit => 60
  end

  add_index "export000003", ["object_schema", "object_name", "object_type"], :name => "sys_mtable_000016e51_ind_1"
  add_index "export000003", ["process_order", "duplicate"], :name => "sys_c0041392", :unique => true

  create_table "export000004", :id => false, :force => true do |t|
    t.decimal  "process_order"
    t.decimal  "duplicate"
    t.decimal  "dump_fileid"
    t.decimal  "dump_position"
    t.decimal  "dump_length"
    t.decimal  "dump_allocation"
    t.decimal  "completed_rows"
    t.decimal  "error_count"
    t.decimal  "elapsed_time"
    t.string   "object_type_path",       :limit => 200
    t.decimal  "object_path_seqno"
    t.string   "object_type",            :limit => 30
    t.string   "in_progress",            :limit => 1
    t.string   "object_name",            :limit => 500
    t.string   "object_long_name",       :limit => 4000
    t.string   "object_schema",          :limit => 30
    t.string   "original_object_schema", :limit => 30
    t.string   "partition_name",         :limit => 30
    t.string   "subpartition_name",      :limit => 30
    t.decimal  "flags"
    t.decimal  "property"
    t.datetime "completion_time"
    t.string   "object_tablespace",      :limit => 30
    t.decimal  "size_estimate"
    t.decimal  "object_row"
    t.string   "processing_state",       :limit => 1
    t.string   "processing_status",      :limit => 1
    t.decimal  "base_process_order"
    t.string   "base_object_type",       :limit => 30
    t.string   "base_object_name",       :limit => 30
    t.string   "base_object_schema",     :limit => 30
    t.decimal  "ancestor_process_order"
    t.decimal  "domain_process_order"
    t.decimal  "parallelization"
    t.decimal  "unload_method"
    t.decimal  "granules"
    t.decimal  "scn"
    t.string   "grantor",                :limit => 30
    t.text     "xml_clob"
    t.string   "name",                   :limit => 30
    t.string   "value_t",                :limit => 4000
    t.decimal  "value_n"
    t.decimal  "is_default"
    t.decimal  "file_type"
    t.string   "user_directory",         :limit => 4000
    t.string   "user_file_name",         :limit => 4000
    t.string   "file_name",              :limit => 4000
    t.decimal  "extend_size"
    t.decimal  "file_max_size"
    t.string   "process_name",           :limit => 30
    t.datetime "last_update"
    t.string   "work_item",              :limit => 30
    t.decimal  "object_number"
    t.decimal  "completed_bytes"
    t.decimal  "total_bytes"
    t.decimal  "metadata_io"
    t.decimal  "data_io"
    t.decimal  "cumulative_time"
    t.decimal  "packet_number"
    t.string   "old_value",              :limit => 4000
    t.decimal  "seed"
    t.decimal  "last_file"
    t.string   "user_name",              :limit => 30
    t.string   "operation",              :limit => 30
    t.string   "job_mode",               :limit => 30
    t.string   "control_queue",          :limit => 30
    t.string   "status_queue",           :limit => 30
    t.string   "remote_link",            :limit => 4000
    t.decimal  "version"
    t.string   "db_version",             :limit => 30
    t.string   "timezone",               :limit => 64
    t.string   "state",                  :limit => 30
    t.decimal  "phase"
    t.raw      "guid",                   :limit => 16
    t.datetime "start_time"
    t.decimal  "block_size"
    t.decimal  "metadata_buffer_size"
    t.decimal  "data_buffer_size"
    t.decimal  "degree"
    t.string   "platform",               :limit => 101
    t.decimal  "abort_step"
    t.string   "instance",               :limit => 60
  end

  add_index "export000004", ["object_schema", "object_name", "object_type"], :name => "sys_mtable_000016e62_ind_1"
  add_index "export000004", ["process_order", "duplicate"], :name => "sys_c0041393", :unique => true

  create_table "feature_likes", :force => true do |t|
    t.integer  "feature_id", :precision => 38, :scale => 0, :null => false
    t.integer  "user_id",    :precision => 38, :scale => 0, :null => false
    t.string   "created_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", :force => true do |t|
    t.string   "name",                                       :null => false
    t.text     "description",                                :null => false
    t.integer  "admin_id",    :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "content"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  create_table "fp_infos", :force => true do |t|
    t.string   "kpfmc"
    t.string   "nsrsbh"
    t.string   "kpfsbh"
    t.string   "fpzldm"
    t.string   "hyfldm"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fp_wd_dkpxxes_unite_consigns", :force => true do |t|
    t.integer "unite_consign_id", :precision => 38, :scale => 0
    t.integer "fp_wd_dkpxx_id",   :precision => 38, :scale => 0
  end

  create_table "frozen_funds", :force => true do |t|
    t.integer  "user_id",         :precision => 38, :scale => 0,                    :null => false
    t.string   "relatable_type",                                                    :null => false
    t.integer  "relatable_id",    :precision => 38, :scale => 0,                    :null => false
    t.boolean  "is_frezon",       :precision => 1,  :scale => 0, :default => false, :null => false
    t.decimal  "amount",          :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.text     "remark"
    t.datetime "processing_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_returns", :force => true do |t|
    t.integer  "auction_id",       :precision => 38, :scale => 0, :null => false
    t.string   "auction_no",                                      :null => false
    t.string   "auction_name"
    t.integer  "user_id",          :precision => 38, :scale => 0, :null => false
    t.integer  "unite_consign_id", :precision => 38, :scale => 0
    t.datetime "end_at"
    t.string   "created_by"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "huabids", :force => true do |t|
    t.string   "name"
    t.string   "templete_name"
    t.string   "title"
    t.integer  "huabid_type",              :precision => 38, :scale => 0
    t.string   "hyperlink"
    t.string   "attachments_file_name"
    t.string   "attachments_content_type"
    t.integer  "attachments_file_size",    :precision => 38, :scale => 0
    t.text     "summary"
    t.integer  "position",                 :precision => 38, :scale => 0
    t.integer  "parent_id",                :precision => 38, :scale => 0
    t.integer  "depth",                    :precision => 38, :scale => 0
    t.boolean  "disable",                  :precision => 1,  :scale => 0, :default => false
    t.integer  "lft",                      :precision => 38, :scale => 0
    t.integer  "rgt",                      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internal_notices", :force => true do |t|
    t.string   "title",                                                       :null => false
    t.text     "content",                                                     :null => false
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delete",  :precision => 1, :scale => 0, :default => false, :null => false
  end

  create_table "issue_logs", :force => true do |t|
    t.integer  "issue_id",    :precision => 38, :scale => 0
    t.integer  "admin_id",    :precision => 38, :scale => 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_replies", :force => true do |t|
    t.integer  "admin_id",    :precision => 38, :scale => 0
    t.integer  "issue_id",    :precision => 38, :scale => 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_types", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.integer  "lft",        :precision => 38, :scale => 0
    t.integer  "rgt",        :precision => 38, :scale => 0
    t.integer  "depth",      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.string   "numbers"
    t.string   "issue_number"
    t.integer  "lead_id",       :precision => 38, :scale => 0
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.integer  "admin_id",      :precision => 38, :scale => 0
    t.integer  "issue_type_id", :precision => 38, :scale => 0
    t.string   "created_by"
    t.integer  "status",        :precision => 38, :scale => 0, :default => 4, :null => false
    t.string   "summary"
    t.integer  "priority",      :precision => 38, :scale => 0, :default => 0, :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues_issue_types", :id => false, :force => true do |t|
    t.integer "issue_id",      :precision => 38, :scale => 0
    t.integer "issue_type_id", :precision => 38, :scale => 0
  end

  create_table "leads", :force => true do |t|
    t.string   "appellation"
    t.string   "tel"
    t.string   "popcity"
    t.string   "button_number"
    t.string   "created_by"
    t.string   "email"
    t.string   "qq"
    t.string   "address"
    t.integer  "sex",           :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "source"
  end

  create_table "locations", :force => true do |t|
    t.string   "location_barcode",                                :null => false
    t.integer  "location_type",    :precision => 38, :scale => 0
    t.integer  "parent_id",        :precision => 38, :scale => 0
    t.integer  "lft",              :precision => 38, :scale => 0
    t.integer  "rgt",              :precision => 38, :scale => 0
    t.integer  "depth",            :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "office_id",        :precision => 38, :scale => 0
  end

  create_table "login_histories", :id => false, :force => true do |t|
    t.integer  "id",          :limit => 10,  :precision => 10, :scale => 0
    t.integer  "user_id",     :limit => 10,  :precision => 10, :scale => 0
    t.datetime "login_at"
    t.string   "user_agent"
    t.string   "user_ip"
    t.string   "referer",     :limit => 500
    t.string   "cross_token"
  end

  add_index "login_histories", ["id"], :name => "unique_on_login_histoies", :unique => true
  add_index "login_histories", ["user_id"], :name => "user_id_on_login_histoies"
  add_index "login_histories", ["user_ip"], :name => "user_ip_on_login_histoies"

  create_table "lot_loan_items", :force => true do |t|
    t.integer  "lot_loan_id", :precision => 38, :scale => 0
    t.integer  "auction_id",  :precision => 38, :scale => 0
    t.string   "auction_no"
    t.integer  "status",      :precision => 38, :scale => 0, :default => 0
    t.datetime "op_date"
    t.integer  "op_user_id",  :precision => 38, :scale => 0
    t.string   "aasm_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lot_loan_items", ["auction_id"], :name => "i_lot_loan_items_auction_id"
  add_index "lot_loan_items", ["lot_loan_id"], :name => "i_lot_loan_items_lot_loan_id"
  add_index "lot_loan_items", ["op_user_id"], :name => "i_lot_loan_items_op_user_id"

  create_table "lot_loans", :force => true do |t|
    t.integer  "loan_user_id",    :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "confirm_user_id", :precision => 38, :scale => 0
  end

  add_index "lot_loans", ["loan_user_id"], :name => "i_lot_loans_loan_user_id"

  create_table "m_categories", :force => true do |t|
    t.string   "name",                                                                           :null => false
    t.string   "code",                                                                           :null => false
    t.string   "ancestry"
    t.datetime "created_at",                                                                     :null => false
    t.datetime "updated_at",                                                                     :null => false
    t.boolean  "is_hidden",                    :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "parent_id",                    :precision => 38, :scale => 0
    t.integer  "ancestry_depth", :limit => 10, :precision => 10, :scale => 0, :default => 0,     :null => false
  end

  add_index "m_categories", ["ancestry"], :name => "index_m_categories_on_ancestry"

  create_table "marked_auctions", :force => true do |t|
    t.integer  "user_id",      :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.integer  "auction_id",   :precision => 38, :scale => 0, :null => false
    t.string   "auction_no",                                  :null => false
    t.string   "auction_name",                                :null => false
    t.string   "user_agent"
    t.string   "user_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_infos", :force => true do |t|
    t.text     "detail_link"
    t.text     "pic_link"
    t.text     "content"
    t.integer  "message_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "message_logs", :force => true do |t|
    t.integer  "message_id", :precision => 38, :scale => 0
    t.integer  "status",     :precision => 38, :scale => 0
    t.string   "no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "message_templates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.integer  "message_type", :precision => 38, :scale => 0
    t.integer  "status",       :precision => 38, :scale => 0
    t.text     "no"
    t.datetime "sent_at"
    t.string   "created_by"
    t.text     "content"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "detail_link"
  end

  create_table "news", :force => true do |t|
    t.string   "title",                                                           :null => false
    t.text     "content",                                                         :null => false
    t.integer  "reading_count", :precision => 38, :scale => 0, :default => 0,     :null => false
    t.string   "created_by",                                                      :null => false
    t.integer  "new_type",      :precision => 38, :scale => 0,                    :null => false
    t.datetime "published_at",                                                    :null => false
    t.boolean  "is_public",     :precision => 1,  :scale => 0, :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delete",     :precision => 1,  :scale => 0, :default => false, :null => false
    t.string   "link"
    t.integer  "position",      :precision => 38, :scale => 0
  end

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "office_type", :precision => 38, :scale => 0
    t.string   "address"
    t.string   "telephone"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "open_api_users", :force => true do |t|
    t.string   "open_user_no"
    t.integer  "open_api_type", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paddle_histories", :force => true do |t|
    t.integer  "auction_series_id", :precision => 38, :scale => 0
    t.integer  "user_id",           :precision => 38, :scale => 0
    t.string   "paddle_number"
    t.integer  "bid_type",          :precision => 38, :scale => 0
    t.boolean  "is_valid",          :precision => 1,  :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paddles", :force => true do |t|
    t.integer  "auction_series_id",   :precision => 38, :scale => 0
    t.string   "paddle_number"
    t.boolean  "is_valid",            :precision => 1,  :scale => 0
    t.integer  "paddle_type",         :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "particular_topic_id", :precision => 38, :scale => 0
  end

  create_table "paintings", :force => true do |t|
    t.string  "name"
    t.string  "form"
    t.string  "length"
    t.integer "num",            :precision => 38, :scale => 0
    t.text    "interpretation"
    t.text    "seal"
    t.string  "name_en"
    t.string  "form_en"
    t.integer "auction_id",     :precision => 38, :scale => 0, :null => false
    t.text    "collector_seal"
  end

  create_table "particular_topics", :force => true do |t|
    t.string   "name",                                                                                   :null => false
    t.integer  "topic_type",                           :precision => 38, :scale => 0,                    :null => false
    t.string   "created_by",                                                                             :null => false
    t.boolean  "is_show",                              :precision => 1,  :scale => 0, :default => true,  :null => false
    t.string   "name_big5"
    t.string   "name_en"
    t.text     "description"
    t.text     "description_big5"
    t.text     "description_en"
    t.string   "remark"
    t.datetime "started_at",                                                                             :null => false
    t.datetime "finished_at",                                                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interval",                             :precision => 38, :scale => 0
    t.integer  "auctions_count",                       :precision => 38, :scale => 0, :default => 0
    t.decimal  "frozen_amount",                        :precision => 10, :scale => 2
    t.boolean  "is_start",                             :precision => 1,  :scale => 0
    t.datetime "pre_shown_at"
    t.decimal  "service_fee",                          :precision => 10, :scale => 4
    t.integer  "scene_status",                         :precision => 38, :scale => 0
    t.text     "scene_status_content"
    t.integer  "owner",                                :precision => 38, :scale => 0, :default => 10000
    t.integer  "auction_series_id",                    :precision => 38, :scale => 0
    t.string   "pre_shown_addr",       :limit => 1000
    t.string   "start_addr",           :limit => 1000
    t.string   "base_url",             :limit => 100
    t.string   "avatar_file_name"
    t.string   "avatar_content_type",  :limit => 50
    t.integer  "avatar_file_size",                     :precision => 38, :scale => 0
    t.boolean  "avatar_processing",                    :precision => 1,  :scale => 0
    t.datetime "network_bid_close_at"
    t.datetime "paper_bid_close_at"
    t.integer  "site_id",                              :precision => 38, :scale => 0
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.boolean  "is_show",    :precision => 1, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners_users", :id => false, :force => true do |t|
    t.integer "partner_id", :precision => 38, :scale => 0
    t.integer "user_id",    :precision => 38, :scale => 0
  end

  create_table "pay_backs", :force => true do |t|
    t.decimal  "amount",        :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "paid_at"
    t.integer  "settlement_id", :precision => 38, :scale => 0
    t.integer  "auction_id",    :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advance_id",    :precision => 38, :scale => 0,                  :null => false
  end

  create_table "pay_ways", :force => true do |t|
    t.string   "name",                                                        :null => false
    t.boolean  "is_hide",    :precision => 1, :scale => 0, :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plate_histories", :force => true do |t|
    t.string   "plate_number"
    t.integer  "user_id",             :precision => 38, :scale => 0
    t.integer  "particular_topic_id", :precision => 38, :scale => 0
    t.decimal  "frozen_amount",       :precision => 10, :scale => 2
    t.decimal  "deductible",          :precision => 10, :scale => 2, :default => 0.0
    t.integer  "status",              :precision => 38, :scale => 0
    t.integer  "pay_frequency",       :precision => 38, :scale => 0, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plate_history_bails", :force => true do |t|
    t.integer  "plate_history_id",  :precision => 38, :scale => 0
    t.integer  "money_type",        :precision => 38, :scale => 0
    t.decimal  "money",             :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency_category"
    t.decimal  "currency_money",    :precision => 12, :scale => 2
    t.boolean  "is_back",           :precision => 1,  :scale => 0, :default => false
    t.string   "remark"
  end

  create_table "plates", :force => true do |t|
    t.string   "plate_number"
    t.integer  "status",       :precision => 38, :scale => 0
    t.boolean  "is_valid",     :precision => 1,  :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preview_auctions", :force => true do |t|
    t.integer  "user_id",                 :precision => 38, :scale => 0,                :null => false
    t.integer  "auction_id",              :precision => 38, :scale => 0,                :null => false
    t.integer  "preview_id",              :precision => 38, :scale => 0,                :null => false
    t.integer  "status",     :limit => 2, :precision => 2,  :scale => 0, :default => 0, :null => false
    t.string   "user_agent"
    t.string   "user_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "previews", :force => true do |t|
    t.integer  "user_id",                 :precision => 38, :scale => 0,                :null => false
    t.integer  "status",     :limit => 2, :precision => 2,  :scale => 0, :default => 0, :null => false
    t.string   "last_op"
    t.datetime "last_op_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_cost_details", :force => true do |t|
    t.integer  "user_id",        :precision => 38, :scale => 0, :null => false
    t.integer  "account_type",   :precision => 38, :scale => 0, :null => false
    t.decimal  "money",          :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type"
    t.integer  "relatable_id",   :precision => 38, :scale => 0
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                            :null => false
    t.string   "barcode"
    t.string   "description"
    t.string   "remark"
    t.integer  "m_category_id", :precision => 38, :scale => 0
    t.boolean  "is_selling",    :precision => 1,  :scale => 0, :default => false, :null => false
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.decimal  "price",         :precision => 12, :scale => 2, :default => 0.0,   :null => false
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.string   "english_name"
    t.string   "traditional_name"
    t.integer  "position",         :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id",       :precision => 38, :scale => 0
  end

  create_table "proxies", :force => true do |t|
    t.integer  "user_id",                          :precision => 38, :scale => 0,                :null => false
    t.string   "true_name"
    t.text     "content"
    t.string   "original_name"
    t.string   "mime"
    t.binary   "file_data"
    t.integer  "file_size",                        :precision => 38, :scale => 0
    t.string   "user_agent"
    t.string   "user_ip"
    t.integer  "status",                           :precision => 38, :scale => 0, :default => 0
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sales_rep_id",                     :precision => 38, :scale => 0
    t.integer  "contract_type",       :limit => 5, :precision => 5,  :scale => 0
    t.decimal  "settlement_percent",               :precision => 5,  :scale => 3
    t.string   "auctions_category"
    t.integer  "particular_topic_id",              :precision => 38, :scale => 0
    t.integer  "contract_id",                      :precision => 38, :scale => 0
    t.integer  "contract_number",                  :precision => 38, :scale => 0
    t.integer  "site_id",                          :precision => 38, :scale => 0
  end

  create_table "proxy_details", :force => true do |t|
    t.integer  "proxy_id",                             :precision => 38, :scale => 0
    t.string   "name"
    t.integer  "start_price",                          :precision => 38, :scale => 0
    t.text     "remark"
    t.integer  "lowest_price",                         :precision => 38, :scale => 0
    t.integer  "auction_id",                           :precision => 38, :scale => 0
    t.boolean  "can_bargain",                          :precision => 1,  :scale => 0, :default => false
    t.datetime "created_at",                                                                             :null => false
    t.datetime "updated_at",                                                                             :null => false
    t.decimal  "insurance_rate",                       :precision => 6,  :scale => 3
    t.decimal  "seller_service_fee_rate",              :precision => 6,  :scale => 3
    t.integer  "lot_fee",                 :limit => 7, :precision => 7,  :scale => 0
  end

  create_table "purchase_deliveries", :force => true do |t|
    t.integer  "purchase_order_id", :precision => 38, :scale => 0
    t.datetime "arrived_at"
    t.integer  "delivery_cost",     :precision => 38, :scale => 0
    t.integer  "amount",            :precision => 38, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "purchase_delivery_items", :force => true do |t|
    t.integer  "purchase_delivery_id",   :precision => 38, :scale => 0
    t.integer  "value",                  :precision => 38, :scale => 0
    t.integer  "amount",                 :precision => 38, :scale => 0
    t.integer  "purchase_order_item_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  create_table "purchase_order_items", :force => true do |t|
    t.integer  "purchase_order_id", :precision => 38, :scale => 0
    t.integer  "price",             :precision => 38, :scale => 0
    t.integer  "amount",            :precision => 38, :scale => 0
    t.integer  "value",             :precision => 38, :scale => 0
    t.integer  "supplier_ware_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.boolean  "status",            :precision => 1,  :scale => 0, :default => false, :null => false
  end

  create_table "purchase_orders", :force => true do |t|
    t.integer  "supplier_id",               :precision => 38, :scale => 0
    t.integer  "employee_id",               :precision => 38, :scale => 0
    t.datetime "arrival_at"
    t.datetime "buy_at"
    t.integer  "value",                     :precision => 38, :scale => 0
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.integer  "status",      :limit => 10, :precision => 10, :scale => 0, :default => 0, :null => false
  end

  create_table "qrtz_blob_triggers", :id => false, :force => true do |t|
    t.string "trigger_name",  :limit => 200, :null => false
    t.string "trigger_group", :limit => 200, :null => false
    t.binary "blob_data"
  end

  create_table "qrtz_calendars", :primary_key => "calendar_name", :force => true do |t|
    t.binary "calendar", :null => false
  end

  create_table "qrtz_cron_triggers", :id => false, :force => true do |t|
    t.string "trigger_name",    :limit => 200, :null => false
    t.string "trigger_group",   :limit => 200, :null => false
    t.string "cron_expression", :limit => 120, :null => false
    t.string "time_zone_id",    :limit => 80
  end

  create_table "qrtz_fired_triggers", :primary_key => "entry_id", :force => true do |t|
    t.string  "trigger_name",      :limit => 200,                                :null => false
    t.string  "trigger_group",     :limit => 200,                                :null => false
    t.string  "is_volatile",       :limit => 1,                                  :null => false
    t.string  "instance_name",     :limit => 200,                                :null => false
    t.integer "fired_time",        :limit => 13,  :precision => 13, :scale => 0, :null => false
    t.integer "priority",          :limit => 13,  :precision => 13, :scale => 0, :null => false
    t.string  "state",             :limit => 16,                                 :null => false
    t.string  "job_name",          :limit => 200
    t.string  "job_group",         :limit => 200
    t.string  "is_stateful",       :limit => 1
    t.string  "requests_recovery", :limit => 1
  end

  add_index "qrtz_fired_triggers", ["instance_name"], :name => "idx_qrtz_ft_trig_inst_name"
  add_index "qrtz_fired_triggers", ["is_stateful"], :name => "idx_qrtz_ft_job_stateful"
  add_index "qrtz_fired_triggers", ["is_volatile"], :name => "idx_qrtz_ft_trig_volatile"
  add_index "qrtz_fired_triggers", ["job_group"], :name => "idx_qrtz_ft_job_group"
  add_index "qrtz_fired_triggers", ["job_name"], :name => "idx_qrtz_ft_job_name"
  add_index "qrtz_fired_triggers", ["requests_recovery"], :name => "idx_qrtz_ft_job_req_recovery"
  add_index "qrtz_fired_triggers", ["trigger_group"], :name => "idx_qrtz_ft_trig_group"
  add_index "qrtz_fired_triggers", ["trigger_name", "trigger_group"], :name => "idx_qrtz_ft_trig_nm_gp"
  add_index "qrtz_fired_triggers", ["trigger_name"], :name => "idx_qrtz_ft_trig_name"

  create_table "qrtz_job_details", :id => false, :force => true do |t|
    t.string "job_name",          :limit => 200, :null => false
    t.string "job_group",         :limit => 200, :null => false
    t.string "description",       :limit => 250
    t.string "job_class_name",    :limit => 250, :null => false
    t.string "is_durable",        :limit => 1,   :null => false
    t.string "is_volatile",       :limit => 1,   :null => false
    t.string "is_stateful",       :limit => 1,   :null => false
    t.string "requests_recovery", :limit => 1,   :null => false
    t.binary "job_data"
  end

  add_index "qrtz_job_details", ["requests_recovery"], :name => "idx_qrtz_j_req_recovery"

  create_table "qrtz_job_listeners", :id => false, :force => true do |t|
    t.string "job_name",     :limit => 200, :null => false
    t.string "job_group",    :limit => 200, :null => false
    t.string "job_listener", :limit => 200, :null => false
  end

  create_table "qrtz_locks", :primary_key => "lock_name", :force => true do |t|
  end

  create_table "qrtz_paused_trigger_grps", :primary_key => "trigger_group", :force => true do |t|
  end

  create_table "qrtz_scheduler_state", :primary_key => "instance_name", :force => true do |t|
    t.integer "last_checkin_time", :limit => 13, :precision => 13, :scale => 0, :null => false
    t.integer "checkin_interval",  :limit => 13, :precision => 13, :scale => 0, :null => false
  end

  create_table "qrtz_simple_triggers", :id => false, :force => true do |t|
    t.string  "trigger_name",    :limit => 200,                                :null => false
    t.string  "trigger_group",   :limit => 200,                                :null => false
    t.integer "repeat_count",    :limit => 7,   :precision => 7,  :scale => 0, :null => false
    t.integer "repeat_interval", :limit => 12,  :precision => 12, :scale => 0, :null => false
    t.integer "times_triggered", :limit => 10,  :precision => 10, :scale => 0, :null => false
  end

  create_table "qrtz_trigger_listeners", :id => false, :force => true do |t|
    t.string "trigger_name",     :limit => 200, :null => false
    t.string "trigger_group",    :limit => 200, :null => false
    t.string "trigger_listener", :limit => 200, :null => false
  end

  create_table "qrtz_triggers", :id => false, :force => true do |t|
    t.string  "trigger_name",   :limit => 200,                                :null => false
    t.string  "trigger_group",  :limit => 200,                                :null => false
    t.string  "job_name",       :limit => 200,                                :null => false
    t.string  "job_group",      :limit => 200,                                :null => false
    t.string  "is_volatile",    :limit => 1,                                  :null => false
    t.string  "description",    :limit => 250
    t.integer "next_fire_time", :limit => 13,  :precision => 13, :scale => 0
    t.integer "prev_fire_time", :limit => 13,  :precision => 13, :scale => 0
    t.integer "priority",       :limit => 13,  :precision => 13, :scale => 0
    t.string  "trigger_state",  :limit => 16,                                 :null => false
    t.string  "trigger_type",   :limit => 8,                                  :null => false
    t.integer "start_time",     :limit => 13,  :precision => 13, :scale => 0, :null => false
    t.integer "end_time",       :limit => 13,  :precision => 13, :scale => 0
    t.string  "calendar_name",  :limit => 200
    t.integer "misfire_instr",  :limit => 2,   :precision => 2,  :scale => 0
    t.binary  "job_data"
  end

  add_index "qrtz_triggers", ["is_volatile"], :name => "idx_qrtz_t_volatile"
  add_index "qrtz_triggers", ["next_fire_time", "trigger_state"], :name => "idx_qrtz_t_nft_st"
  add_index "qrtz_triggers", ["next_fire_time"], :name => "idx_qrtz_t_next_fire_time"
  add_index "qrtz_triggers", ["trigger_state"], :name => "idx_qrtz_t_state"

  create_table "recommend_auction_orders", :force => true do |t|
    t.integer  "auction_order_id", :precision => 38, :scale => 0,                    :null => false
    t.boolean  "is_show",          :precision => 1,  :scale => 0, :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommend_auctions", :force => true do |t|
    t.integer  "auction_id", :precision => 38, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refund_requests", :force => true do |t|
    t.integer  "user_id",                    :precision => 38, :scale => 0,                  :null => false
    t.integer  "user_bank_id",               :precision => 38, :scale => 0
    t.integer  "status",                     :precision => 38, :scale => 0, :default => 0,   :null => false
    t.integer  "refund_way",                 :precision => 38, :scale => 0,                  :null => false
    t.string   "user_name"
    t.string   "bank_name"
    t.string   "bank_number"
    t.string   "bank_owner"
    t.string   "verified_by"
    t.datetime "verified_at"
    t.datetime "refused_at"
    t.string   "refused_by"
    t.string   "refused_reason"
    t.string   "remark"
    t.decimal  "amount",                     :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "created_by"
    t.datetime "appoint_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_address_id",            :precision => 38, :scale => 0
    t.string   "zip_code"
    t.string   "address"
    t.string   "mobile"
    t.string   "telephone"
    t.string   "receiver_name"
    t.integer  "plate_history_id",           :precision => 38, :scale => 0
    t.integer  "company_bank_id",            :precision => 38, :scale => 0
    t.decimal  "handling_fee",               :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "alipay_number"
    t.integer  "security_deposit_detail_id", :precision => 38, :scale => 0
  end

  create_table "remit_notifications", :force => true do |t|
    t.integer  "user_id",                                  :precision => 38, :scale => 0,                   :null => false
    t.string   "user_name"
    t.decimal  "money",                                    :precision => 12, :scale => 2
    t.datetime "remit_at"
    t.decimal  "process_costs",                            :precision => 12, :scale => 2, :default => 0.0,  :null => false
    t.integer  "status",                                   :precision => 38, :scale => 0,                   :null => false
    t.integer  "category",                                 :precision => 38, :scale => 0,                   :null => false
    t.integer  "company_bank_id",                          :precision => 38, :scale => 0
    t.datetime "verified_at"
    t.string   "verified_by"
    t.datetime "refused_at"
    t.string   "refused_by"
    t.string   "refused_reason"
    t.boolean  "is_valid",                                 :precision => 1,  :scale => 0, :default => true, :null => false
    t.string   "use"
    t.string   "remark"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id",                               :precision => 38, :scale => 0
    t.integer  "province_id",                              :precision => 38, :scale => 0
    t.integer  "city_id",                                  :precision => 38, :scale => 0
    t.integer  "plate_history_id",                         :precision => 38, :scale => 0
    t.integer  "currency",                   :limit => 10, :precision => 10, :scale => 0
    t.decimal  "currency_money",                           :precision => 12, :scale => 2
    t.decimal  "currency_rate",                            :precision => 10, :scale => 4
    t.string   "sender_account"
    t.integer  "security_deposit_detail_id",               :precision => 38, :scale => 0
    t.integer  "district_id",                              :precision => 38, :scale => 0
    t.string   "area_name"
  end

  add_index "remit_notifications", ["category"], :name => "i_remit_notifications_category"
  add_index "remit_notifications", ["company_bank_id"], :name => "i_rem_not_com_ban_id"
  add_index "remit_notifications", ["remit_at"], :name => "i_remit_notifications_remit_at"
  add_index "remit_notifications", ["status"], :name => "i_remit_notifications_status"
  add_index "remit_notifications", ["user_id"], :name => "i_remit_notifications_user_id"
  add_index "remit_notifications", ["user_name"], :name => "i_rem_not_use_nam"

  create_table "reservations", :force => true do |t|
    t.integer  "user_id",    :precision => 38, :scale => 0,                :null => false
    t.string   "user_name"
    t.text     "content",                                                  :null => false
    t.integer  "status",     :precision => 38, :scale => 0, :default => 0, :null => false
    t.integer  "thing_type", :precision => 38, :scale => 0,                :null => false
    t.datetime "reserve_at",                                               :null => false
    t.datetime "op_at"
    t.string   "op"
    t.string   "created_by"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reset_passwords", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0,                    :null => false
    t.string   "verified_code"
    t.datetime "send_at"
    t.boolean  "reset_type",    :precision => 1,  :scale => 0, :default => false
    t.boolean  "reset_way",     :precision => 1,  :scale => 0, :default => false
    t.boolean  "status",        :precision => 1,  :scale => 0, :default => false
    t.string   "user_agent"
    t.string   "user_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "return_auction_requests", :force => true do |t|
    t.integer  "unite_consign_id",     :precision => 38, :scale => 0
    t.integer  "user_id",              :precision => 38, :scale => 0,                    :null => false
    t.integer  "auction_id",           :precision => 38, :scale => 0,                    :null => false
    t.integer  "auction_order_id",     :precision => 38, :scale => 0,                    :null => false
    t.string   "user_name"
    t.string   "auction_no",                                                             :null => false
    t.string   "auction_name",                                                           :null => false
    t.integer  "status",               :precision => 38, :scale => 0, :default => 0,     :null => false
    t.text     "postscripts"
    t.text     "reason"
    t.text     "pass_reason"
    t.boolean  "before_limit",         :precision => 1,  :scale => 0,                    :null => false
    t.datetime "passed_at"
    t.integer  "pass_type",            :precision => 38, :scale => 0
    t.string   "passed_by"
    t.datetime "refused_at"
    t.string   "refused_by"
    t.boolean  "if_passed_by_finance", :precision => 1,  :scale => 0, :default => false
    t.datetime "passed_by_finance_at"
    t.string   "passed_by_finance_op"
    t.datetime "created_at"
    t.string   "created_by"
    t.datetime "unite_consign_at"
    t.boolean  "waive_proccess_fee",   :precision => 1,  :scale => 0
    t.boolean  "waive_custodian_fee",  :precision => 1,  :scale => 0
  end

  create_table "roles", :force => true do |t|
    t.string  "name",        :limit => 30,                                                  :null => false
    t.integer "position",                  :precision => 38, :scale => 0, :default => 1
    t.boolean "assignable",                :precision => 1,  :scale => 0, :default => true
    t.integer "builtin",                   :precision => 38, :scale => 0, :default => 0,    :null => false
    t.text    "permissions"
  end

  create_table "rpt_agree_buyers", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "records_date",                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpt_deposits", :force => true do |t|
    t.integer  "user_id",           :precision => 38, :scale => 0, :null => false
    t.decimal  "amount",            :precision => 12, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id", :precision => 38, :scale => 0
    t.integer  "relatable_id",      :precision => 38, :scale => 0
    t.string   "relatable_type"
    t.integer  "pay_way_id",        :precision => 38, :scale => 0
  end

  create_table "rpt_opposition_buyers", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "records_date",                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpt_payments", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id",   :precision => 38, :scale => 0
    t.integer  "auction_order_id",    :precision => 38, :scale => 0
    t.integer  "auction_category_id", :precision => 38, :scale => 0
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "service_fee",         :precision => 12, :scale => 2, :default => 0.0, :null => false
  end

  create_table "rpt_penalties", :force => true do |t|
    t.integer  "buyer_id",            :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.integer  "seller_id",           :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id",   :precision => 38, :scale => 0
  end

  create_table "rpt_postages", :force => true do |t|
    t.integer  "user_id",           :precision => 38, :scale => 0,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id", :precision => 38, :scale => 0
    t.integer  "unite_consign_id",  :precision => 38, :scale => 0
    t.decimal  "post_fee",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "insure_fee",        :precision => 12, :scale => 2, :default => 0.0, :null => false
  end

  create_table "rpt_recover_post_settlements", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "actual_amount",       :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "process_cost_fee",    :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "custodial_fee",       :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "taxes",               :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "benefits",            :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "records_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpt_refund_pre_settlements", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id",   :precision => 38, :scale => 0,                  :null => false
  end

  create_table "rpt_settlements", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",       :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_category_id", :precision => 38, :scale => 0,                  :null => false
    t.integer  "settlement_type",     :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "end_price",           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "taxes",               :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal  "benefits",            :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "other"
    t.datetime "records_date",                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpt_storage_fees", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0, :null => false
    t.string   "contract_type",                                      :null => false
    t.decimal  "amount",              :precision => 12, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "auction_category_id", :precision => 38, :scale => 0
    t.integer  "account_detail_id",   :precision => 38, :scale => 0
  end

  create_table "rpt_withdraws", :force => true do |t|
    t.integer  "user_id",           :precision => 38, :scale => 0, :null => false
    t.string   "withdraw_way",                                     :null => false
    t.decimal  "amount",            :precision => 12, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id", :precision => 38, :scale => 0
    t.integer  "relatable_id",      :precision => 38, :scale => 0
    t.string   "relatable_type"
  end

  create_table "scene_current_auctions", :force => true do |t|
    t.integer  "auction_id",                        :precision => 38, :scale => 0
    t.integer  "current_price",                     :precision => 38, :scale => 0, :default => 0
    t.integer  "hkd",                               :precision => 38, :scale => 0, :default => 0
    t.integer  "usd",                               :precision => 38, :scale => 0, :default => 0
    t.integer  "ntd",                               :precision => 38, :scale => 0, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "particular_topic_id", :limit => 20
  end

  create_table "security_deposit_details", :force => true do |t|
    t.integer  "security_deposit_id",      :precision => 38, :scale => 0
    t.integer  "amount",                   :precision => 38, :scale => 0
    t.integer  "pay_way",                  :precision => 38, :scale => 0
    t.integer  "currency_category_id",     :precision => 38, :scale => 0
    t.integer  "original_currency_amount", :precision => 38, :scale => 0
    t.string   "remark"
    t.integer  "bid_type",                 :precision => 38, :scale => 0
    t.boolean  "is_back",                  :precision => 1,  :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "remit_notification_id",    :precision => 38, :scale => 0
    t.integer  "refund_request_id",        :precision => 38, :scale => 0
    t.integer  "unite_payment_id",         :precision => 38, :scale => 0
    t.decimal  "exchange_rate",            :precision => 20, :scale => 10
  end

  create_table "security_deposits", :force => true do |t|
    t.decimal  "amount",            :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.integer  "user_id",           :precision => 38, :scale => 0
    t.integer  "auction_series_id", :precision => 38, :scale => 0
    t.integer  "admin_id",          :precision => 38, :scale => 0
    t.integer  "due_amount",        :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "var",                                                     :null => false
    t.integer  "thing_id",                 :precision => 38, :scale => 0
    t.string   "thing_type", :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "i_set_thi_typ_thi_id_var"

  create_table "settlements", :force => true do |t|
    t.integer  "user_id",                              :precision => 38, :scale => 0,                  :null => false
    t.integer  "settlement_type",                      :precision => 38, :scale => 0,                  :null => false
    t.string   "user_number"
    t.integer  "contract_id",                          :precision => 38, :scale => 0,                  :null => false
    t.integer  "contract_type",                        :precision => 38, :scale => 0,                  :null => false
    t.integer  "auction_id",                           :precision => 38, :scale => 0,                  :null => false
    t.string   "auction_no",                                                                           :null => false
    t.integer  "auction_order_id",                     :precision => 38, :scale => 0
    t.integer  "category_id",                          :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",                               :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "process_cost_fee",                     :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "custodial_fee",                        :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "timeout_custodial_fee",                :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "commission_fee",                       :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "taxes_fee",                            :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "insurance_fee",                        :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_detail_id",                    :precision => 38, :scale => 0
    t.decimal  "start_price",                          :precision => 12, :scale => 2
    t.decimal  "end_price",                            :precision => 12, :scale => 2
    t.decimal  "compensation",                         :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "lot_fee",                              :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.decimal  "no_taxes_amount",                      :precision => 9,  :scale => 2, :default => 0.0, :null => false
    t.string   "category_code_name"
    t.decimal  "adjustment",                           :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "topic_name",            :limit => 100
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "description"
    t.integer  "site_type",   :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "sms_logs", :force => true do |t|
    t.integer  "sender",     :limit => 11, :precision => 11, :scale => 0
    t.text     "receives"
    t.string   "content"
    t.string   "code"
    t.text     "msg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id",  :limit => 11, :precision => 11, :scale => 0
  end

  create_table "special_lots", :id => false, :force => true do |t|
    t.integer "auction_id",          :precision => 38, :scale => 0
    t.integer "particular_topic_id", :precision => 38, :scale => 0
  end

  add_index "special_lots", ["auction_id"], :name => "i_special_lots_auction_id"
  add_index "special_lots", ["particular_topic_id"], :name => "i_spe_lot_par_top_id"

  create_table "spiders", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "base_url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size",    :precision => 38, :scale => 0
    t.boolean  "avatar_processing",   :precision => 1,  :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",            :precision => 38, :scale => 0
  end

  create_table "standard_auction_names", :force => true do |t|
    t.string   "product_name",                                       :null => false
    t.string   "category_code"
    t.string   "product_name_py"
    t.string   "product_name_ft"
    t.integer  "category_id",         :precision => 38, :scale => 0
    t.string   "position"
    t.string   "created_by"
    t.string   "feature"
    t.integer  "auction_standard_id", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_go_abroad",       :precision => 1,  :scale => 0
  end

  add_index "standard_auction_names", ["product_name"], :name => "i_sta_auc_nam_pro_nam"

  create_table "storage_actions", :force => true do |t|
    t.integer  "storage_id",     :precision => 38, :scale => 0, :null => false
    t.integer  "created_by",     :precision => 38, :scale => 0, :null => false
    t.integer  "get_by",         :precision => 38, :scale => 0
    t.integer  "access_by",      :precision => 38, :scale => 0
    t.integer  "action_status",  :precision => 38, :scale => 0
    t.integer  "action_type",    :precision => 38, :scale => 0
    t.integer  "location_id",    :precision => 38, :scale => 0
    t.string   "relatable_type"
    t.integer  "relatable_id",   :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_check_details", :force => true do |t|
    t.integer  "storage_check_id", :precision => 38, :scale => 0
    t.integer  "location_id",      :precision => 38, :scale => 0
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_check_results", :force => true do |t|
    t.integer  "storage_check_id",              :precision => 38, :scale => 0
    t.integer  "location_id",                   :precision => 38, :scale => 0
    t.integer  "storage_id",                    :precision => 38, :scale => 0
    t.integer  "status",           :limit => 2, :precision => 2,  :scale => 0
    t.string   "barcode"
    t.string   "auction_name"
    t.string   "op_remark"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_check_temporaries", :force => true do |t|
    t.integer "storage_check_id",              :precision => 38, :scale => 0
    t.integer "location_id",                   :precision => 38, :scale => 0
    t.integer "status",           :limit => 2, :precision => 2,  :scale => 0, :default => 0
    t.string  "barcode"
    t.text    "remark"
  end

  create_table "storage_checks", :force => true do |t|
    t.integer  "check_type",    :limit => 5,  :precision => 5,  :scale => 0
    t.integer  "status",        :limit => 5,  :precision => 5,  :scale => 0, :default => 0
    t.datetime "checked_at"
    t.datetime "op_at"
    t.text     "remark"
    t.datetime "created_at"
    t.integer  "count",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "correct_count", :limit => 10, :precision => 10, :scale => 0
  end

  create_table "storages", :force => true do |t|
    t.string   "barcode"
    t.integer  "location_id", :precision => 38, :scale => 0, :null => false
    t.integer  "contract_id", :precision => 38, :scale => 0, :null => false
    t.text     "remark"
    t.integer  "created_by",  :precision => 38, :scale => 0
    t.integer  "amount",      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storages", ["amount"], :name => "index_storages_on_amount"
  add_index "storages", ["barcode"], :name => "index_storages_on_barcode"

  create_table "supplier_wares", :force => true do |t|
    t.integer  "product_id",  :precision => 38, :scale => 0
    t.integer  "supplier_id", :precision => 38, :scale => 0
    t.string   "name"
    t.decimal  "last_price",  :precision => 12, :scale => 2
    t.string   "barcode"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "remark"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "reg_number"
    t.string   "org_code"
    t.string   "tel"
    t.string   "fax"
    t.string   "contact"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.decimal  "reference_price", :precision => 12, :scale => 2
  end

  create_table "system_activities", :force => true do |t|
    t.integer  "activity_type", :precision => 38, :scale => 0
    t.text     "content"
    t.integer  "admin_id",      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "system_activities", ["admin_id"], :name => "i_system_activities_admin_id"

  create_table "system_params", :force => true do |t|
    t.string  "key"
    t.string  "value",    :limit => 3000
    t.string  "explain",  :limit => 3000
    t.boolean "is_valid",                 :precision => 1, :scale => 0, :default => false, :null => false
  end

  add_index "system_params", ["key"], :name => "index_system_params_on_key"

  create_table "tradition_records", :force => true do |t|
    t.integer  "user_id",        :precision => 38, :scale => 0,                      :null => false
    t.integer  "auction_id",     :precision => 38, :scale => 0,                      :null => false
    t.integer  "seller_user_id", :precision => 38, :scale => 0,                      :null => false
    t.decimal  "deposit",        :precision => 12, :scale => 2, :default => 50000.0, :null => false
    t.decimal  "end_price",      :precision => 12, :scale => 2,                      :null => false
    t.integer  "status",         :precision => 38, :scale => 0, :default => 0,       :null => false
    t.string   "auction_no",                                                         :null => false
    t.datetime "deal_at",                                                            :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tradition_records", ["auction_no"], :name => "i_tradition_records_auction_no"

  create_table "transaction_records", :force => true do |t|
    t.string   "product_name",                                     :null => false
    t.decimal  "transaction_price", :precision => 12, :scale => 2, :null => false
    t.datetime "transaction_date",                                 :null => false
    t.string   "data_from",                                        :null => false
    t.string   "data_refer_link"
    t.integer  "category_id",       :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", :force => true do |t|
    t.integer  "remitter_id",    :precision => 38, :scale => 0,                  :null => false
    t.integer  "beneficiary_id", :precision => 38, :scale => 0,                  :null => false
    t.decimal  "money",          :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.string   "created_by"
    t.integer  "status",         :precision => 38, :scale => 0, :default => 0
    t.string   "verified_by"
    t.datetime "verified_at"
    t.datetime "refused_at"
    t.string   "refused_by"
    t.string   "refused_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unite_consign_remove_records", :force => true do |t|
    t.integer  "unite_consign_id", :precision => 38, :scale => 0
    t.integer  "auction_id",       :precision => 38, :scale => 0
    t.boolean  "is_valid",         :precision => 1,  :scale => 0, :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unite_consigns", :force => true do |t|
    t.integer  "user_id",           :precision => 38, :scale => 0
    t.string   "receiver_name",                                                       :null => false
    t.integer  "status",            :precision => 38, :scale => 0, :default => 0,     :null => false
    t.integer  "deliver_way",       :precision => 38, :scale => 0
    t.datetime "deliver_at"
    t.datetime "finished_at"
    t.string   "address"
    t.string   "zip_code"
    t.string   "deliver_code"
    t.string   "mobile"
    t.string   "telephone"
    t.decimal  "post_fee",          :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "insure_fee",        :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_order_money", :precision => 12, :scale => 2,                    :null => false
    t.decimal  "pre_post_fee",      :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.datetime "created_at"
    t.string   "op"
    t.string   "created_by"
    t.integer  "parent_id",         :precision => 38, :scale => 0
    t.text     "auction_numbers"
    t.text     "remark"
    t.boolean  "is_delete",         :precision => 1,  :scale => 0, :default => false, :null => false
    t.datetime "drop_in_time"
    t.integer  "partner_id",        :precision => 38, :scale => 0, :default => 10000
    t.integer  "office_id",         :precision => 38, :scale => 0
  end

  create_table "unite_payment_details", :force => true do |t|
    t.integer  "pay_way",          :limit => 2,  :precision => 2,  :scale => 0
    t.decimal  "amount",                         :precision => 12, :scale => 2
    t.integer  "unite_payment_id", :limit => 11, :precision => 11, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unite_payment_details", ["unite_payment_id"], :name => "ind_unie_payt_dets_fk"

  create_table "unite_payments", :force => true do |t|
    t.integer  "user_id",        :precision => 38, :scale => 0,                  :null => false
    t.string   "user_name"
    t.decimal  "pay_amount",     :precision => 12, :scale => 2
    t.string   "op"
    t.string   "pay_way"
    t.datetime "created_at"
    t.text     "remark"
    t.decimal  "discount",       :precision => 5,  :scale => 4, :default => 1.0
    t.decimal  "discount_money", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "deduct_money",   :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "user_addresses", :force => true do |t|
    t.integer  "user_id",     :precision => 38, :scale => 0,                    :null => false
    t.string   "user_name",                                                     :null => false
    t.string   "zip_code"
    t.string   "address"
    t.string   "mobile"
    t.string   "telephone"
    t.boolean  "is_default",  :precision => 1,  :scale => 0, :default => false
    t.boolean  "is_valid",    :precision => 1,  :scale => 0, :default => true
    t.datetime "last_use_at"
    t.integer  "country_id",  :precision => 38, :scale => 0
    t.integer  "province_id", :precision => 38, :scale => 0,                    :null => false
    t.integer  "city_id",     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delete",   :precision => 1,  :scale => 0, :default => false, :null => false
    t.string   "area_name"
    t.integer  "district_id", :precision => 38, :scale => 0
  end

  add_index "user_addresses", ["district_id"], :name => "i_user_addresses_district_id"

  create_table "user_banks", :force => true do |t|
    t.integer  "user_id",          :precision => 38, :scale => 0,                    :null => false
    t.string   "user_name"
    t.string   "bank_name",                                                          :null => false
    t.string   "inital_bank_name"
    t.string   "bank_number",                                                        :null => false
    t.string   "bank_owner",                                                         :null => false
    t.integer  "country_id",       :precision => 38, :scale => 0
    t.integer  "province_id",      :precision => 38, :scale => 0
    t.integer  "city_id",          :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delete",        :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "district_id",      :precision => 38, :scale => 0
    t.string   "area_name"
  end

  create_table "user_coupon_details", :force => true do |t|
    t.integer  "user_coupon_id",     :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "user_id",            :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "status",             :limit => 2,  :precision => 2,  :scale => 0, :null => false
    t.integer  "coupon_category_id", :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "coupon_value_id",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "coupon_unit_id",     :limit => 11, :precision => 11, :scale => 0, :null => false
    t.datetime "invalid_at",                                                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_coupon_details", ["status", "invalid_at", "user_id", "coupon_category_id", "coupon_value_id", "coupon_unit_id"], :name => "ind_user_coun_dets_all"

  create_table "user_coupons", :force => true do |t|
    t.integer  "user_id",    :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer  "amount",     :limit => 11, :precision => 11, :scale => 0
    t.decimal  "money",                    :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_id_pictures", :force => true do |t|
    t.integer  "user_id",             :precision => 38, :scale => 0
    t.string   "base_url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size",    :precision => 38, :scale => 0
    t.boolean  "avatar_processing",   :precision => 1,  :scale => 0
    t.integer  "position",            :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id",                          :precision => 38, :scale => 0,                    :null => false
    t.integer  "sex",                :limit => 2,  :precision => 2,  :scale => 0
    t.string   "telephone",          :limit => 30
    t.string   "id_number",          :limit => 30
    t.string   "qq",                 :limit => 20
    t.string   "address"
    t.integer  "country_id",                       :precision => 38, :scale => 0
    t.integer  "province_id",                      :precision => 38, :scale => 0
    t.integer  "city_id",                          :precision => 38, :scale => 0
    t.datetime "locked_at"
    t.string   "locked_by"
    t.text     "locked_reason"
    t.datetime "verified_at"
    t.string   "verified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
    t.integer  "id_type",                          :precision => 38, :scale => 0
    t.boolean  "has_id_number_copy",               :precision => 1,  :scale => 0, :default => false
    t.string   "alipay_number"
    t.text     "remark"
    t.string   "area_name"
    t.integer  "district_id",                      :precision => 38, :scale => 0
  end

  add_index "user_profiles", ["city_id"], :name => "index_user_profiles_on_city_id"
  add_index "user_profiles", ["district_id"], :name => "i_user_profiles_district_id"
  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "user_number"
    t.integer  "register_type",          :limit => 2,   :precision => 2,  :scale => 0,                    :null => false
    t.integer  "is_verified_by_tel",                    :precision => 38, :scale => 0, :default => 0,     :null => false
    t.boolean  "is_verified_by_email",                  :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "login_count",                           :precision => 38, :scale => 0, :default => 0,     :null => false
    t.string   "crypted_password",                                                                        :null => false
    t.string   "pay_password"
    t.string   "email",                  :limit => 100
    t.string   "mobile",                 :limit => 30
    t.string   "true_name",              :limit => 100
    t.string   "nick_name"
    t.string   "register_ip",            :limit => 100
    t.string   "register_verified_code"
    t.string   "last_login_ip"
    t.boolean  "register_status",                       :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_locked",                             :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_foreign",                            :precision => 1,  :scale => 0, :default => false, :null => false
    t.decimal  "process_cost",                          :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "account",                               :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "frozen_amout",                          :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.datetime "last_login_at"
    t.integer  "lock_version",                          :precision => 38, :scale => 0, :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mobile_cc",                                                            :default => "86",  :null => false
    t.boolean  "company_support",                       :precision => 1,  :scale => 0, :default => false
    t.boolean  "is_manual_cancel_order",                :precision => 1,  :scale => 0, :default => false, :null => false
    t.integer  "open_api_user_id",                      :precision => 38, :scale => 0
    t.string   "simp_name",              :limit => 100
    t.string   "rewrite_ip",             :limit => 100
    t.decimal  "advance_amount",                        :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.integer  "user_type",              :limit => 5,   :precision => 5,  :scale => 0, :default => 0,     :null => false
    t.boolean  "vip",                                   :precision => 1,  :scale => 0
    t.boolean  "is_company_number",                     :precision => 1,  :scale => 0
    t.integer  "clerk_id",                              :precision => 38, :scale => 0
    t.decimal  "bail_rate",                             :precision => 12, :scale => 2, :default => 0.01
    t.decimal  "credits",                               :precision => 12, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "frozen_credits",                        :precision => 12, :scale => 2, :default => 0.0,   :null => false
  end

  add_index "users", ["company_support"], :name => "ind_user_comp_supp"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["true_name"], :name => "index_users_on_true_name"
  add_index "users", ["user_number"], :name => "index_users_on_user_number"

  create_table "virtual_recharges", :force => true do |t|
    t.integer  "amount",                :precision => 38, :scale => 0
    t.integer  "user_id",               :precision => 38, :scale => 0
    t.integer  "remit_notification_id", :precision => 38, :scale => 0
    t.integer  "account_detail_id",     :precision => 38, :scale => 0
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "web_message_comments", :force => true do |t|
    t.integer  "web_message_id",         :precision => 38, :scale => 0,                    :null => false
    t.text     "content",                                                                  :null => false
    t.string   "created_by",                                                               :null => false
    t.integer  "sender_id",              :precision => 38, :scale => 0,                    :null => false
    t.string   "send_from",                                                                :null => false
    t.boolean  "is_read",                :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_deleted_by_receiver", :precision => 1,  :scale => 0, :default => false
    t.boolean  "is_deleted_by_sender",   :precision => 1,  :scale => 0, :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "web_messages", :force => true do |t|
    t.integer  "receiver_id",                           :precision => 38, :scale => 0
    t.integer  "sender_id",                             :precision => 38, :scale => 0,                    :null => false
    t.integer  "status",                                :precision => 38, :scale => 0, :default => 0,     :null => false
    t.integer  "role_id",                               :precision => 38, :scale => 0
    t.integer  "message_type",                          :precision => 38, :scale => 0,                    :null => false
    t.string   "title",                                                                                   :null => false
    t.string   "last_reply_from"
    t.string   "send_from",                                                                               :null => false
    t.boolean  "can_reply",                             :precision => 1,  :scale => 0, :default => true,  :null => false
    t.boolean  "is_read",                               :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_draft",                              :precision => 1,  :scale => 0,                    :null => false
    t.boolean  "is_trash",                              :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_deleted_by_sender",                  :precision => 1,  :scale => 0, :default => false, :null => false
    t.boolean  "is_deleted_by_receiver",                :precision => 1,  :scale => 0, :default => false, :null => false
    t.text     "content",                                                                                 :null => false
    t.datetime "will_receive_at",                                                                         :null => false
    t.datetime "read_at"
    t.datetime "last_reply_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "user_reply",                            :precision => 1,  :scale => 0, :default => false
    t.datetime "user_reply_at"
    t.string   "source_uri",             :limit => 500
    t.datetime "expiration_date"
  end

  create_table "web_payments", :force => true do |t|
    t.string   "billno",          :limit => 100
    t.string   "ips_billno",      :limit => 100
    t.integer  "user_id",                         :precision => 38, :scale => 0,                  :null => false
    t.decimal  "amount",                          :precision => 10, :scale => 2, :default => 0.0
    t.integer  "status",          :limit => 2,    :precision => 2,  :scale => 0, :default => 0
    t.integer  "payment_way",                     :precision => 38, :scale => 0, :default => 0
    t.integer  "expenditure_way",                 :precision => 38, :scale => 0, :default => 0
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
    t.string   "order_ids",       :limit => 4000
  end

  add_index "web_payments", ["billno"], :name => "web_payments_billno_unique", :unique => true

  create_table "worker_groups", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "remark",                                    :null => false
    t.integer  "group_type", :precision => 38, :scale => 0, :null => false
    t.string   "created_by",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_account_details_21", :id => false, :force => true do |t|
    t.integer  "id",             :precision => 38, :scale => 0, :null => false
    t.integer  "user_id",        :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.integer  "direction",      :precision => 38, :scale => 0, :null => false
    t.decimal  "money",          :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type",                                :null => false
    t.integer  "relatable_id",   :precision => 38, :scale => 0, :null => false
    t.integer  "description",    :precision => 38, :scale => 0
    t.string   "remark"
    t.boolean  "is_valid",       :precision => 1,  :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_account_details_bc", :id => false, :force => true do |t|
    t.integer  "id",             :precision => 38, :scale => 0, :null => false
    t.integer  "user_id",        :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.integer  "direction",      :precision => 38, :scale => 0, :null => false
    t.decimal  "money",          :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type",                                :null => false
    t.integer  "relatable_id",   :precision => 38, :scale => 0, :null => false
    t.integer  "description",    :precision => 38, :scale => 0
    t.string   "remark"
    t.boolean  "is_valid",       :precision => 1,  :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_auctions", :id => false, :force => true do |t|
    t.integer  "id",                                      :precision => 38, :scale => 0, :null => false
    t.integer  "contract_id",                             :precision => 38, :scale => 0, :null => false
    t.string   "auction_no",                                                             :null => false
    t.string   "name",                                                                   :null => false
    t.string   "name_big5"
    t.string   "name_en"
    t.integer  "category_id",                             :precision => 38, :scale => 0, :null => false
    t.integer  "auction_quantity_id",                     :precision => 38, :scale => 0
    t.integer  "particular_topic_id",                     :precision => 38, :scale => 0
    t.integer  "apply_for_re_commission_id",              :precision => 38, :scale => 0
    t.integer  "status",                     :limit => 2, :precision => 2,  :scale => 0, :null => false
    t.text     "description"
    t.text     "description_big5"
    t.text     "description_en"
    t.integer  "auction_type",               :limit => 2, :precision => 2,  :scale => 0, :null => false
    t.datetime "start_at"
    t.datetime "pre_shown_at"
    t.datetime "end_at"
    t.datetime "re_commissioned_time"
    t.decimal  "process_cost_fee",                        :precision => 12, :scale => 2, :null => false
    t.decimal  "start_price",                             :precision => 12, :scale => 2
    t.decimal  "end_price",                               :precision => 12, :scale => 2
    t.decimal  "buyer_service_fee_percent",               :precision => 5,  :scale => 3, :null => false
    t.decimal  "custodial_fee",                           :precision => 12, :scale => 2, :null => false
    t.decimal  "timeout_custodial_fee",                   :precision => 12, :scale => 2, :null => false
    t.boolean  "is_settlement",                           :precision => 1,  :scale => 0, :null => false
    t.integer  "click_count",                             :precision => 38, :scale => 0, :null => false
    t.boolean  "can_bargain",                             :precision => 1,  :scale => 0, :null => false
    t.string   "remark"
    t.string   "barcode"
    t.integer  "re_commissioned",                         :precision => 38, :scale => 0
    t.boolean  "is_changed",                              :precision => 1,  :scale => 0, :null => false
    t.text     "active_changes"
    t.integer  "auction_standard_id",                     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_go_abroad",                           :precision => 1,  :scale => 0
    t.integer  "lock_version",                            :precision => 38, :scale => 0, :null => false
    t.string   "lot_number"
    t.string   "tradition_hope_price"
    t.integer  "tradition_status",                        :precision => 38, :scale => 0
    t.integer  "partner_id",                              :precision => 38, :scale => 0
    t.integer  "department",                 :limit => 5, :precision => 5,  :scale => 0
  end

  create_table "z_auctions_chepai", :id => false, :force => true do |t|
    t.integer  "id",                                      :precision => 38, :scale => 0, :null => false
    t.integer  "contract_id",                             :precision => 38, :scale => 0, :null => false
    t.string   "auction_no",                                                             :null => false
    t.string   "name",                                                                   :null => false
    t.string   "name_big5"
    t.string   "name_en"
    t.integer  "category_id",                             :precision => 38, :scale => 0, :null => false
    t.integer  "auction_quantity_id",                     :precision => 38, :scale => 0
    t.integer  "particular_topic_id",                     :precision => 38, :scale => 0
    t.integer  "apply_for_re_commission_id",              :precision => 38, :scale => 0
    t.integer  "status",                     :limit => 2, :precision => 2,  :scale => 0, :null => false
    t.text     "description"
    t.text     "description_big5"
    t.text     "description_en"
    t.integer  "auction_type",               :limit => 2, :precision => 2,  :scale => 0, :null => false
    t.datetime "start_at"
    t.datetime "pre_shown_at"
    t.datetime "end_at"
    t.datetime "re_commissioned_time"
    t.decimal  "process_cost_fee",                        :precision => 12, :scale => 2, :null => false
    t.decimal  "start_price",                             :precision => 12, :scale => 2
    t.decimal  "end_price",                               :precision => 12, :scale => 2
    t.decimal  "buyer_service_fee_percent",               :precision => 5,  :scale => 3, :null => false
    t.decimal  "custodial_fee",                           :precision => 12, :scale => 2, :null => false
    t.decimal  "timeout_custodial_fee",                   :precision => 12, :scale => 2, :null => false
    t.boolean  "is_settlement",                           :precision => 1,  :scale => 0, :null => false
    t.integer  "click_count",                             :precision => 38, :scale => 0, :null => false
    t.boolean  "can_bargain",                             :precision => 1,  :scale => 0, :null => false
    t.string   "remark"
    t.string   "barcode"
    t.integer  "re_commissioned",                         :precision => 38, :scale => 0
    t.boolean  "is_changed",                              :precision => 1,  :scale => 0, :null => false
    t.text     "active_changes"
    t.integer  "auction_standard_id",                     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_go_abroad",                           :precision => 1,  :scale => 0
    t.integer  "lock_version",                            :precision => 38, :scale => 0, :null => false
    t.string   "lot_number"
    t.string   "tradition_hope_price"
    t.integer  "tradition_status",                        :precision => 38, :scale => 0
    t.integer  "partner_id",                              :precision => 38, :scale => 0
    t.integer  "department",                 :limit => 5, :precision => 5,  :scale => 0
    t.string   "errata"
  end

  create_table "z_balance_change_components", :id => false, :force => true do |t|
    t.integer  "id",                 :precision => 38, :scale => 0, :null => false
    t.integer  "balance_change_id",  :precision => 38, :scale => 0
    t.integer  "account_subject_id", :precision => 38, :scale => 0
    t.decimal  "amount",             :precision => 10, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_balance_changes", :id => false, :force => true do |t|
    t.integer  "id",              :precision => 38, :scale => 0, :null => false
    t.integer  "account_type_id", :precision => 38, :scale => 0
    t.integer  "user_id",         :precision => 38, :scale => 0
    t.decimal  "money",           :precision => 12, :scale => 2, :null => false
    t.integer  "status",          :precision => 38, :scale => 0, :null => false
    t.string   "exe_record"
    t.string   "created_by"
    t.string   "process_by"
    t.datetime "process_date"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relatable_type"
    t.integer  "relatable_id",    :precision => 38, :scale => 0
  end

  create_table "z_ot_account_details", :id => false, :force => true do |t|
    t.integer  "id",             :precision => 38, :scale => 0, :null => false
    t.integer  "user_id",        :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.integer  "direction",      :precision => 38, :scale => 0, :null => false
    t.decimal  "money",          :precision => 12, :scale => 2, :null => false
    t.string   "relatable_type",                                :null => false
    t.integer  "relatable_id",   :precision => 38, :scale => 0, :null => false
    t.integer  "description",    :precision => 38, :scale => 0
    t.string   "remark"
    t.boolean  "is_valid",       :precision => 1,  :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_return_auction_requests", :id => false, :force => true do |t|
    t.integer  "id",                   :precision => 38, :scale => 0, :null => false
    t.integer  "unite_consign_id",     :precision => 38, :scale => 0
    t.integer  "user_id",              :precision => 38, :scale => 0, :null => false
    t.integer  "auction_id",           :precision => 38, :scale => 0, :null => false
    t.integer  "auction_order_id",     :precision => 38, :scale => 0, :null => false
    t.string   "user_name"
    t.string   "auction_no",                                          :null => false
    t.string   "auction_name",                                        :null => false
    t.integer  "status",               :precision => 38, :scale => 0, :null => false
    t.text     "postscripts"
    t.text     "reason"
    t.text     "pass_reason"
    t.boolean  "before_limit",         :precision => 1,  :scale => 0, :null => false
    t.datetime "passed_at"
    t.integer  "pass_type",            :precision => 38, :scale => 0
    t.string   "passed_by"
    t.datetime "refused_at"
    t.string   "refused_by"
    t.boolean  "if_passed_by_finance", :precision => 1,  :scale => 0
    t.datetime "passed_by_finance_at"
    t.string   "passed_by_finance_op"
    t.datetime "created_at"
    t.string   "created_by"
    t.datetime "unite_consign_at"
  end

  create_table "z_storage_actions", :id => false, :force => true do |t|
    t.integer  "id",             :precision => 38, :scale => 0, :null => false
    t.integer  "storage_id",     :precision => 38, :scale => 0, :null => false
    t.integer  "created_by",     :precision => 38, :scale => 0, :null => false
    t.integer  "get_by",         :precision => 38, :scale => 0
    t.integer  "access_by",      :precision => 38, :scale => 0
    t.integer  "action_status",  :precision => 38, :scale => 0
    t.integer  "action_type",    :precision => 38, :scale => 0
    t.integer  "location_id",    :precision => 38, :scale => 0
    t.string   "relatable_type"
    t.integer  "relatable_id",   :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_storages", :id => false, :force => true do |t|
    t.integer  "id",          :precision => 38, :scale => 0, :null => false
    t.string   "barcode"
    t.integer  "location_id", :precision => 38, :scale => 0, :null => false
    t.integer  "contract_id", :precision => 38, :scale => 0, :null => false
    t.text     "remark"
    t.integer  "created_by",  :precision => 38, :scale => 0
    t.integer  "amount",      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zhao_auctions", :force => true do |t|
    t.string   "name",                      :limit => 2000,                                :null => false
    t.string   "detail_link",               :limit => 500
    t.string   "small_img_link",            :limit => 500
    t.decimal  "order_price",                               :precision => 12, :scale => 2
    t.datetime "end_at"
    t.integer  "zhao_category_id",                          :precision => 38, :scale => 0
    t.datetime "created_at"
    t.integer  "page_no",                   :limit => 10,   :precision => 10, :scale => 0
    t.string   "quality",                   :limit => 200
    t.datetime "updated_at"
    t.integer  "auction_type",              :limit => 2,    :precision => 2,  :scale => 0
    t.decimal  "end_price",                                 :precision => 12, :scale => 2
    t.decimal  "service_price",                             :precision => 12, :scale => 2
    t.integer  "valide",                    :limit => 2,    :precision => 2,  :scale => 0
    t.text     "description"
    t.integer  "bid_count",                 :limit => 10,   :precision => 10, :scale => 0
    t.decimal  "original_buy_charge_fee",                   :precision => 12, :scale => 2
    t.string   "original_is_mine",          :limit => 20
    t.string   "original_auction_keywords", :limit => 600
    t.integer  "original_status",           :limit => 5,    :precision => 5,  :scale => 0
  end

  create_table "zhao_categories", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :precision => 38, :scale => 0, :default => 0
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.integer  "depth",      :precision => 38, :scale => 0
    t.integer  "lft",        :precision => 38, :scale => 0
    t.integer  "rgt",        :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  add_foreign_key "cities", "provinces", :name => "sys_c0041990"

  add_foreign_key "contracts", "users", :name => "sys_c0041988"

  add_foreign_key "coupon_histories", "user_coupon_details", :name => "fk_coupon_h_reference_user_cou"

  add_foreign_key "credit_coupon_rule_details", "coupon_categories", :name => "fk_credit_c_reference_coupon_c"
  add_foreign_key "credit_coupon_rule_details", "coupon_units", :name => "fk_credit_c_reference_coupon_u"
  add_foreign_key "credit_coupon_rule_details", "coupon_values", :name => "fk_credit_c_reference_coupon_v"
  add_foreign_key "credit_coupon_rule_details", "credit_coupon_rules", :name => "fk_credit_c_reference_credit_c"

  add_foreign_key "credit_frozen_histories", "credit_rules", :name => "fk_credit_f_reference_credit_r"

  add_foreign_key "credit_histories", "credit_rules", :name => "fk_credit_h_reference_credit_r"

  add_foreign_key "qrtz_blob_triggers", "qrtz_triggers", :columns => ["trigger_group", "trigger_name"], :name => "sys_c0041995"

  add_foreign_key "qrtz_cron_triggers", "qrtz_triggers", :columns => ["trigger_group", "trigger_name"], :name => "sys_c0042002"

  add_foreign_key "qrtz_job_listeners", "qrtz_job_details", :columns => ["job_group", "job_name"], :name => "sys_c0042003"

  add_foreign_key "qrtz_simple_triggers", "qrtz_triggers", :columns => ["trigger_group", "trigger_name"], :name => "sys_c0042004"

  add_foreign_key "qrtz_trigger_listeners", "qrtz_triggers", :columns => ["trigger_group", "trigger_name"], :name => "sys_c0041997"

  add_foreign_key "qrtz_triggers", "qrtz_job_details", :columns => ["job_group", "job_name"], :name => "sys_c0041986"

  add_foreign_key "user_coupon_details", "coupon_categories", :name => "fk_user_cou_reference_coupon_c"
  add_foreign_key "user_coupon_details", "coupon_units", :name => "fk_user_cou_reference_coupon_u"
  add_foreign_key "user_coupon_details", "coupon_values", :name => "fk_user_cou_reference_coupon_v"
  add_foreign_key "user_coupon_details", "user_coupons", :name => "fk_user_cou_reference_user_cou"

  add_foreign_key "user_profiles", "users", :name => "sys_c0041996"

end
