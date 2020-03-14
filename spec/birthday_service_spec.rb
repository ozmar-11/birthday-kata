require_relative '../birthday_service'
require_relative '../birthday_greeting_mailer'

RSpec.describe BirthdayService do
  let(:employees_params) do
    [
      { first_name: 'Doe', last_name: 'John', date_of_birth: '1982/10/08', email: 'john.doe@foobar.com' },
      { first_name: 'Ann', last_name: 'Mary', date_of_birth: '1975/09/11', email: 'mary.ann@foobar.com' },
      { first_name: 'Doe', last_name: 'Jen', date_of_birth: '1975/09/12', email: 'jen.doe@foobar.com' }
    ]
  end
  let(:employees_repository) { EmployeesRepository.new }
  let(:birthday_service) { BirthdayService.new(employees_repository, BirthdayGreetingMailer) }

  before do
    allow(CSV).to receive(:read).and_return(employees_params)
  end

  context '#send_greetings' do
    it 'should return the body of the birthday emails of that date' do
      emails_sent = birthday_service.send_greetings(Time.strptime('1982/10/08', '%Y/%m/%d'))

      expect(emails_sent.length).to eq(1)
    end
  end
end
