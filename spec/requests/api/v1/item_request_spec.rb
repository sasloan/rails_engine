require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
		merchant = create(:merchant)

    create_list(:item, 3)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
  end
end
