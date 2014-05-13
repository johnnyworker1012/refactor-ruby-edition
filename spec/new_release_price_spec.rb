require 'spec_helper'

describe NewReleasePrice do
  describe '#charge' do
    it 'should charge a new release price' do
      movie = Movie.new('Cat', Movie::NEW_RELEASE)
      rental = Rental.new(movie, 5)

      expect(movie.price.charge(rental.days_rented)).to eq(15)
    end
  end
end
