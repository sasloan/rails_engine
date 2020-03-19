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
  	item = merchant.items.last

  	expect(response).to be_successful
  	expect(item.name).to eq(item_params[:name])
	end

	it "can update an existing item" do
		merchant = create(:merchant)
  	id = merchant.items.create(name: "Felicia", description: "Basic", unit_price: 5.00).id
  	previous_name = merchant.items.last.name
  	item_params = { name: "Sledge" }

  	put "/api/v1/merchants/#{merchant.id}/items/#{id}", params: {item: item_params}
  	item = Item.find_by(id: id)

  	expect(response).to be_successful
  	expect(item.name).to_not eq(previous_name)
  	expect(item.name).to eq("Sledge")
	end

	it "can destroy an item" do
		merchant = create(:merchant)
  	item = merchant.items.create(name: "Felicia", description: "Basic", unit_price: 5.00)

  	expect(Item.count).to eq(1)

  	delete "/api/v1/merchants/#{merchant.id}/items/#{item.id}"

  	expect(response).to be_successful
  	expect(Item.count).to eq(0)
  	expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
	end
end
