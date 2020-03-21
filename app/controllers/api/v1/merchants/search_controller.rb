class Api::V1::Merchants::SearchController < ApplicationController
	def show
		Merchant.find_one(merchant_params)
	end

private

	def merchant_params
		params.require(:id, :name, :created_at, :updated_at)
	end
end
