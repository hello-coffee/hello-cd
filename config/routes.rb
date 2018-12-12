Rails.application.routes.draw do

    resources :admins, only: [:show]

    resources :cart_items, only: [:create, :destroy]

    resources :carts, only: [:show]

    resources :categories, only: [:show]

    resources :favorite_artists, only: [:create, :destroy]

    resources :news, only: [:create, :destroy]

    resources :orders, only: [:new, :create, :index]

    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]

    resources :reviews, only: [:new, :create, :index, :destroy]

    get '/searches' => 'searches#search'

    get '/contact' => 'top#contact'

    get '/guide' => 'top#guide'

    get '/artists' => 'users#favorite_artists'

    resources :users, only: [:show, :update, :destroy, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
