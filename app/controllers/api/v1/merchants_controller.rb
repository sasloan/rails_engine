class Api::V1::MerchantsController < ApplicationController

  def index
		render json: MerchantSerializer.new(Merchant.all)
  end

	def show
		if params[:item_id]
			item = Item.find(params[:item_id])
			merchant = item.merchant
			render json: MerchantSerializer.new(merchant)
		else
			render json: MerchantSerializer.new(Merchant.find(params[:id]))
		end
	end

	def create
		render json: MerchantSerializer.new(Merchant.create(merchant_params))
	end

	def update
		render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params))
	end

	def destroy
		merchant = Merchant.find(params[:id])
		render json: MerchantSerializer.new(merchant.delete)
	end

private

	def merchant_params
		params.require(:merchant).permit(:name)
	end
end
