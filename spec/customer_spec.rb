require 'spec_helper'

describe Customer do
  let(:customer) { Customer.new('Johnny') }

  describe '#amount_for' do
    it 'calculate how much a rent costs' do
      movie = Movie.new('Two Faces', Movie::REGULAR)
      rental = Rental.new(movie, 5)
      expect(customer.amount_for(rental)).to eq(6.5)
    end
  end

  describe '#statement' do
    context 'regular movies' do
      it 'should return the statement after renting a movie' do
        movie1 = Movie.new('Two Faces', Movie::REGULAR)
        rental1 = Rental.new(movie1, 5)
        customer.add_rental(rental1)

        expect(customer.statement).to eq("Rental Record for Johnny\n" +
        "\tTwo Faces\t6.5\n" +
        "Amount owed is 6.5\n" +
        "You earned 1 frequent renter points")
      end
    end

    context 'regular, children movies' do
      it 'should return the statement after renting a movie' do
        movie1 = Movie.new('Two Faces', Movie::REGULAR)
        rental1 = Rental.new(movie1, 5)
        customer.add_rental(rental1)

        movie2 = Movie.new('Big Fish', Movie::CHILDRENS)
        rental2 = Rental.new(movie2, 1)
        customer.add_rental(rental2)

        expect(customer.statement).to eq("Rental Record for Johnny\n" +
        "\tTwo Faces\t6.5\n" +
        "\tBig Fish\t1.5\n" +
        "Amount owed is 8.0\n" +
        "You earned 2 frequent renter points")
      end
    end

    context 'regular, children, new release movies' do
      it 'should return the statement after renting a movie' do
        movie1 = Movie.new('Two Faces', Movie::REGULAR)
        rental1 = Rental.new(movie1, 5)
        customer.add_rental(rental1)

        movie2 = Movie.new('Big Fish', Movie::CHILDRENS)
        rental2 = Rental.new(movie2, 1)
        customer.add_rental(rental2)

        movie3 = Movie.new('Cat', Movie::NEW_RELEASE)
        rental3 = Rental.new(movie3, 15)
        customer.add_rental(rental3)

        expect(customer.statement).to eq("Rental Record for Johnny\n" +
        "\tTwo Faces\t6.5\n" +
        "\tBig Fish\t1.5\n" +
        "\tCat\t45\n" +
        "Amount owed is 53.0\n" +
        "You earned 4 frequent renter points")
      end
    end

  end
end
