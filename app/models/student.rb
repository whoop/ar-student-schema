require_relative '../../db/config'
require 'faker'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true, :email => true
  validates :age, :numericality => { greater_than: 5 }
  validate :phone_has_ten_or_more_digits

  def phone_has_ten_or_more_digits
    unless self.phone.scan(/\d/).count >= 10
      errors.add(:phone, "phone number has too few digits.")
    end
  end
  def name 
    "#{self.first_name} #{self.last_name}"
  end
  def age
    ((Date.today - self.birthday)/365.25).to_i
  end

end

# student = Student.create :first_name => Faker::Name.first_name,
#                :last_name  => Faker::Name.last_name,
#                :email      => Faker::Internet.email,
#                :birthday   => Date.today - rand(15..40)*365,
#                :gender     => ['m', 'f'].sample,
#                :phone      => Faker::PhoneNumber.phone_number

# student = Student.find(1)
# p student.name
# p student.age