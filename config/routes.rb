Rails.application.routes.draw do
  	root 'post_photos#index'
	devise_for :users
	resources :post_photos, except: [:index, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
