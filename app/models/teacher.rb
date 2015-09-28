require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  validates :email, :uniqueness => { :message => '%{value} is not unique' }
  has_and_belongs_to_many :students
end
