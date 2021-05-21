require './lib/car'

RSpec.describe Car do
#Iteration 1
  before(:each) do
    @car = Car.new("Ford Mustang", 1500, 36)
  end

  it 'exists' do

    expect(@car).to be_an_instance_of(Car)
  end

  it 'has attributes' do

    expect(@car.make).to eq("Ford")
    expect(@car.model).to eq("Mustang")
    expect(@car.monthly_payment).to eq(1500)
    expect(@car.loan_length).to eq(36)
  end

  it 'has total_cost' do

    expect(@car.total_cost).to eq(54000)
  end

  it 'starts unpainted and can be painted' do

    expect(@car.color).to eq(nil)
    @car.paint!(:blue)

    expect(@car.color).to eq(:blue)
  end

end
