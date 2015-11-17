Rails.application.routes.draw do
	resources :centrals, only: %i(index update)
	get 'containers/:id' => 'containers#index'
	root to: 'status#index'
end
