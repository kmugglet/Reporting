# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110510033930) do

  create_table "BTS Split", :id => false, :force => true do |t|
    t.string "Project"
    t.string "Region"
    t.string "Optus JV ID"
    t.string "Site Name"
    t.date   "Integration / Completed (Forecast)"
    t.date   "Integration / Completed (Actual)"
  end

  create_table "MSL_Deleted_Site_MSL_Version", :primary_key => "JV Site ID", :force => true do |t|
    t.decimal "MSL_Version",          :precision => 10, :scale => 1
    t.string  "MSL Weeks from start"
    t.date    "Start Date"
    t.date    "Date + Weeks"
  end

  create_table "MSL_Nodes", :id => false, :force => true do |t|
    t.string  "JV Site ID"
    t.string  "Node_Number"
    t.string  "Cabinet S/N"
    t.string  "Node Owner"
    t.integer "WBTS ID",                                :limit => 8
    t.string  "RNC ID"
    t.string  "Excluded in Reports"
    t.string  "Node Type"
    t.string  "Status (Build, Active, Decommissioned)"
    t.string  "Source"
  end

  create_table "Spin1682", :id => false, :force => true do |t|
    t.string  "JV Site ID (if existing)"
    t.string  "Site Name"
    t.string  "City"
    t.string  "State"
    t.string  "Area"
    t.string  "Optus Site ID"
    t.integer "Vodafone Site ID"
    t.float   "Latitude DLL"
    t.float   "Longitude DLL"
    t.string  "RNC ID"
    t.string  "Pre-Spinoza Site Status"
    t.string  "Macro, IBC or Repeater"
    t.string  "Build Responsibility"
    t.string  "Cluster ID"
    t.string  "Coverage Zone"
    t.string  "MoLI Code"
    t.string  "Site Category"
    t.string  "Source"
    t.string  "Replacing"
    t.string  "Status (Build, Active, Decommissioned)"
    t.string  "Node Count"
    t.string  "Optus Cell Count"
    t.string  "Vodafone Cell Count"
    t.string  "Node Types"
    t.string  "SpinNo"
    t.string  "Address"
    t.string  "Node Number"
    t.string  "Cell Operator"
    t.string  "Cell Number"
    t.string  "Cell ID"
    t.string  "UARFCN"
    t.string  "Usage (IBC,Macro)"
  end

  create_table "all_dates", :primary_key => "ID", :force => true do |t|
    t.datetime "That_Date"
  end

  create_table "areas", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cells", :force => true do |t|
    t.integer  "node_id"
    t.string   "cell_operator",    :limit => 32
    t.integer  "cell_number"
    t.integer  "cellid",                         :default => 99999
    t.integer  "UARFCN_id",                      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "historical",                     :default => false
    t.boolean  "removed_from_msl",               :default => false
    t.datetime "removed_on"
    t.integer  "spin_id"
    t.integer  "status_id",                      :default => 1
  end

  create_table "documents", :force => true do |t|
    t.integer  "spin_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments",     :limit => 45
    t.boolean  "uploaded"
    t.integer  "user_id"
  end

  create_table "freq_bands", :force => true do |t|
    t.string "name"
  end

  create_table "imports", :force => true do |t|
    t.integer  "user_id"
    t.string   "data_type",  :limit => 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "latest_milestone_dates", :id => false, :force => true do |t|
    t.integer   "max_id"
    t.integer   "node_id"
    t.string    "pfa",              :limit => 20
    t.integer   "milestone_id"
    t.date      "milestone_date"
    t.string    "milestone_source", :limit => 64
    t.timestamp "created_at",                     :null => false
  end

  create_table "link_technologies", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at"
  end

  create_table "macro_types", :force => true do |t|
    t.string   "name",       :limit => 35
    t.datetime "created_at"
  end

  create_table "milestone_dates", :force => true do |t|
    t.integer   "node_id"
    t.integer   "milestone_id"
    t.string    "pfa",              :limit => 20
    t.date      "milestone_date"
    t.string    "milestone_source", :limit => 64
    t.timestamp "created_at",                     :null => false
  end

  create_table "milestone_imports", :force => true do |t|
    t.integer  "node_id"
    t.integer  "milestone_id"
    t.string   "pfa",          :limit => 20
    t.string   "filename",     :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestone_imports", ["node_id", "milestone_id", "pfa"], :name => "milestone_import_index"

  create_table "milestones", :force => true do |t|
    t.string   "name",        :limit => 32
    t.string   "description", :limit => 50
    t.datetime "created_at"
    t.string   "vha_name",    :limit => 10
    t.string   "optus_name",  :limit => 20
  end

  create_table "node_types", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at"
  end

  create_table "nodes", :force => true do |t|
    t.integer  "site_id"
    t.integer  "node_number"
    t.string   "cabinet_serial",   :limit => 32
    t.string   "node_owner",       :limit => 32
    t.integer  "wbts"
    t.integer  "rnc"
    t.integer  "status_id",                      :default => 1
    t.integer  "node_type_id",                   :default => 3
    t.integer  "source_id",                      :default => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "original_node"
    t.boolean  "super_split"
    t.boolean  "recharge"
    t.integer  "freq_band_id",                   :default => 1
    t.boolean  "historical",                     :default => false
    t.boolean  "removed_from_msl",               :default => false
    t.datetime "removed_on"
    t.integer  "spin_id"
    t.integer  "wa_id"
  end

  create_table "operators", :force => true do |t|
    t.string "name", :limit => 20
  end

  create_table "pre_build_statuses", :force => true do |t|
    t.string "pre_spinoza_site_status", :limit => 32
  end

  create_table "report_distribution", :primary_key => "ID", :force => true do |t|
    t.string  "Name"
    t.string  "Email"
    t.string  "Conf"
    t.boolean "Internal JV",                 :default => false
    t.string  "Company"
    t.boolean "Fortnightly MSL",             :default => false
    t.boolean "Monthly Additional Capacity", :default => false
    t.boolean "Weekly Recharge Report",      :default => false
    t.boolean "JVO Dashboard",               :default => false
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rnc_bandwidth", :primary_key => "ID", :force => true do |t|
    t.integer  "rnc_id"
    t.float    "VHA Mbps"
    t.float    "VHA Erlangs"
    t.float    "Optus Mbps"
    t.float    "Optus Erlangs"
    t.datetime "Sample_Date"
  end

  create_table "rnc_capacity", :force => true do |t|
    t.integer  "rnc_id"
    t.integer  "step"
    t.integer  "mbps"
    t.integer  "erlangs"
    t.datetime "date_added"
  end

  create_table "rnc_names", :force => true do |t|
    t.integer "rnc_number"
    t.string  "rnc_name"
    t.integer "state_id"
  end

  create_table "site_source_programs", :primary_key => "ID", :force => true do |t|
    t.string   "source",         :limit => 32
    t.boolean  "completed",                    :default => false
    t.datetime "start_date"
    t.datetime "completed_date"
  end

  create_table "site_to_spin", :primary_key => "ID", :force => true do |t|
    t.integer   "site_id"
    t.integer   "spin_id"
    t.timestamp "created_at", :null => false
  end

  create_table "sites", :force => true do |t|
    t.string    "jv_site",                :limit => 10
    t.string    "name",                   :limit => 64
    t.integer   "state_id",                              :default => 0
    t.integer   "area_id",                               :default => 0
    t.string    "optus_site",             :limit => 10
    t.string    "vodafone_site",          :limit => 10
    t.float     "latitude_dll"
    t.float     "longitude_dll"
    t.integer   "pre_build_status_id",                   :default => 6
    t.integer   "macro_type_id",                         :default => 1
    t.string    "build_responsibility",   :limit => 32
    t.string    "cluster",                :limit => 32
    t.string    "coverage_zone",          :limit => 32
    t.string    "MoLi_code",              :limit => 32
    t.string    "site_category",          :limit => 32
    t.integer   "site_source_program_id",                :default => 40
    t.integer   "replacing"
    t.integer   "status_id",                             :default => 1
    t.string    "address",                :limit => 128
    t.timestamp "created_at"
    t.boolean   "historical",                            :default => false
    t.boolean   "removed_from_msl",                      :default => false
    t.datetime  "updated_at"
    t.datetime  "removed_at"
    t.integer   "replaced_by"
    t.integer   "spin_id"
  end

  create_table "spin_approval_cat", :primary_key => "ID", :force => true do |t|
    t.string "ApprovalCat", :limit => 25
  end

  create_table "spin_change_reasons", :force => true do |t|
    t.string "ChangeReason", :limit => 50
  end

  create_table "spin_change_types", :force => true do |t|
    t.string "ChangeType", :limit => 50
  end

  create_table "spin_process_milestones", :force => true do |t|
    t.integer  "spin_no"
    t.integer  "stage_no"
    t.datetime "milestone_date"
    t.string   "comment"
  end

  create_table "spin_process_stages", :force => true do |t|
    t.string "stage"
    t.string "description"
  end

  create_table "spin_tracking_categories", :force => true do |t|
    t.string "TrackingCat", :limit => 50
  end

  create_table "spin_tracking_map", :force => true do |t|
    t.integer "tracking_id"
  end

  create_table "spins", :force => true do |t|
    t.string  "spinnumber",     :limit => 10,                                                    :null => false
    t.string  "operator",       :limit => 20
    t.string  "initiator",      :limit => 100
    t.string  "email"
    t.string  "phone",          :limit => 30
    t.date    "date_raised"
    t.boolean "Multiple",                                                     :default => false
    t.string  "Name"
    t.string  "State",          :limit => 10
    t.text    "Descr"
    t.date    "optus_local"
    t.date    "optus_national"
    t.date    "optus_final"
    t.date    "vha_local"
    t.date    "vha_national"
    t.date    "vha_final"
    t.date    "jvo_final"
    t.text    "jv_tracking"
    t.date    "date_closed"
    t.integer "msl_version",    :limit => 10,  :precision => 10, :scale => 0
    t.text    "optus_pdf"
    t.text    "vodafone_pdf"
    t.integer "approval_id"
    t.integer "tracking_id"
    t.integer "reason_id"
    t.integer "type_id"
    t.integer "user_id",                                                      :default => 270
  end

  create_table "states", :force => true do |t|
    t.string   "name",       :limit => 32
    t.string   "abbr",       :limit => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "t_monthly_additional_capacity_report", :id => false, :force => true do |t|
    t.string  "jv_site",                   :limit => 10
    t.string  "request_id",                :limit => 14
    t.integer "id",                                                                     :default => 0, :null => false
    t.integer "node_id"
    t.string  "Active_Node_Owner"
    t.decimal "Request_No",                              :precision => 10, :scale => 1
    t.integer "Split_No"
    t.date    "date_raised"
    t.date    "date_required_by"
    t.string  "Invoice_Party",             :limit => 8
    t.string  "Work_Type",                 :limit => 10
    t.integer "link_technology_id"
    t.integer "Existing_Capacity"
    t.integer "Required_Capacity"
    t.date    "S7_Baseline"
    t.date    "S7_Forecast"
    t.date    "S8_Baseline"
    t.date    "S8_Forecast"
    t.date    "S7_Actual"
    t.date    "S8_Actual"
    t.date    "C1"
    t.date    "C2"
    t.date    "C3"
    t.date    "C4"
    t.string  "Remarks"
    t.integer "tx_source_programme_id"
    t.integer "operator_id"
    t.date    "service_commencement_date"
  end

  create_table "t_monthly_capacity_report", :id => false, :force => true do |t|
    t.string  "Work Type",                  :limit => 18
    t.string  "Site ID",                    :limit => 10
    t.string  "Request ID",                 :limit => 14
    t.integer "Split_No"
    t.string  "Site Name",                  :limit => 64
    t.string  "Area",                       :limit => 32
    t.string  "State",                      :limit => 3
    t.string  "Technology",                 :limit => 32
    t.string  "Active_node_owner"
    t.string  "Invoice_Party",              :limit => 8
    t.string  "Build_Responsibility",       :limit => 32
    t.string  "Macro Type",                 :limit => 35
    t.integer "Capacity Change",            :limit => 8
    t.string  "Contra",                     :limit => 7,  :default => "", :null => false
    t.integer "Node Number"
    t.string  "Node Split",                 :limit => 7,  :default => "", :null => false
    t.string  "Site_Built_As_Split",        :limit => 3,  :default => "", :null => false
    t.date    "date_raised"
    t.date    "Transmission Complete (S7)"
    t.date    "Service_commencement_date"
    t.string  "billing_month",              :limit => 10
  end

  create_table "t_msl_cells", :id => false, :force => true do |t|
    t.string  "JV Site ID",        :limit => 10
    t.string  "Site Name",         :limit => 64
    t.binary  "JV Cell ID",        :limit => 44
    t.integer "Node Number"
    t.string  "Cell Operator",     :limit => 32
    t.integer "Cell Number"
    t.integer "Cell ID"
    t.integer "UARFCN",            :limit => 8
    t.string  "Usage (IBC,Macro)", :limit => 32
  end

  create_table "t_msl_deleted_sites", :id => false, :force => true do |t|
    t.string   "JV Site ID",           :limit => 10
    t.string   "Site Name",            :limit => 64
    t.string   "Area",                 :limit => 32
    t.string   "State",                :limit => 32
    t.string   "Macro Type",           :limit => 35
    t.string   "Build Responsibility", :limit => 32
    t.integer  "Spin ID"
    t.datetime "Removed from MSL"
  end

  create_table "t_msl_nodes", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Cabinet S/N",                            :limit => 32
    t.string  "Node Owner",                             :limit => 32
    t.integer "WBTS ID"
    t.integer "RNC ID"
    t.string  "Node Type",                              :limit => 32
    t.string  "Status (Build, Active, Decommissioned)"
    t.string  "Source",                                 :limit => 32
    t.string  "Area",                                   :limit => 32
    t.integer "Optus Cell Count",                       :limit => 23, :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",                    :limit => 23, :precision => 23, :scale => 0
    t.string  "RNC Name"
  end

  create_table "t_msl_sites", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.float   "Latitude DLL"
    t.float   "Longitude DLL"
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.integer "Replacing"
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,                                  :default => "", :null => false
    t.integer "Node Count",                             :limit => 8
    t.integer "Optus Cell Count",                       :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",                    :limit => 23,  :precision => 23, :scale => 0
    t.integer "SpinNo"
    t.string  "Address",                                :limit => 128
  end

  create_table "t_msl_sites_previous", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.float   "Latitude DLL"
    t.float   "Longitude DLL"
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.integer "Replacing"
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,                                  :default => "", :null => false
    t.integer "Node Count",                             :limit => 8
    t.integer "Optus Cell Count",                       :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",                    :limit => 23,  :precision => 23, :scale => 0
    t.integer "SpinNo"
    t.string  "Address",                                :limit => 128
  end

  create_table "t_new_recharge_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Node Owner",                             :limit => 32
    t.integer "RNC ID"
    t.integer "WBTS ID"
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "address",                                :limit => 128
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "wa_id"
    t.boolean "original_node"
  end

  create_table "t_recharge_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Node Owner",                             :limit => 32
    t.integer "RNC ID"
    t.integer "WBTS ID"
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "address",                                :limit => 128
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "wa_id"
    t.boolean "original_node"
  end

  create_table "t_recharge_report_previous", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Node Owner",                             :limit => 32
    t.integer "RNC ID"
    t.integer "WBTS ID"
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "address",                                :limit => 128
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "wa_id"
    t.boolean "original_node"
  end

  create_table "t_recharge_summary", :id => false, :force => true do |t|
    t.integer "Year"
    t.integer "Jan",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr",        :limit => 23, :precision => 23, :scale => 0
    t.integer "May",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Total_Year", :limit => 8,                                 :default => 0, :null => false
  end

  create_table "t_spinoza_recharge_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Node Owner",                             :limit => 32
    t.integer "RNC ID"
    t.integer "WBTS ID"
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "address",                                :limit => 128
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
  end

  create_table "t_transmission_capacity_summary", :id => false, :force => true do |t|
    t.integer "Year"
    t.integer "Jan",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr",        :limit => 23, :precision => 23, :scale => 0
    t.integer "May",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Total_Year", :limit => 8,                                 :default => 0, :null => false
  end

  create_table "trackings", :force => true do |t|
    t.string  "category", :limit => 50
    t.string  "action",   :limit => 100
    t.integer "sla"
  end

  create_table "transmission_dates", :force => true do |t|
    t.integer  "node_id"
    t.string   "Active_Node_Owner"
    t.decimal  "Request_No",                           :precision => 10, :scale => 1
    t.integer  "Split_No"
    t.date     "date_raised"
    t.date     "date_required_by"
    t.string   "Invoice_Party",          :limit => 8
    t.string   "Work_Type",              :limit => 10
    t.integer  "link_technology_id"
    t.integer  "Existing_Capacity"
    t.integer  "Required_Capacity"
    t.date     "S7_Baseline"
    t.date     "S7_Forecast"
    t.date     "S8_Baseline"
    t.date     "S8_Forecast"
    t.date     "S7_Actual"
    t.date     "S8_Actual"
    t.date     "C1"
    t.date     "C2"
    t.date     "C3"
    t.date     "C4"
    t.string   "Remarks"
    t.integer  "tx_source_programme_id"
    t.integer  "operator_id"
    t.datetime "created_at"
    t.datetime "updated_on"
    t.datetime "billed_on"
  end

  create_table "transmission_source_program", :force => true do |t|
    t.string "Bulk_Order_Type", :limit => 100
  end

  create_table "uarfcns", :force => true do |t|
    t.string   "name",       :limit => 45
    t.integer  "freq",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_reports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string  "full_name",                                            :null => false
    t.string  "name",                                                 :null => false
    t.string  "company",             :limit => 20
    t.string  "email",                                                :null => false
    t.string  "phone",               :limit => 16
    t.boolean "jvo",                               :default => false, :null => false
    t.string  "hashed_password"
    t.integer "admin_level",                                          :null => false
    t.string  "salt"
    t.boolean "report_access",                     :default => false
    t.boolean "spin_access",                       :default => false
    t.boolean "transmission_access",               :default => false
    t.integer "spin_level",                        :default => 1
    t.integer "tx_level",                          :default => 1
    t.integer "active",              :limit => 1,  :default => 1,     :null => false
  end

  create_table "v_config_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",             :limit => 10
    t.string  "Area",                   :limit => 32
    t.string  "Macro, IBC or Repeater", :limit => 35
    t.integer "Sites",                                :default => 0,  :null => false
    t.string  "RFI",                    :limit => 3,  :default => "", :null => false
    t.string  "Build Responsibility",   :limit => 32
  end

  create_table "v_deployment_summary", :id => false, :force => true do |t|
    t.string  "Build Responsibility", :limit => 32
    t.integer "End Dec 10",           :limit => 23, :precision => 23, :scale => 0
    t.integer "End Mar 11",           :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "May-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jan-12",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb-12",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar-12",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Future",               :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_initiators", :id => false, :force => true do |t|
    t.string "initiator", :limit => 100
    t.string "phone",     :limit => 30
    t.string "email"
  end

  create_table "v_jv_cell_id", :id => false, :force => true do |t|
    t.integer "cell_id",                  :default => 0, :null => false
    t.binary  "jv_cell_id", :limit => 44
  end

  create_table "v_latest_milestone_check", :id => false, :force => true do |t|
    t.integer "max_id"
    t.integer "node_id"
    t.string  "pfa",          :limit => 20
    t.integer "milestone_id"
  end

  create_table "v_latest_milestone_dates", :id => false, :force => true do |t|
    t.integer   "max_id"
    t.integer   "node_id"
    t.string    "pfa",              :limit => 20
    t.integer   "milestone_id"
    t.date      "milestone_date"
    t.string    "milestone_source", :limit => 64
    t.timestamp "created_at",                     :null => false
  end

  create_table "v_latest_transmission_request", :id => false, :force => true do |t|
    t.integer "nid"
    t.decimal "request", :precision => 10, :scale => 1
  end

  create_table "v_latest_transmission_request_id_per_node", :id => false, :force => true do |t|
    t.integer "id", :default => 0, :null => false
  end

  create_table "v_milestone_dates_pivot", :id => false, :force => true do |t|
    t.integer "id",            :default => 0, :null => false
    t.integer "wa_id"
    t.boolean "original_node"
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
  end

  create_table "v_monthly_additional_capacity_report", :id => false, :force => true do |t|
    t.string  "jv_site",                   :limit => 10
    t.string  "request_id",                :limit => 14
    t.integer "id",                                                                     :default => 0, :null => false
    t.integer "node_id"
    t.string  "Active_Node_Owner"
    t.decimal "Request_No",                              :precision => 10, :scale => 1
    t.integer "Split_No"
    t.date    "date_raised"
    t.date    "date_required_by"
    t.string  "Invoice_Party",             :limit => 8
    t.string  "Work_Type",                 :limit => 10
    t.integer "link_technology_id"
    t.integer "Existing_Capacity"
    t.integer "Required_Capacity"
    t.date    "S7_Baseline"
    t.date    "S7_Forecast"
    t.date    "S8_Baseline"
    t.date    "S8_Forecast"
    t.date    "S7_Actual"
    t.date    "S8_Actual"
    t.date    "C1"
    t.date    "C2"
    t.date    "C3"
    t.date    "C4"
    t.string  "Remarks"
    t.integer "tx_source_programme_id"
    t.integer "operator_id"
    t.date    "service_commencement_date"
  end

  create_table "v_monthly_capacity_contra", :id => false, :force => true do |t|
    t.string  "Work Type",                  :limit => 18
    t.string  "Site ID",                    :limit => 10
    t.string  "Request ID",                 :limit => 14
    t.string  "Site Name",                  :limit => 64
    t.string  "Area",                       :limit => 32
    t.string  "State",                      :limit => 3
    t.string  "Technology",                 :limit => 32
    t.string  "Active_node_owner"
    t.string  "Invoice_Party",              :limit => 8
    t.string  "Build_Responsibility",       :limit => 32
    t.string  "Macro Type",                 :limit => 35
    t.integer "Capacity Change",            :limit => 8
    t.string  "Contra",                     :limit => 7,  :default => "", :null => false
    t.integer "Node Number"
    t.string  "Node Split",                 :limit => 7,  :default => "", :null => false
    t.date    "date_raised"
    t.date    "Transmission Complete (S7)"
    t.date    "Service_commencement_date"
    t.string  "billing_month",              :limit => 10
    t.integer "Split_No"
  end

  create_table "v_monthly_capacity_report", :id => false, :force => true do |t|
    t.string  "Work Type",                  :limit => 18
    t.string  "Site ID",                    :limit => 10
    t.string  "Request ID",                 :limit => 14
    t.integer "Split_No"
    t.string  "Site Name",                  :limit => 64
    t.string  "Area",                       :limit => 32
    t.string  "State",                      :limit => 3
    t.string  "Technology",                 :limit => 32
    t.string  "Active_node_owner"
    t.string  "Invoice_Party",              :limit => 8
    t.string  "Build_Responsibility",       :limit => 32
    t.string  "Macro Type",                 :limit => 35
    t.integer "Capacity Change",            :limit => 8
    t.string  "Contra",                     :limit => 7,  :default => "", :null => false
    t.integer "Node Number"
    t.string  "Node Split",                 :limit => 7,  :default => "", :null => false
    t.string  "Site_Built_As_Split",        :limit => 3,  :default => "", :null => false
    t.date    "date_raised"
    t.date    "Transmission Complete (S7)"
    t.date    "Service_commencement_date"
    t.string  "billing_month",              :limit => 10
  end

  create_table "v_msl_cells", :id => false, :force => true do |t|
    t.string  "JV Site ID",        :limit => 10
    t.string  "Site Name",         :limit => 64
    t.binary  "JV Cell ID",        :limit => 44
    t.integer "Node Number"
    t.string  "Cell Operator",     :limit => 32
    t.integer "Cell Number"
    t.integer "Cell ID",                         :default => 99999
    t.integer "UARFCN",            :limit => 8
    t.string  "Usage (IBC,Macro)", :limit => 32
  end

  create_table "v_msl_deleted_sites", :id => false, :force => true do |t|
    t.string   "JV Site ID",           :limit => 10
    t.string   "Site Name",            :limit => 64
    t.string   "Area",                 :limit => 32
    t.string   "State",                :limit => 32
    t.string   "Macro Type",           :limit => 35
    t.string   "Build Responsibility", :limit => 32
    t.integer  "Spin ID"
    t.datetime "Removed from MSL"
  end

  create_table "v_msl_nodes", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Cabinet S/N",                            :limit => 32
    t.string  "Node Owner",                             :limit => 32
    t.integer "WBTS ID"
    t.integer "RNC ID"
    t.string  "Node Type",                              :limit => 32
    t.string  "Status (Build, Active, Decommissioned)"
    t.string  "Source",                                 :limit => 32
    t.string  "Area",                                   :limit => 32
    t.integer "Optus Cell Count",                       :limit => 23, :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",                    :limit => 23, :precision => 23, :scale => 0
    t.string  "RNC Name"
    t.integer "SPIN Number"
  end

  create_table "v_msl_sites", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.float   "Latitude DLL"
    t.float   "Longitude DLL"
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.integer "Replacing"
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,                                  :default => "", :null => false
    t.integer "Node Count",                             :limit => 8,                                  :default => 0
    t.integer "Optus Cell Count",                       :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",                    :limit => 23,  :precision => 23, :scale => 0
    t.integer "SpinNo"
    t.string  "Address",                                :limit => 128
  end

  create_table "v_no_transmission", :id => false, :force => true do |t|
    t.integer "id",      :default => 0, :null => false
    t.integer "site_id"
  end

  create_table "v_node_cell_count", :id => false, :force => true do |t|
    t.integer "node_id",                                                  :default => 0, :null => false
    t.integer "optus_cells", :limit => 23, :precision => 23, :scale => 0
    t.integer "vha_cells",   :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_recharge_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.integer "Node Number"
    t.string  "Node Owner",                             :limit => 32
    t.integer "RNC ID"
    t.integer "WBTS ID"
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Moli Code",                              :limit => 32
    t.string  "Site Category",                          :limit => 32
    t.string  "Source",                                 :limit => 32
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "address",                                :limit => 128
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "wa_id"
    t.boolean "original_node"
  end

  create_table "v_recharge_summary", :id => false, :force => true do |t|
    t.integer "Year"
    t.integer "Jan",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr",        :limit => 23, :precision => 23, :scale => 0
    t.integer "May",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Total_Year", :limit => 8,                                 :default => 0, :null => false
  end

  create_table "v_site_cell_count", :id => false, :force => true do |t|
    t.integer "site_id",                                                  :default => 0, :null => false
    t.integer "optus_cells", :limit => 23, :precision => 23, :scale => 0
    t.integer "vha_cells",   :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_site_lists", :id => false, :force => true do |t|
    t.integer "id",                    :default => 0, :null => false
    t.string  "jv_site", :limit => 10
  end

  create_table "v_site_node_count", :id => false, :force => true do |t|
    t.integer "id",                      :default => 0, :null => false
    t.integer "node_count", :limit => 8, :default => 0, :null => false
  end

  create_table "v_site_node_ids", :id => false, :force => true do |t|
    t.integer "site_id",                            :default => 0, :null => false
    t.string  "jv_site",              :limit => 10
    t.integer "node_id",                            :default => 0, :null => false
    t.integer "node_number"
    t.string  "name",                 :limit => 64
    t.string  "build_responsibility", :limit => 32
    t.string  "node_owner",           :limit => 32
    t.integer "wbts"
    t.integer "rnc"
    t.integer "wa_id"
    t.boolean "original_node"
  end

  create_table "v_sites_built_split", :id => false, :force => true do |t|
    t.integer "site_id",                      :default => 0,  :null => false
    t.string  "Built as split", :limit => 14, :default => "", :null => false
  end

  create_table "v_spin_additional_info", :id => false, :force => true do |t|
    t.string  "JV Site ID",                             :limit => 10
    t.string  "Site Name",                              :limit => 64
    t.string  "City",                                   :limit => 0,   :default => "", :null => false
    t.string  "State",                                  :limit => 3
    t.string  "Area",                                   :limit => 32
    t.string  "Address",                                :limit => 128
    t.string  "Optus Site ID",                          :limit => 10
    t.string  "Vodafone Site ID",                       :limit => 10
    t.float   "Latitude DLL"
    t.float   "Longitude DLL"
    t.integer "RNC ID"
    t.string  "Pre-Spinoza Site Status",                :limit => 32
    t.string  "Macro, IBC or Repeater",                 :limit => 35
    t.string  "Build Responsibility",                   :limit => 32
    t.string  "Source",                                 :limit => 32
    t.integer "Replacing"
    t.string  "Status (Build, Active, Decommissioned)", :limit => 0,   :default => "", :null => false
    t.string  "Node Owner",                             :limit => 32
    t.string  "Node Type",                              :limit => 32
    t.integer "SpinNo"
    t.integer "WBTS ID"
    t.integer "Node Number"
    t.string  "Cell Operator",                          :limit => 32
    t.integer "Cell Number"
    t.integer "Cell ID"
    t.integer "UARFCN",                                 :limit => 8
  end

  create_table "v_spin_duration", :id => false, :force => true do |t|
    t.string  "spinnumber",     :limit => 10, :null => false
    t.string  "category",       :limit => 50
    t.string  "operator",       :limit => 20
    t.date    "date_raised"
    t.date    "optus_final"
    t.integer "optus_approval"
    t.integer "vha_to_optus"
    t.date    "vha_final"
    t.integer "vha_approval"
    t.integer "optus_to_vha"
    t.date    "jvo_final"
    t.integer "jvo_optus"
    t.integer "jvo_vha"
    t.date    "date_closed"
    t.integer "total_duration"
    t.string  "approval",       :limit => 25
  end

  create_table "v_spin_report", :id => false, :force => true do |t|
    t.integer "id",                           :default => 0,  :null => false
    t.integer "tr_id",                        :default => 0,  :null => false
    t.string  "category",       :limit => 50
    t.string  "operator",       :limit => 20
    t.float   "event_duration"
    t.string  "event",          :limit => 13, :default => "", :null => false
    t.date    "event_finish"
    t.date    "event_start"
  end

  create_table "v_spin_site_node_cells", :id => false, :force => true do |t|
    t.integer "id",      :default => 0, :null => false
    t.integer "site_id", :default => 0, :null => false
    t.integer "node_id", :default => 0, :null => false
    t.integer "cell_id", :default => 0, :null => false
  end

  create_table "v_spin_summary_closed", :id => false, :force => true do |t|
    t.integer "End Dec 10", :limit => 23, :precision => 23, :scale => 0
    t.integer "End Mar 11", :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "May-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Future",     :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_spin_summary_open", :id => false, :force => true do |t|
    t.integer "End Dec 10", :limit => 23, :precision => 23, :scale => 0
    t.integer "End Mar 11", :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "May-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Future",     :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_split_actual_summary", :id => false, :force => true do |t|
    t.string  "Build Responsibility"
    t.integer "Prev",                 :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "May-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jan-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "May-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Future",               :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_split_nodes", :id => false, :force => true do |t|
    t.integer "node_id"
  end

  create_table "v_split_sites_with_transmission", :id => false, :force => true do |t|
    t.integer "site_id"
    t.string  "nodes_split", :limit => 7, :default => "", :null => false
  end

  create_table "v_split_summary", :id => false, :force => true do |t|
    t.string  "Build Responsibility"
    t.integer "Prev",                 :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "May-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-10",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jan-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "May-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec-11",               :limit => 23, :precision => 23, :scale => 0
    t.integer "Future",               :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_splits", :id => false, :force => true do |t|
    t.string  "JV Site ID"
    t.string  "build_responsibility", :limit => 32
    t.string  "old_node_number"
    t.string  "old_node_owner"
    t.integer "old_wbts",             :limit => 8
    t.string  "old_rnc"
    t.string  "Source"
    t.integer "node_number"
    t.string  "node_owner",           :limit => 32
    t.integer "wbts"
    t.integer "rnc"
    t.integer "WBTS_Match"
    t.integer "RNC_Match"
    t.integer "Node_Owner_Match"
  end

  create_table "v_temp_keith", :id => false, :force => true do |t|
    t.integer "node_id",                     :default => 0, :null => false
    t.integer "node_number"
    t.integer "node_type_id",                :default => 3
    t.boolean "original_node"
    t.integer "site_id",                     :default => 0, :null => false
    t.string  "jv_site",       :limit => 10
  end

  create_table "v_transmission_capacity_summary", :id => false, :force => true do |t|
    t.integer "Year"
    t.integer "Jan",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Feb",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr",        :limit => 23, :precision => 23, :scale => 0
    t.integer "May",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec",        :limit => 23, :precision => 23, :scale => 0
    t.integer "Total_Year", :limit => 8,                                 :default => 0, :null => false
  end

  create_table "v_transmission_requests_chargable", :id => false, :force => true do |t|
    t.integer "id",               :default => 0, :null => false
    t.date    "date_required_by"
    t.date    "S7_Baseline"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.date    "S8_Baseline"
    t.date    "S8_Forecast"
    t.date    "S8_Actual"
    t.date    "C4"
    t.date    "C1"
    t.date    "C2"
    t.date    "last_date"
  end

  create_table "v_transmission_site_nodes", :id => false, :force => true do |t|
    t.integer "site_id"
    t.integer "node_number"
  end

  create_table "v_transmission_summary_atm", :id => false, :force => true do |t|
    t.string  "Milestone",  :limit => 11,                                :default => "", :null => false
    t.integer "End Dec 10", :limit => 23, :precision => 23, :scale => 0
    t.integer "End Mar 11", :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "May 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jan 12",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar 12",     :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_transmission_summary_ip", :id => false, :force => true do |t|
    t.string  "Milestone",  :limit => 11,                                :default => "", :null => false
    t.integer "End Dec 10", :limit => 23, :precision => 23, :scale => 0
    t.integer "End Mar 11", :limit => 23, :precision => 23, :scale => 0
    t.integer "Apr 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "May 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jun 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jul 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Aug 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Sep 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Oct 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Nov 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Dec 11",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Jan 12",     :limit => 23, :precision => 23, :scale => 0
    t.integer "Mar 12",     :limit => 23, :precision => 23, :scale => 0
  end

  create_table "v_weekly_recharge_pivot", :id => false, :force => true do |t|
    t.string  "JV Site ID",              :limit => 10
    t.string  "Site Name",               :limit => 64
    t.string  "State",                   :limit => 3
    t.string  "Area",                    :limit => 32
    t.string  "Optus Site ID",           :limit => 10
    t.string  "Vodafone Site ID",        :limit => 10
    t.string  "Pre-Spinoza Site Status", :limit => 32
    t.string  "E/G",                     :limit => 1,                                  :default => "", :null => false
    t.string  "Macro, IBC or Repeater",  :limit => 35
    t.string  "Build Responsibility",    :limit => 32
    t.string  "Source",                  :limit => 32
    t.integer "Replacing"
    t.string  "address",                 :limit => 128
    t.integer "Node Count",              :limit => 8
    t.integer "Optus Cell Count",        :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",     :limit => 23,  :precision => 23, :scale => 0
    t.integer "WA ID"
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
  end

  create_table "v_weekly_recharge_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",              :limit => 10
    t.string  "Site Name",               :limit => 64
    t.string  "State",                   :limit => 3
    t.string  "Area",                    :limit => 32
    t.string  "Optus Site ID",           :limit => 10
    t.string  "Vodafone Site ID",        :limit => 10
    t.string  "Pre-Spinoza Site Status", :limit => 32
    t.string  "E/G",                     :limit => 1,                                  :default => "", :null => false
    t.string  "Macro, IBC or Repeater",  :limit => 35
    t.string  "Build Responsibility",    :limit => 32
    t.string  "Source",                  :limit => 32
    t.integer "Replacing"
    t.string  "address",                 :limit => 128
    t.integer "Node Count",              :limit => 8
    t.integer "Optus Cell Count",        :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",     :limit => 23,  :precision => 23, :scale => 0
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "WA ID"
  end

  create_table "v_weekly_schedule_report", :id => false, :force => true do |t|
    t.string  "JV Site ID",              :limit => 10
    t.string  "Site Name",               :limit => 64
    t.string  "State",                   :limit => 3
    t.string  "Area",                    :limit => 32
    t.string  "Optus Site ID",           :limit => 10
    t.string  "Vodafone Site ID",        :limit => 10
    t.string  "Pre-Spinoza Site Status", :limit => 32
    t.string  "E/G",                     :limit => 1,                                  :default => "", :null => false
    t.string  "Macro, IBC or Repeater",  :limit => 35
    t.string  "Build Responsibility",    :limit => 32
    t.string  "Source",                  :limit => 32
    t.integer "Replacing"
    t.string  "address",                 :limit => 128
    t.integer "Node Count",              :limit => 8
    t.integer "Optus Cell Count",        :limit => 23,  :precision => 23, :scale => 0
    t.integer "Vodafone Cell Count",     :limit => 23,  :precision => 23, :scale => 0
    t.integer "Node Number"
    t.date    "S1_Planned"
    t.date    "S1_Forecast"
    t.date    "S1_Actual"
    t.date    "S2_Planned"
    t.date    "S2_Forecast"
    t.date    "S2_Actual"
    t.date    "S3_Planned"
    t.date    "S3_Forecast"
    t.date    "S3_Actual"
    t.date    "S4_Planned"
    t.date    "S4_Forecast"
    t.date    "S4_Actual"
    t.date    "S5_Planned"
    t.date    "S5_Forecast"
    t.date    "S5_Actual"
    t.date    "S6_Planned"
    t.date    "S6_Forecast"
    t.date    "S6_Actual"
    t.date    "S7_Planned"
    t.date    "S7_Forecast"
    t.date    "S7_Actual"
    t.integer "WA ID"
  end

end
