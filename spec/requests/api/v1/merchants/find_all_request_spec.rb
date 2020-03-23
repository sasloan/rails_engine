require 'rails_helper'

describe "When a user inserts 'GET /api/v1/<resource>/find?<attribute>=<value>'" do
	before :each do
		@walmart = Merchant.create!(name: "Walmart")
		@dicks = Merchant.create!(name: "Dicks Sporting Goods")
		@wells = Merchant.create!(name: "Wells Fargo")
		@subway = Merchant.create!(name: "Subway")
	end

	it 'returns the oppropriate response' do

		get "/api/v1/merchants/find_all?name=w"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][0][:attributes][:id].to_i).to eq(@walmart.id)
		expect(merchant[:data][1][:attributes][:id].to_i).to eq(@wells.id)
	end

	it 'returns the oppropriate response even if it is not capitalized' do

		get "/api/v1/merchants/find_all?name=subway"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][0][:attributes][:id].to_i).to eq(@subway.id)
	end

	it 'returns the oppropriate response even if the user does not fill out the whole name' do

		get "/api/v1/merchants/find_all?name=Dicks"

		merchant = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(merchant[:data][0][:id].to_i).to eq(@dicks.id)
	end
end
