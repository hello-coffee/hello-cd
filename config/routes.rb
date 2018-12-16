Rails.application.routes.draw do

  devise_for :admins, controllers: {
        sessions: "admins/sessions",
        passwords: "admins/paswwords",
        registrations: "admins/registrations"
    }
  devise_for :users, controllers: {
        sessions: "users/sessions",
        passwords: "users/passwords",
        registrations: "users/registrations"
    }
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

    resources :users, only: [:show, :update, :destroy, :edit]

    resources :artists, only: [:show]

    get 'users/:id/favorite_artists' => 'users#favorite_artists'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
