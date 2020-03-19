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
end
