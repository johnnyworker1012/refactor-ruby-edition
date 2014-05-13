class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code
  attr_accessor :price

  def initialize(title, price_code)
    @title, @price_code = title, price_code
    set_price price_code
  end

  def price_code= value
    @price_code = value
    set_price value
  end

  def charge days_rented
    @price.charge days_rented
  end

  private
  def set_price value
    @price = case value
    when NEW_RELEASE then NewReleasePrice.new
    when REGULAR then RegularPrice.new
    when CHILDRENS then ChildrenPrice.new
    end
  end

end
