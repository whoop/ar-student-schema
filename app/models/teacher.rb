require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  validates_uniqueness_of :email, message: '%{value} is not unique'
  has_and_belongs_to_many :students
end
