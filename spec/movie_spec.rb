require 'spec_helper'

describe Movie do

  describe 'initialize' do
    it 'should set price of a movie initialy' do
      movie = Movie.new('Two Faces', RegularPrice.new)
      expect(movie.price).to be_an_instance_of(RegularPrice)
    end
  end

  describe '#charge' do
    it 'should return amount of a movie to charge for period of time' do
      movie = Movie.new('Two Faces', RegularPrice.new)
      rental = Rental.new(movie, 5)

      expect(movie.charge(rental.days_rented)).to eq(6.5)
    end
  end

end
