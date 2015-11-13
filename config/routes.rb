Rails.application.routes.draw do
	resources :configs, only: %i(index update)
	root to: 'status#index'
end
