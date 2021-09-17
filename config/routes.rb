Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/merchants/:merchant_id/items",          to: "merchant_items#index"
  get "/merchants/:merchant_id/items/:item_id", to: "merchant_items#show"

  namespace :admin, only: [:index, :show, :edit, :update] do
    resources :merchants
  end
end
