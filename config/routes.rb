Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "recipes#index"
  resources :recipes do
    resources :ingredients
  end
  resource :ingredients

  get '/pantry', to: 'ingredients#index'
end
