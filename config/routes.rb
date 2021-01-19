Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/memes" => "memes#index"
    get "/memes/:id" => "memes#show"
    post "/memes" => "memes#create"
    patch "/memes/:id" => "memes#update"
    delete "/memes/:id" => "memes#destroy"

    get "/monsters" => "monsters#index"
    get "/monsters/:id" => "monsters#show"
    post "/monsters" => "monsters#create"
    patch "/monsters/:id" => "monsters#update"
    delete "/monsters/:id" => "monsters#destroy"
    
    get "/users" => "users#index"
    post "/users" => "users#create"
    
    post "/sessions" => "sessions#create"

  end

  root 'application#index'
  get '/*path', to: 'application#index'
end
