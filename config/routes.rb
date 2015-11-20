Rails.application.routes.draw do
	resources :centrals, only: %i(index update)
	get 'restore' => 'centrals#restore', as: 'restore'
	get 'containers/:id' => 'containers#index'
	get 'statistic' => 'statistic#index', as: 'statistic'
	root to: 'status#index'
end
