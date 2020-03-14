class BirthdayService
  attr_reader :employee_repository, :mailer_class

  def initialize(employee_repository, mailer_class)
    @employee_repository = employee_repository
    @mailer_class = mailer_class
  end

  def send_greetings(date)
    employee_repository.by_date(date).map do |employee|
      mailer_class.new(employee).email
    end
  end
end
