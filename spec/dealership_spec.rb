require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
#Iteration 2
  before(:each) do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
  end

  it 'exists' do

    expect(@dealership).to be_an_instance_of(Dealership)
  end

  it 'has an inventory list and can count it' do

    expect(@dealership.inventory).to eq([])
    expect(@dealership.inventory_count).to eq(0)
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)

    expect(@dealership.inventory).to  eq([@car_1, @car_2])
    expect(@dealership.inventory_count).to eq(2)
  end
#Iteration 3
  it 'does not have inventory at start by default' do

    expect(@dealership.has_inventory?).to eq(false)
  end

  it 'can sort cars_by_make' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.cars_by_make("Toyota")).to eq([@car_2, @car_3])

    expect(@dealership.cars_by_make("Ford")).to eq([@car_1])
  end

  it 'dealership has total_value' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.total_value).to eq(156000)
  end

  it 'has details hash' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
  end
#Iteration 4
  it 'can calculate average_price_of_car' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.average_price_of_car).to eq("39,000")
  end

  it 'can sort cars by price' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.cars_sorted_by_price).to eq([@car_3,@car_4,@car_2,@car_1])
  end

  it 'can store inventory key values' do
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    result = {"Ford"=> [@car_1],
              "Toyota"=> [@car_2, @car_3],
              "Chevrolet"=> [@car_4]}
    expect(@dealership.inventory_hash).to eq(result)
  end
end
