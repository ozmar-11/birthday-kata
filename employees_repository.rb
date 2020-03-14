require 'csv'
require_relative './employee'

class EmployeesRepository
  attr_reader :employees

  def initialize
    load_employees
  end

  def all
    employees
  end

  def by_date(date)
    load_employees.select do |employee|
      employee.date_of_birth.month == date.month && employee.date_of_birth.day == date.day
    end
  end

  private

  def load_employees
    @employees ||=
      CSV.read(
        'employees.csv',
        headers: true,
        header_converters: lambda { |h| (h.strip).to_sym },
        converters: lambda { |r| r ? r.strip : nil }
      ).map { |employee| Employee.new(employee) }
  end
end
