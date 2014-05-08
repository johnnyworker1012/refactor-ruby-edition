require 'spec_helper'

describe Rental do
  describe '#charge' do
    it 'calculate amount of a rent' do
      movie = Movie.new('Two Faces', Movie::REGULAR)
      rental = Rental.new(movie, 5)
      expect(rental.charge).to eq(6.5)
    end
  end
end
