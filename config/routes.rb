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
    resources :admins, only: [:show, :edit, :update, :destroy]

    resources :sends, only: [:new, :create]

    resources :carts, only: [:show, :destroy]

    resources :favorite_artists, only: [:create, :destroy]

    resources :news, only: [:create, :destroy]

    resources :orders, only: [:new, :create, :index, :update]

    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :reviews, only: [:new, :create, :index, :destroy]
      resource :cart_items, only: [:create, :destroy]
    end

    resources :reviews, only: [:new, :create, :index, :destroy]

    resources :categories do
        resource :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    end


    get '/searches' => 'searches#search'

    get '/contact' => 'top#contact'

    get '/guide' => 'top#guide'

    get '/user_show/:id', to: 'admins#user_show', as: 'user_show'

    resources :users, only: [:show, :update, :destroy, :edit]

    resources :artists do
        resource :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      member do
        post "add", to: "favorite_artists#create"
      end
    end

    get '/favorite_artists' => 'users#favorite_artists'

        # post '/products/:product_id/carts/:cart_id' => 'cart_items#create', as: 'create_cart_item'

        # post 'carts/:id/confirm' => 'carts#confirm', as: 'confirm'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
