require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "Validations" do
		it {should validate_presence_of :name}
	end

	describe "Relationships" do
		it {should have_many :items}
		it {should have_many :invoices}
		it {should have_many(:customers).through(:invoices)}
	end

	describe "Methods" do
		before :each do
			@walmart = Merchant.create!(name: "Walmart")
			@watch = @walmart.items.create!(name: "Watch", description: "Cool Watch", unit_price: 3.50)
			@hat = @walmart.items.create!(name: "Skull Cap", description: "Fitted Skull Cap", unit_price: 5.00)
			@tshirt = @walmart.items.create!(name: "T-Shirt", description: "graphic T-shirt", unit_price: 7.00)
			@shoes = @walmart.items.create!(name: "Asics", description: "Running shoes", unit_price: 12.00)
			@wells = Merchant.create!(name: "Wells Fargo")
			@register = @wells.create!(name: "register", description: "Money Holder", unit_price: 150.00)
			@computer = @wells.create!(name: "Computer", description: "account holder", unit_price: 350.00)
			@vault = @wells.create!(name: "vault", description: "real money holder", unit_price: 1000.00)
			@dicks = Merchant.create!(name: "Dicks Sporting Goods")
			@ball = @dicks.items.create!(name: "Foot Ball", description: "Ball for playing football", unit_price: 15.00)
			@gum = @dicks.items.create!(name: "Gum", description: "chew while playing baseball", unit_price: 4.00)
			@skates = @dicks.items.create!(name: "Roller Skates", description: "Skates to roll around on", unit_price: 89.00)
			@club = @dicks.items.create!(name: "Golf Club", description: "Set of Golf Clubs", unit_price: 20.00)
			@subway = Merchant.create!(name: "Subway")
			@sandwich = @subway.create!(name: "Sub sandwich", descrption: "Food", unit_price: 5.00)
			@pickles = @subway.create!(name: "Pickles", descrption: "sour cucumber", unit_price: 2.00)
			@lettuce = @subway.create!(name: "Lettuce", descrption: "shredded veggtable", unit_price: 1.00)
			@bread = @subway.create!(name: "Bread", descrption: "case for condiments", unit_price: 10.00)
			@sherry = Customer.create!(first_name: "Sherry", last_name: "Smith")
			@holly = Customer.create!(first_name: "Holly", last_name: "Smith")
			@nancy = Customer.create!(first_name: "Nancy", last_name: "Smith")
			@invoice_1 = Invoice.create!(status: true, customer_id: @sherry.id, merchant_id: @walmart.id)
			@sherry_walmart_1 = InvoiceItem.create!(quantity: 4, unit_price: 3.50, invoice_id: @invoice_1.id, item_id: @watch.id)
			@sherry_walmart_2 = InvoiceItem.create!(quantity: 7, unit_price: 5.00, invoice_id: @invoice_1.id, item_id: @hat.id)
			@sherry_walmart_3 = InvoiceItem.create!(quantity: 8, unit_price: 7.00, invoice_id: @invoice_1.id, item_id: @tshirt.id)
			@sherry_walmart_4 = InvoiceItem.create!(quantity: 2, unit_price: 12.00, invoice_id: @invoice_1.id, item_id: @shoes.id)
			@invoice_2 = Invoice.create!(status: true, customer_id: @sherry.id, merchant_id: @wells.id)
			@sherry_wells_1 = InvoiceItem.create!(quantity: 1, unit_price: 150.00, invoice_id: @invoice_2.id, item_id: @register.id)
			@invoice_3 = Invoice.create!(status: true, customer_id: @sherry.id, merchant_id: @dicks.id)
			@sherry_dicks_1 = InvoiceItem.create!(quantity: 8, unit_price: 15.00, invoice_id: @invoice_3.id, item_id: @ball.id)
			@sherry_dicks_3 = InvoiceItem.create!(quantity: 4, unit_price: 89.00, invoice_id: @invoice_3.id, item_id: @skates.id)
			@sherry_dicks_4 = InvoiceItem.create!(quantity: 5, unit_price: 20.00, invoice_id: @invoice_3.id, item_id: @club.id)
			@invoice_4 = Invoice.create!(status: true, customer_id: @sherry.id, merchant_id: @subway.id)
			@sherry_subway_1 = InvoiceItem.create!(quantity: 5, unit_price: 5.00, invoice_id: @invoice_4.id, item_id: @sandwich.id)
			@invoice_5 = Invoice.create!(status: true, customer_id: @holly.id, merchant_id: @walmart.id)
			@holly_walmart_1 = InvoiceItem.create!(quantity: 10, unit_price: 3.50, invoice_id: @invoice_5.id, item_id: @watch.id)
			@holly_walmart_2 = InvoiceItem.create!(quantity: 20, unit_price: 5.00, invoice_id: @invoice_5.id, item_id: @hat.id)
			@holly_walmart_3 = InvoiceItem.create!(quantity: 30, unit_price: 7.00, invoice_id: @invoice_5.id, item_id: @tshirt.id)
			@invoice_6 = Invoice.create!(status: true, customer_id: @holly.id, merchant_id: @wells.id)
			@holly_wells_2 = InvoiceItem.create!(quantity: 15, unit_price: 350.00, invoice_id: @invoice_6.id, item_id: @computer.id)
			@invoice_7 = Invoice.create!(status: true, customer_id: @holly.id, merchant_id: @dicks.id)
			@holly_dicks_2 = InvoiceItem.create!(quantity: 50, unit_price: 4.00, invoice_id: @invoice_7.id, item_id: @gum.id)
			@holly_dicks_4 = InvoiceItem.create!(quantity: 25, unit_price: 20.00, invoice_id: @invoice_7.id, item_id: @club.id)
			@invoice_8 = Invoice.create!(status: true, customer_id: @holly.id, merchant_id: @subway.id)
			@holly_subway_1 = InvoiceItem.create!(quantity: 10, unit_price: 5.00, invoice_id: @invoice_8.id, item_id: @sandwich.id)
			@holly_subway_3 = InvoiceItem.create!(quantity: 60, unit_price: 1.00, invoice_id: @invoice_8.id, item_id: @lettuce.id)
			@holly_subway_4 = InvoiceItem.create!(quantity: 80, unit_price: 10.00, invoice_id: @invoice_8.id, item_id: @bread.id)
			@invoice_9 = Invoice.create!(status: true, customer_id: @nancy.id, merchant_id: @walmart.id)
			@nancy_walmart_1 = InvoiceItem.create!(quantity: 1, unit_price: 3.50, invoice_id: @invoice_9.id, item_id: @watch.id)
			@nancy_walmart_2 = InvoiceItem.create!(quantity: 1, unit_price: 5.00, invoice_id: @invoice_9.id, item_id: @hat.id)
			@nancy_walmart_3 = InvoiceItem.create!(quantity: 1, unit_price: 7.00, invoice_id: @invoice_9.id, item_id: @tshirt.id)
			@nancy_walmart_4 = InvoiceItem.create!(quantity: 1, unit_price: 12.00, invoice_id: @invoice_9.id, item_id: @shoes.id)
			@invoice_10 = Invoice.create!(status: true, customer_id: @nancy.id, merchant_id: @wells.id)
			@nancy_wells_1 = InvoiceItem.create!(quantity: 1, unit_price: 150.00, invoice_id: @invoice_10.id, item_id: @register.id)
			@nancy_wells_2 = InvoiceItem.create!(quantity: 1, unit_price: 350.00, invoice_id: @invoice_10.id, item_id: @computer.id)
			@nancy_wells_3 = InvoiceItem.create!(quantity: 1, unit_price: 1000.00, invoice_id: @invoice_10.id, item_id: @vault.id)
			@invoice_11 = Invoice.create!(status: true, customer_id: @nancy.id, merchant_id: @dicks.id)
			@nancy_dicks_1 = InvoiceItem.create!(quantity: 1, unit_price: 15.00, invoice_id: @invoice_11.id, item_id: @ball.id)
			@nancy_dicks_2 = InvoiceItem.create!(quantity: 1, unit_price: 4.00, invoice_id: @invoice_11.id, item_id: @gum.id)
			@nancy_dicks_3 = InvoiceItem.create!(quantity: 1, unit_price: 89.00, invoice_id: @invoice_11.id, item_id: @skates.id)
			@nancy_dicks_4 = InvoiceItem.create!(quantity: 1, unit_price: 20.00, invoice_id: @invoice_11.id, item_id: @club.id)
			@invoice_12 = Invoice.create!(status: true, customer_id: @nancy.id, merchant_id: @subway.id)
			@nancy_subway_1 = InvoiceItem.create!(quantity: 1, unit_price: 5.00, invoice_id: @invoice_12.id, item_id: @sandwich.id)
			@nancy_subway_2 = InvoiceItem.create!(quantity: 1, unit_price: 2.00, invoice_id: @invoice_12.id, item_id: @pickles.id)
			@nancy_subway_3 = InvoiceItem.create!(quantity: 1, unit_price: 1.00, invoice_id: @invoice_12.id, item_id: @lettuce.id)
			@nancy_subway_4 = InvoiceItem.create!(quantity: 1, unit_price: 10.00, invoice_id: @invoice_12.id, item_id: @bread.id)
			@transaction_1 = Transaction.create!(credit_card_number: "1234 5678 9101 1112", result: true, invoice_id: @invoice_1.id)
			@transaction_2 = Transaction.create!(credit_card_number: "1234 5678 9101 1112", result: true, invoice_id: @invoice_2.id)
			@transaction_3 = Transaction.create!(credit_card_number: "1234 5678 9101 1112", result: true, invoice_id: @invoice_3.id)
			@transaction_4 = Transaction.create!(credit_card_number: "1234 5678 9101 1112", result: true, invoice_id: @invoice_4.id)
			@transaction_5 = Transaction.create!(credit_card_number: "1314 1516 1718 1920", result: true, invoice_id: @invoice_5.id)
			@transaction_6 = Transaction.create!(credit_card_number: "1314 1516 1718 1920", result: true, invoice_id: @invoice_5.id)
			@transaction_7 = Transaction.create!(credit_card_number: "1314 1516 1718 1920", result: true, invoice_id: @invoice_7.id)
			@transaction_8 = Transaction.create!(credit_card_number: "1314 1516 1718 1920", result: true, invoice_id: @invoice_8.id)
			@transaction_9 = Transaction.create!(credit_card_number: "2122 2324 2526 2728", result: true, invoice_id: @invoice_9.id)
			@transaction_10 = Transaction.create!(credit_card_number: "2122 2324 2526 2728", result: true, invoice_id: @invoice_10.id)
			@transaction_11 = Transaction.create!(credit_card_number: "2122 2324 2526 2728", result: true, invoice_id: @invoice_11.id)
			@transaction_12 = Transaction.create!(credit_card_number: "2122 2324 2526 2728", result: true, invoice_id: @invoice_12.id)
		end


	end
end
