require 'spec_helper'

describe Rental do
  describe '#charge' do
    it 'calculate amount of a rent' do
      movie = Movie.new('Two Faces', RegularPrice.new)
      rental = Rental.new(movie, 5)
      expect(rental.charge).to eq(6.5)
    end
  end

  describe '#frequent_renter_points' do
    context 'regular movies' do
      it 'should return 1 if the movie is not new release' do
        movie = Movie.new('Two Faces', RegularPrice.new)
        rental = Rental.new(movie, 5)

        expect(rental.frequent_renter_points).to eq(1)
      end
    end

    context 'new release movies' do
      it 'should return 2 if the movie is new release' do
        movie = Movie.new('Cat', NewReleasePrice.new)
        rental = Rental.new(movie, 15)

        expect(rental.frequent_renter_points).to eq(2)
      end
    end
  end

end
