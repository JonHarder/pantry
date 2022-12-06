Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/shopping", to: "shopping#index"
  get "/recipes", to: "recipes#index"
  get "/ingredients", to: "ingredients#index"
end
