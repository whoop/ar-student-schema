require_relative '../config'


class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |c|
      c.string :first_name, null: false
      c.string :last_name, null: false
      c.string :email, null: false
      c.string :phone, null: false
    end
  end
end
