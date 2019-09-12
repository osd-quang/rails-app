Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  resources :posts
  resources :categories
  resources :users

  get :images, to: "search_image#index"
  get :testschedule, to: "search_image#testschedule"
  get :get_images, to: "search_image#get_images"
  get :get_address, to: "search_image#get_address"
  post :post_user, to: "search_image#post_user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
