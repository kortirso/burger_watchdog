Rails.application.routes.draw do
	resources :centrals, only: %i(index update)
	root to: 'status#index'
end
