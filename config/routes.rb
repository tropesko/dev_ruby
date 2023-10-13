Rails.application.routes.draw do
  resources :customers do
    resources :orders, only: [:index]
    member do
      post :block
    end
  end

end
