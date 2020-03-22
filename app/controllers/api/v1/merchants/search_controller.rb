class Api::V1::Merchants::SearchController < ApplicationController
	def show
		render json: MerchantSerializer.new(Merchant.where("#{request.query_parameters.keys[0]} like ?", "%#{request.query_parameters.values[0].capitalize}%").limit(1))
	end

private

	def merchant_params
		params.permit(:id, :name, :created_at, :updated_at)
	end
end
