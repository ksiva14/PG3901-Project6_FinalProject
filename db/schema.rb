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

ActiveRecord::Schema.define(version: 20_211_203_030_609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'courses', force: :cascade do |t|
    t.integer 'course_num'
    t.text 'course_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'evaluations', force: :cascade do |t|
    t.bigint 'project_id'
    t.bigint 'team_id'
    t.integer 'for_student'
    t.integer 'by_student'
    t.boolean 'by_professor'
    t.integer 'score'
    t.text 'comment'
    t.boolean 'is_assigned'
    t.boolean 'can_view'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['project_id'], name: 'index_evaluations_on_project_id'
    t.index ['team_id'], name: 'index_evaluations_on_team_id'
  end

  create_table 'professors', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_professors_on_course_id'
    t.index ['user_id'], name: 'index_professors_on_user_id'
  end

  create_table 'project_teams', force: :cascade do |t|
    t.integer 'project_id'
    t.integer 'team_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.text 'project_name'
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_projects_on_course_id'
  end

  create_table 'students', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'team_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['team_id'], name: 'index_students_on_team_id'
    t.index ['user_id'], name: 'index_students_on_user_id'
  end

  create_table 'teams', force: :cascade do |t|
    t.text 'team_name'
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_teams_on_course_id'
  end

  create_table 'users', force: :cascade do |t|
    t.text 'name'
    t.text 'email'
    t.text 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
