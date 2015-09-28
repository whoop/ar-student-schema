require_relative '../config'


class CreateTeachersStudents < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id
    create_table :teachers_students, id: false do |c|
      c.belongs_to :student, index: true
      c.belongs_to :teacher, index: true
    end
  end
end
