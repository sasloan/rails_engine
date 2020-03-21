require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
		merchant = create(:merchant)

    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_successful
  end

	it "can get one item by its id" do
		merchant = create(:merchant)
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(id)
  end

	it "can create a new item" do
		merchant = create(:merchant)
  	item_params = { name: "Saw", description: "I want to play a game", unit_price: 5.00, merchant_id: merchant.id}

  	post "/api/v1/items", params: (item_params)
  	item = merchant.items.last

  	expect(response).to be_successful
  	expect(item.name).to eq(item_params[:name])
	end

	it "can update an existing item" do
		merchant = create(:merchant)
  	id = merchant.items.create(name: "Felicia", description: "Basic", unit_price: 5.00, merchant_id: merchant.id).id
  	previous_name = merchant.items.last.name
  	item_params = { name: "Sledge" }

  	put "/api/v1/items/#{id}", params: (item_params)
  	item = Item.find_by(id: id)

  	expect(response).to be_successful
  	expect(item.name).to_not eq("Felicia")
  	expect(item.name).to eq("Sledge")
	end

	it "can destroy an item" do
		merchant = create(:merchant)
  	item = merchant.items.create(name: "Felicia", description: "Basic", unit_price: 5.00, merchant_id: merchant.id)

  	expect(Item.count).to eq(1)

  	delete "/api/v1/items/#{item.id}"

  	expect(response).to be_successful
  	expect(Item.count).to eq(0)
  	expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
	end
end
