require 'time'
require_relative '../employee'

RSpec.describe Employee do
  context '#initialize' do
    let(:employee_params) do
      {
        first_name: 'Jhon',
        last_name: 'Doe',
        date_of_birth: '1994/08/31',
        email: 'jhon.doe@example.com'
      }
    end
    let(:employee) { Employee.new(employee_params) }

    it 'should be able to return to its attribute methods' do
      expect(employee.first_name).to eq(employee_params.fetch(:first_name))
      expect(employee.last_name).to eq(employee_params.fetch(:last_name))
      expect(employee.date_of_birth).to eq(Time.strptime(employee_params.fetch(:date_of_birth), '%Y/%m/%d'))
      expect(employee.email).to eq(employee_params.fetch(:email))
    end
  end
end
