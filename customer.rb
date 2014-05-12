class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # add frequent renter points

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    #add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  private
  def total_charge
    @rentals.reduce(0) { |sum, rental| sum += rental.charge }
  end

  def total_frequent_renter_points
    @rentals.reduce(0) { |sum, rental| sum += rental.frequent_renter_points }
  end

end
