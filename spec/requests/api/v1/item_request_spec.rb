require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
		merchant = create(:merchant)

    create_list(:item, 3)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
  end

	it "can get one item by its id" do
		merchant = create(:merchant)
    id = create(:item).id

    get "/api/v1/merchants/#{merchant.id}/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end

	it "can create a new item" do
		merchant = create(:merchant)
  	item_params = { name: "Saw", description: "I want to play a game", unit_price: 5.00}

  	post "/api/v1/merchants/#{merchant.id}/items", params: {item: item_params}
  	item = Item.last

  	expect(response).to be_successful
  	expect(item.name).to eq(item_params[:name])
	end
end
