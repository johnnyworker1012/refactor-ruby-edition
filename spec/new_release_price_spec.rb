require 'spec_helper'

describe NewReleasePrice do
  describe '#charge' do
    it 'should charge a new release price' do
      movie = Movie.new('Cat', NewReleasePrice.new)
      rental = Rental.new(movie, 5)

      expect(movie.price.charge(rental.days_rented)).to eq(15)
    end
  end

  describe '#frequent_renter_points' do
    context 'days rented more than 1' do
      it 'should return frequent renter points' do
        price = NewReleasePrice.new
        expect(price.frequent_renter_points(3)).to eq(2)
      end
    end

    context 'days rented less than 1' do
      it 'should return frequent renter points' do
        price = NewReleasePrice.new
        expect(price.frequent_renter_points(1)).to eq(1)
      end
    end

  end
end
