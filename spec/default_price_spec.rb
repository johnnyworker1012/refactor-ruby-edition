require 'spec_helper'

describe DefaultPrice do
  describe '#frequent_renter_points' do
    it 'should renturn frequent renter points' do
      Price = Class.new do
        include DefaultPrice
      end

      expect(Price.new.frequent_renter_points(2)).to eq(1)
    end
  end
end
