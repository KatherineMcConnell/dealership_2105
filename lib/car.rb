class Car
  attr_reader :make,
              :model,
              :monthly_payment,
              :loan_length,
              :color

  def initialize(make_and_model, monthly_payment, loan_length)
    @make = make_and_model.split(" ").first
    @model = make_and_model.split(" ").last
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end

  def total_cost
    @monthly_payment * @loan_length
  end

  def paint!(color)
    @color = color
  end
end
