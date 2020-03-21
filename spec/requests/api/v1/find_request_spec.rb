require 'rails_helper'

describe "When a user inserts 'GET /api/v1/<resource>/find?<attribute>=<value>'" do
	before :each do
		@merchant = Merchant.create!(name: "Walmart")
	end

	it 'returns the oppropriate response' do

		get "/api/v1/merchants/find" 

		expect(response).to be_successful
	end
end
