require 'rails_helper'

describe "When a user inserts 'GET /api/v1/<resource>/find?<attribute>=<value>'" do
	before :each do
		@walmart = Merchant.create!(name: "Walmart")
		@watch = @walmart.items.create!(name: "Cool Watch", description: "Micky Mouse Watch", unit_price: 5.00)
		@hat = @walmart.items.create!(name: "Cool Hat", description: "DBZ Hat!!", unit_price: 10.00)
		@shirt = @walmart.items.create!(name: "Cool Shirt", description: "T Shirt", unit_price: 15.00)
	end

	it 'returns the oppropriate response' do

		get "/api/v1/items/find_all?name=Cool"

		item = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(item[:data][0][:attributes][:id].to_i).to eq(@watch.id)
		expect(item[:data][1][:attributes][:id].to_i).to eq(@hat.id)
		expect(item[:data][2][:attributes][:id].to_i).to eq(@shirt.id)
	end

	it 'returns the oppropriate response even if it is not capitalized' do

		get "/api/v1/items/find_all?name=Cool Shirt"

		item = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(item[:data][0][:attributes][:id].to_i).to eq(@shirt.id)
	end

	it 'returns the oppropriate response even if the user does not fill out the whole name' do

		get "/api/v1/items/find_all?name=Cool"

		item = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(item[:data][0][:id].to_i).to eq(@watch.id)
	end

	xit "returns appropriate response even if you use two different parameters" do

		get "/api/v1/items/find_all?name=Cool&description=T Shirt"

		item = JSON.parse(response.body, symbolize_names: true)

		expect(response).to be_successful
		expect(item[:data][0][:id].to_i).to eq(@shirt.id)
	end
end
