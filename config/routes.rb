Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	namespace :api do
    namespace :v1 do
			get '/merchants/:merchant_id/items', to: 'items#index'
			get '/items/:item_id/merchant', to: 'merchants#show'

			resources :merchants, except: [:new, :edit]
			resources :items, except: [:new, :edit]
		end
  end
end
