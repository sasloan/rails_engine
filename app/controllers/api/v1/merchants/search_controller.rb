class Api::V1::Merchants::SearchController < ApplicationController
	def show
		render json: MerchantSerializer.new(Merchant.find_by("#{request.GET.keys[0]} like ?", "%#{request.GET.values[0].capitalize}%"))
	end

	def index
		render json: MerchantSerializer.new(Merchant.where("#{request.GET.keys[0]} like ?", "%#{request.GET.values[0].capitalize}%"))
	end
end
