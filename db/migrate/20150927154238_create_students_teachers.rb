require_relative '../config'


class CreateStudentsTeachers < ActiveRecord::Migration
  def change
    create_table :students_teachers, id: false do |c|
      c.belongs_to :student, index: true
      c.belongs_to :teacher, index: true
    end
  end
end
