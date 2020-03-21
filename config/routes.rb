Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	namespace :api do
    namespace :v1 do
			get '/api/v1/merchants/:merchant_id/items', to: 'items#index'
			get '/api/v1/items/:item_id/merchant', to: 'merchants#show'

			resources :merchants, except: [:new, :edit]
			resources :items, except: [:new, :edit]
		end
  end
end
