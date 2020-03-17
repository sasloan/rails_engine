require 'rails_helper'

RSpec.describe Invoice, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :status}
	end

	describe 'Relationships' do
		it {should belong_to :customers}
		it {should belong_to :merchants}
		it {should have_many :transactions}
	end
end
