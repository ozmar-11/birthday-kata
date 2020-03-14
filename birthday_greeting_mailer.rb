require_relative './employee'

class BirthdayGreetingMailer
  attr_reader :employee

  def initialize(employee)
    @employee = employee
  end

  def email
    {
      subject: 'Happy Birthday',
      body: 'Happy birthday, dear John!'
    }
  end
end
