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
			@walmart = Merchant.create("Walmart")
		end

		it ".search" do
			expect(Merchant.search("Walmart").records.length).to eq(1)
		end
	end
end
