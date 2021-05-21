class Dealership
  attr_reader :name,
              :address,
              :inventory
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.size
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    !@inventory.empty?
  end

  def cars_by_make(make)
    @inventory.find_all { |car| car.make == make }
  end

  def total_value
    @inventory.sum {|car| car.total_cost}
  end

  def details
    details_h = {}
    details_h["total_value"]= total_value
    details_h["address"]= @address
    details_h
  end

  def average_price_of_car
    (total_value/inventory_count).to_s.insert(-4,',')
  end

  def cars_sorted_by_price
    @inventory.sort_by {|car| car.total_cost}
  end

  def inventory_hash
    cars_by_make = Hash.new{|hash,key| hash[key]=[]}
    @inventory.each do |car|
      cars_by_make[car.make] << car
    end
    cars_by_make
  end

end
