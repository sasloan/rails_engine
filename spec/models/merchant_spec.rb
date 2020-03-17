require 'rails_helper'

RSpec.describe Merchant, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
	end

	describe 'Relationships' do
		it {should have_many :items}
		it {should have_many :invoices}
		it {should have_many(:customers).through(:invoices)}
	end

	describe 'Methods' do
		before :each do
			@dog_shop = Merchant.create!("Dog Shop")
			@bike_shop = Merchant.create!("Bike Shop")
			@candy_shop = Merchant.create!("Candy Shop")
			@icecream_shop = Merchant.create!("Ice Cream Shop")
			@coffee_shop = Merchant.create!("Coffee Shop")
			@pizza_shop = Merchant.create!("Pizza Shop")
			
end
