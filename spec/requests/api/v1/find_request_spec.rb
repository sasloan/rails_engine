require 'rails_helper'

describe "When a user inserts 'GET /api/v1/<resource>/find?<attribute>=<value>'" do
	it 'returns the oppropriate response' do

		get "/api/v1/items/find?name=pen"

		expect(response).to be_successful
	end
end
