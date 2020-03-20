Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	namespace :api do
    namespace :v1 do
      resources :merchants, except: [:new, :edit]
			resources :items, except: [:new, :edit]
			# 
			# namespace :items do
			# 	get '/:id/merchant', to: 'merchants#show'
			# end
			#
			# namespace :merchants do
			# 	get '/:id/items', to: 'items#index'
			# end
    end
  end
end
