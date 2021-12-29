Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :albums do
    collection do
      delete "delete_image"

    end
  end
  resources :home do
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  
  get 'search',to: 'albums#search'


  resources :home
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
