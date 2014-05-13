class Movie
  attr_reader :title
  attr_accessor :price

  def initialize(title, price)
    @title, @price = title, price
  end

  def charge days_rented
    @price.charge days_rented
  end

  def frequent_renter_points days_rented
    @price.frequent_renter_points days_rented
  end

end
