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
			@ball = @dog_shop.items.create!(name: "Ball", description: "Tennis Ball", unit_price: 3.50)
			@pull_toy = @dog_shop.items.create!(name: "Pull Toy", description: "Play Tug of war", unit_price: 6.00)
			@collar = @dog_shop.items.create!(name: "Collar", description: "Handsome puppers", unit_price: 12.00)
			@leash = @dog_shop.items.create!(name: "Leash", description: "Good Walks", unit_price: 12.00)
			@bike_shop = Merchant.create!("Bike Shop")
			@chain = @bike_shop.items.create!(name: "Chain", description: "Bike Chain", unit_price: 20.00)
			@seat = @bike_shop.items.create!(name: "Seat", description: "Comfy seat", unit_price: 15.00)
			@bell = @bike_shop.items.create!(name: "Handle Bar Bell", description: "Ring Ring", unit_price: 30.00)
			@basket = @bike_shop.items.create!(name: "Basket", description: "Puppers holder", unit_price: 40.00)
			@icecream_shop = Merchant.create!("Ice Cream Shop")
			@vanilla = @icecream_shop.items.create!(name: "Vanilla", description: "Soft and smooth", unit_price: 10.00)
			@strawberry = @icecream_shop.items.create!(name: "Strawberry", description: "Sweet and Tart", unit_price: 20.00)
			@coffee = @icecream_shop.items.create!(name: "Coffee", description: "Breakfast Icecream", unit_price: 30.00)
			@chocolate = @icecream_shop.items.create!(name: "Chocolate", description: "Best EVER!!", unit_price: 40.00)
			@coffee_shop = Merchant.create!("Coffee Shop")
			@mocha = @coffee_shop.create!(name: "Mocha latte", description: "Ahhh Coffee", unit_price: 7.00)
			@carmel = @coffee_shop.create!(name: "Carmel Machiato", description: "Basic", unit_price: 10.00)
			@cold_brew = @coffee_shop.create!(name: "Cold Brew", description: "New Age", unit_price: 5.00)
			@foam = @coffee_shop.create!(name: "Foam Cappacino", description: "Extra", unit_price: 12.00)
			@pizza_shop = Merchant.create!("Pizza Shop")
			@pepperoni = @pizza_shop.items.create!(name: "Pepperoni", description: "BEST EVER!!", unit_price: 5.00)
			@cheese = @pizza_shop.items.create!(name: "Cheese", description: "essential as air", unit_price: 10.00)
			@olives = @pizza_shop.items.create!(name: "Olives", description: "Okay sometimes", unit_price: 15.00)
			@sauce = @pizza_shop.items.create!(name: "Sauce", description: "Pizza Blood", unit_price: 20.00)
			@sherry = Customer.create!(first_name: "Sherry", last_name: "Smith")
			@holly = Customer.create!(first_name: "Holly", last_name: "Smith")
			@nancy = Customer.create!(first_name: "Nancy", last_name: "Smith")
			@sherry_invoice_1 = Invoice.create!(customer_id: 1, merchant_id: 1, status: true)
			@sherry_invoice_2 = Invoice.create!(customer_id: 1, merchant_id: 2, status: true)
			@sherry_invoice_3 = Invoice.create!(customer_id: 1, merchant_id: 3, status: false)
			@holly_invoice_1 = Invoice.create!(customer_id: 2, merchant_id: 4, status: true)
			@holly_invoice_2 = Invoice.create!(customer_id: 2, merchant_id: 5, status: true)
			@holly_invoice_3 = Invoice.create!(customer_id: 2, merchant_id: 1, status: false)
			@nancy_invoice_1 = Invoice.create!(customer_id: 3, merchant_id: 2, status: true)
			@nancy_invoice_2 = Invoice.create!(customer_id: 3, merchant_id: 3, status: true)
			@nancy_invoice_3 = Invoice.create!(customer_id: 3, merchant_id: 4, status: false)
			@transaction_1 = @sherry_invoice_1.transactions.create!(credit_card_number: 1234567890111213, credit_card_expiration_date: "12-10-2024")
			@transaction_2 = @sherry_invoice_2.transactions.create!(credit_card_number: 1415161718192021, credit_card_expiration_date: "11-10-2024")
			@transaction_3 = @sherry_invoice_3.transactions.create!(credit_card_number: 2223242526272829, credit_card_expiration_date: "1-10-2024")
			@transaction_4 = @holly_invoice_1.transactions.create!(credit_card_number: 3031323334353637, credit_card_expiration_date: "5-10-2025")
			@transaction_5 = @holly_invoice_2.transactions.create!(credit_card_number: 3839404142434445, credit_card_expiration_date: "7-10-2025")
			@transaction_6 = @holly_invoice_3.transactions.create!(credit_card_number: 4647484950515253, credit_card_expiration_date: "8-10-2026")
			@transaction_7 = @nancy_invoice_1.transactions.create!(credit_card_number: 5455565758596061, credit_card_expiration_date: "9-10-2025")
			@transaction_8 = @nancy_invoice_2.transactions.create!(credit_card_number: 6263646566676869, credit_card_expiration_date: "8-10-2024")
			@transaction_9 = @nancy_invoice_3.transactions.create!(credit_card_number: 7071727374757677, credit_card_expiration_date: "12-10-2024")
		end
	end



end
