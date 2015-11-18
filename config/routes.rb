Rails.application.routes.draw do
	resources :centrals, only: %i(index update)
	get 'restore' => 'centrals#restore', as: 'restore_path'
	get 'containers/:id' => 'containers#index'
	root to: 'status#index'
end
