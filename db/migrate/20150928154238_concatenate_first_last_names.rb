require_relative '../config'

class ConcatenateFirstLastNames < ActiveRecord::Migration
  def up
    add_column :students, :name, :string

    Student.find_each do |student|
      n = [student.first_name, student.last_name].join(' ')
      student.update(name: n)
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.find_each do |student|
      fn, ln = student.name.split(' ', 2)
      student.update(first_name: fn, last_name: ln)
    end

    remove_column :students, :name
  end
end
