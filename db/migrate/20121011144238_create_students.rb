# In the db/migrate/20121011144238_create_students.rb file, you should use ActiveRecord migrations to implement the change method. This will allow us to do all of our database schema modifications completely from within code (rather than using SQLite and SQL Designer). Use the Railsguides Migration Overview to get used to the syntax.



require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |c|
      c.string :first_name, null: false
      c.string :last_name, null: false
      c.string :gender, null: false
      c.date :birthday, null: false
      c.string :email, null: false, uniqueness: true
      c.string :phone, null: false
    end
  end
end
