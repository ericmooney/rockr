Rockr::Application.routes.draw do
  resources :venues, :only => [:new, :create]
  resources :concerts, :only => [:new, :create]

  root :to => 'static_pages#index'
end
