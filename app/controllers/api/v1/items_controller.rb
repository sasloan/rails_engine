class Api::V1::ItemsController < ApplicationController

	def index
		render json: ItemSerializer.new(Item.all)
	end

	def show
		render json: ItemSerializer.new(Item.find(params[:id]))
	end

	def create
		merchant = Merchant.find(params[:merchant_id])
		render json: ItemSerializer.new(merchant.items.create(item_params))
	end

	def update
		merchant = Merchant.find(params[:merchant_id])
		item = merchant.items.find(params[:id])
		render json: ItemSerializer.new(Item.update(params[:id], item_params))
	end

	def destroy
		merchant = Merchant.find(params[:merchant_id])
		item = merchant.items.find(params[:id])
		render json: ItemSerializer.new(item.destroy)
	end

private

	def item_params
		params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
	end
end
