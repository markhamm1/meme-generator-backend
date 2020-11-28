Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/memes" => "memes#index"
    post "/memes" => "memes#create"
    
    get "/users" => "users#index"


  end
end