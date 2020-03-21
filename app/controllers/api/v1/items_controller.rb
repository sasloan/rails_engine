class Api::V1::ItemsController < ApplicationController

	def index
		if params[:merchant_id]
			merchant = Merchant.find(params[:merchant_id])
			item = merchant.items.all
			render json: ItemSerializer.new(item)
		else
			render json: ItemSerializer.new(Item.all)
		end
	end

	def show
		render json: ItemSerializer.new(Item.find(params[:id]))
	end

	def create
		render json: ItemSerializer.new(Item.create(item_params))
	end

	def update
		render json: ItemSerializer.new(Item.update(params[:id], item_params))
	end

	def destroy
		item = Item.find(params[:id])
		render json: ItemSerializer.new(item.destroy)
	end

private

	def item_params
		params.permit(:name, :description, :unit_price, :merchant_id)
	end
end
