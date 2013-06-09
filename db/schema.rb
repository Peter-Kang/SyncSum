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

ActiveRecord::Schema.define(:version => 20130430221108) do

  create_table "answers", :force => true do |t|
    t.string   "answer"
    t.integer  "weight"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "answers_candidates", :id => false, :force => true do |t|
    t.integer "answer_id"
    t.integer "candidate_id"
  end

  add_index "answers_candidates", ["answer_id", "candidate_id"], :name => "index_answers_candidates_on_answer_id_and_candidate_id"
  add_index "answers_candidates", ["candidate_id", "answer_id"], :name => "index_answers_candidates_on_candidate_id_and_answer_id"

  create_table "business_sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_sectors_concentrations", :id => false, :force => true do |t|
    t.integer "concentration_id"
    t.integer "business_sector_id"
  end

  add_index "business_sectors_concentrations", ["business_sector_id"], :name => "index_business_sectors_concentrations_on_business_sector_id"
  add_index "business_sectors_concentrations", ["concentration_id"], :name => "index_business_sectors_concentrations_on_concentration_id"

  create_table "business_sectors_experiences", :id => false, :force => true do |t|
    t.integer "business_sector_id"
    t.integer "experience_id"
  end

  add_index "business_sectors_experiences", ["business_sector_id", "experience_id"], :name => "bus_sector_experience_join"

  create_table "business_sectors_positions", :id => false, :force => true do |t|
    t.integer "position_id"
    t.integer "business_sector_id"
  end

  add_index "business_sectors_positions", ["business_sector_id"], :name => "index_business_sectors_positions_on_business_sector_id"
  add_index "business_sectors_positions", ["position_id"], :name => "index_business_sectors_positions_on_position_id"

  create_table "candidate_app_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidate_apps", :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "position_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "candidate_app_status_id"
  end

  create_table "candidates", :force => true do |t|
    t.string   "resume"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.date     "dob"
    t.integer  "user_id"
    t.string   "employment_status"
    t.string   "search_radius"
    t.string   "min_company_search_size"
    t.string   "max_company_search_size"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "candidates_certifications", :id => false, :force => true do |t|
    t.integer "certification_id"
    t.integer "candidate_id"
  end

  add_index "candidates_certifications", ["candidate_id"], :name => "index_candidates_certifications_on_candidate_id"
  add_index "candidates_certifications", ["certification_id"], :name => "index_candidates_certifications_on_certification_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_questions", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "question_id"
  end

  add_index "categories_questions", ["category_id", "question_id"], :name => "index_categories_questions_on_category_id_and_question_id"
  add_index "categories_questions", ["question_id", "category_id"], :name => "index_categories_questions_on_question_id_and_category_id"

  create_table "certifications", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "concentrations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "degrees", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "educations", :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "concentration_id"
    t.integer  "degree_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "school_id"
    t.string   "gpa"
    t.boolean  "honors"
    t.string   "ranking"
  end

  add_index "educations", ["school_id"], :name => "index_educations_on_school_id"

  create_table "employers", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.boolean  "paid"
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "max_degree_id"
    t.integer  "min_degree_id"
    t.string   "company_size"
    t.string   "search_radius"
    t.text     "description"
    t.string   "type"
    t.string   "website"
    t.string   "primary_industry"
    t.integer  "size"
    t.integer  "employee_turnover"
    t.string   "corporate_headquarters"
    t.integer  "international_offices"
    t.string   "mission_statement"
  end

  create_table "employers_institution_types", :id => false, :force => true do |t|
    t.integer "employer_id"
    t.integer "institution_type_id"
  end

  add_index "employers_institution_types", ["employer_id"], :name => "employer_id_on_institution_type_join"
  add_index "employers_institution_types", ["institution_type_id"], :name => "institution_type_id_on_employer_join"

  create_table "experiences", :force => true do |t|
    t.string   "company"
    t.string   "title"
    t.string   "responsibilities"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "candidate_id"
  end

  create_table "experiences_job_functions", :id => false, :force => true do |t|
    t.integer "experience_id"
    t.integer "job_function_id"
  end

  add_index "experiences_job_functions", ["experience_id", "job_function_id"], :name => "exp_job_function_join"

  create_table "importances", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institution_types", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "job_functions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "job_titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "recipientID"
    t.integer  "senderID"
    t.string   "content"
    t.boolean  "isRead"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "groupID"
    t.integer  "chainNumber"
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "employer_id"
    t.integer  "minDegree"
    t.integer  "maxDegree"
    t.integer  "minExp"
    t.integer  "maxExp"
    t.integer  "duration"
  end

  create_table "preferred_answers", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "employer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "importance_id"
    t.integer  "employer_id"
    t.integer  "correct_answer_id"
    t.integer  "category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "importance_level"
  end

  create_table "roles_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
    t.string   "city"
  end

  create_table "user_blocks", :force => true do |t|
    t.integer  "blocker"
    t.integer  "blockee"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_favorites", :force => true do |t|
    t.integer  "employer_id"
    t.integer  "candidate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "phone"
    t.string   "password"
    t.date     "registrationDate"
    t.string   "street"
    t.string   "apt"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
