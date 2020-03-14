require 'time'

# first_name: string
# last_name: string
# date_of_birth: Time
# email: string

class Employee
  attr_reader :first_name, :last_name, :date_of_birth, :email

  def initialize(first_name:, last_name:, date_of_birth:, email:)
    @first_name = first_name
    @last_name = last_name
    @date_of_birth = Time.strptime(date_of_birth, '%Y/%m/%d')
    @email = email
  end
end
