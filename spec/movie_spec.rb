require 'spec_helper'

describe Movie do

  describe 'initialize' do
    it 'should set price of a movie initialy' do
      movie = Movie.new('Two Faces', Movie::REGULAR)
      expect(movie.price).to be_an_instance_of(RegularPrice)
    end
  end

  describe '#charge' do
    it 'should return amount of a movie to charge for period of time' do
      movie = Movie.new('Two Faces', Movie::REGULAR)
      rental = Rental.new(movie, 5)

      expect(movie.charge(rental.days_rented)).to eq(6.5)
    end
  end

  describe '#set_price_code' do
    it 'should set price code of a movie' do
      movie = Movie.new('Cat', Movie::NEW_RELEASE)
      movie.price_code = Movie::REGULAR
      expect(movie.price_code).to eq(0)
    end

    context 'when set movie to new release movie' do
      it 'should set a price according to the price code' do
        movie = Movie.new('Two Faces', Movie::REGULAR)
        movie.price_code = Movie::NEW_RELEASE

        expect(movie.price).to be_an_instance_of(NewReleasePrice)
      end
    end

    context 'when set movie to regular movie' do
      it 'should set a price according to the price code' do
        movie = Movie.new('Two Faces', Movie::NEW_RELEASE)
        movie.price_code = Movie::REGULAR

        expect(movie.price).to be_an_instance_of(RegularPrice)
      end
    end

    context 'when set movie to children movie' do
      it 'should set a price according to the price code' do
        movie = Movie.new('Two Faces', Movie::NEW_RELEASE)
        movie.price_code = Movie::CHILDRENS

        expect(movie.price).to be_an_instance_of(ChildrenPrice)
      end
    end

  end
end
