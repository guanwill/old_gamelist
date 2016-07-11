Rails.application.routes.draw do

post '/rate' => 'rater#create', :as => 'rate'
devise_for :users
root to: "games#index"

resources :games
get '/plan' => 'games#plan'
get '/completed' => 'games#completed'

end
