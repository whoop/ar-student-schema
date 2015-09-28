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