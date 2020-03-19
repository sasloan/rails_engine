require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
		id = create(:merchant).id
		
    create_list(:item, 3)

    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful
  end
end
