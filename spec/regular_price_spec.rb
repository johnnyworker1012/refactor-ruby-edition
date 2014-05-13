require 'spec_helper'

describe RegularPrice do
  describe '#charge' do
    context 'rented days more than 2 days' do
      it 'should charge a regular price' do
        movie = Movie.new('Two Faces', Movie::REGULAR)
        rental = Rental.new(movie, 5)

        expect(movie.price.charge(rental.days_rented)).to eq(6.5)
      end
    end

    context 'rented days less than 2 days' do
      it 'should charge a regular price' do
        movie = Movie.new('Two Faces', Movie::REGULAR)
        rental = Rental.new(movie, 1)

        expect(movie.price.charge(rental.days_rented)).to eq(2)
      end
    end
  end
end
