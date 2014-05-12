require 'spec_helper'

describe Movie do
  describe '#charge' do
    it 'should return amount of a movie to charge for period of time' do
      movie = Movie.new('Two Faces', Movie::REGULAR)
      rental = Rental.new(movie, 5)

      expect(movie.charge(rental.days_rented)).to eq(6.5)
    end
  end
end
