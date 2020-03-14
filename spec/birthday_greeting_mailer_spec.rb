require_relative '../employee'
require_relative '../birthday_greeting_mailer'

RSpec.describe BirthdayGreetingMailer do
  let(:employee) do
    Employee.new({
      first_name: 'Jhon',
      last_name: 'Doe',
      date_of_birth: '1994/08/31',
      email: 'jhon.doe@example.com'})
  end

  context '#email' do
    it 'should return the email body and subject' do
      email = BirthdayGreetingMailer.new(employee).email

      expect(email).to have_key(:subject)
      expect(email).to have_key(:body)
    end
  end
end
