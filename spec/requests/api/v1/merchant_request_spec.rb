require 'rails_helper'

describe "Merchant API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

		merchants = JSON.parse(response.body, symbolize_names: true)

		expect(merchants[:data].count).to eq(3)
  end

	it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(id)
  end

	it "can get the items for a specific merchant" do
    merchant = Merchant.create!(name: "Walmart")
		item = merchant.items.create!(name: "Watch", description: "Cool Mickey Watch", unit_price: 3.00)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(item.merchant_id)
  end

	it "can create a new merchant" do
  	merchant_params = { name: "Saw" }

  	post "/api/v1/merchants", params: {merchant: merchant_params}
  	merchant = Merchant.last

  	expect(response).to be_successful
  	expect(merchant.name).to eq(merchant_params[:name])
	end

	it "can update an existing merchant" do
  	id = create(:merchant).id

  	previous_name = Merchant.last.name
  	merchant_params = { name: "Sledge" }

  	put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
  	merchant = Merchant.find_by(id: id)

  	expect(response).to be_successful
  	expect(merchant.name).to_not eq(previous_name)
  	expect(merchant.name).to eq("Sledge")
	end

	it "can destroy an merchant" do
  	merchant = create(:merchant)

  	expect(Merchant.count).to eq(1)

  	delete "/api/v1/merchants/#{merchant.id}"

  	expect(response).to be_successful
  	expect(Merchant.count).to eq(0)
  	expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
	end
end
