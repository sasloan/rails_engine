require 'rails_helper'

describe "When a user inserts 'GET /api/v1/<resource>/find?<attribute>=<value>'" do
	before :each do
		@walmart = Merchant.create!(name: "Walmart")
		@dicks = Merchant.create!(name: "Dicks Sporting Goods")
		@wells = Merchant.create!(name: "Wells Fargo")
		@subway = Merchant.create!(name: "Subway")
	end

	it 'returns the oppropriate response' do

		get "/api/v1/merchants/find?name=walmart"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][:attributes][:id].to_i).to eq(@walmart.id)
	end

	it 'returns the oppropriate response even if it is not capitalized' do

		get "/api/v1/merchants/find?name=subway"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][:attributes][:id].to_i).to eq(@subway.id)
	end

	it 'returns the oppropriate response even if the user does not fill out the whole name' do

		get "/api/v1/merchants/find?name=Dicks"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][:id].to_i).to eq(@dicks.id)
	end
end
