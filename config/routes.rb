Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/mock/document", to: redirect("/limitless/Documentation/index.html")
  get "/mock/layout", to: redirect("/limitless/layout/index.html")
  root "dashboards#index"

  resources :users
  resources :facebook_pages, only: :index
  resources :shops, only: [:new, :create, :index]
  resources :collections
  resources :products
  resources :facebook_connections, only: [:create, :destroy]

  resource :facebook_webhooks, only: [:show, :create]
  resource :facebook_chat, only: :show
  resource :customers, only: [:show, :edit, :update]

  get "/set_current_shop" => "shops#set_current_shop"

  get "*path", to: "application#rescue404" unless Rails.application.config.consider_all_requests_local
end
