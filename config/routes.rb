Rails.application.routes.draw do
    resources :centrals, only: %i(index update)
    get 'restore' => 'centrals#restore', as: 'restore'
    get 'containers/:id' => 'containers#index'
    get 'statistic' => 'statistic#index', as: 'statistic'
    post 'statistic' => 'statistic#load', as: 'load'
    post 'manager_statistic' => 'statistic#manager_load', as: 'manager_load'
    root to: 'status#index'
end
