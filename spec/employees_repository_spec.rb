require_relative '../employees_repository'
require_relative '../employee'
require 'pry'

RSpec.describe EmployeesRepository do
  let(:employees_params) do
    [
      { first_name: 'Doe', last_name: 'John', date_of_birth: '1982/10/08', email: 'john.doe@foobar.com' },
      { first_name: 'Ann', last_name: 'Mary', date_of_birth: '1975/09/11', email: 'mary.ann@foobar.com' },
      { first_name: 'Doe', last_name: 'Jen', date_of_birth: '1975/09/12', email: 'jen.doe@foobar.com' }
    ]
  end
  let(:employees_repository) { EmployeesRepository.new }

  before do
    allow(CSV).to receive(:read).and_return(employees_params)
  end

  context '#all' do
    it 'should return all the employees' do
      expect(employees_repository.all.length).to eq(employees_params.length)
    end
  end

  context '#by_date' do
    it 'should return the employees whose birthday is the sent day' do
      expect(employees_repository.by_date(Time.strptime('1975/09/11', '%Y/%m/%d')).length).to eq(1)
    end

    it 'should return and empty array if not birthday on that date' do
      expect(employees_repository.by_date(Time.strptime('2020/12/11', '%Y/%m/%d'))).to be_empty
    end
  end
end
