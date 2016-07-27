Rails.application.routes.draw do

resources :games do
  get :autocomplete_gamesapi_name, :on => :collection
end

post '/rate' => 'rater#create', :as => 'rate'
devise_for :users
root to: "about#about"

resources :games
get '/plan' => 'games#plan'
get '/completed' => 'games#completed'
get '/about' => 'about#about'

end
