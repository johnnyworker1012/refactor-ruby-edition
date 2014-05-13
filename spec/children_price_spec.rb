require 'spec_helper'

describe 'ChildrenPrice' do
  describe '#charge' do
    context 'rented days less than 3 days' do
      it 'should charge a regular price' do
        movie = Movie.new('Cat', Movie::CHILDRENS)
        rental = Rental.new(movie, 1)

        expect(movie.price.charge(rental.days_rented)).to eq(1.5)
      end
    end

    context 'rented days more than 3 days' do
      it 'should charge a regular price' do
        movie = Movie.new('Cat', Movie::CHILDRENS)
        rental = Rental.new(movie, 5)

        expect(movie.price.charge(rental.days_rented)).to eq(4.5)
      end
    end
  end
end
