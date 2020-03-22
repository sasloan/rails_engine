class Api::V1::Items::SearchController < ApplicationController
	def show
		render json: ItemSerializer.new(Item.find_by("#{request.GET.keys[0]} like ?", "%#{request.GET.values[0].titlecase}%"))
	end

	def index
		render json: ItemSerializer.new(Item.where("#{request.GET.keys[0]} like ?", "%#{request.GET.values[0].titlecase}%"))
	end
end
