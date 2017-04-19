Rails.application.routes.draw do

  # resources :games do
  #   get :autocomplete_gamesapi_name, :on => :collection
  # end

  namespace :api do
    resources :gamesapi, defaults: {format: :json} do
    end
  end

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # devise_for :users, :controllers => {:registrations => "my_devise/registrations"}
  root to: "home#homeindex"

  # resources :games
  # get '/plan' => 'games#plan'
  # get '/completed' => 'games#completed'
  # get '/about' => 'about#about'
  # post '/search' => 'about#search'

  # Views that use React Components
  get '/games_index' => 'games#newindex'
  get '/home' => 'home#homeindex'

  get '/getsearchresults/:query' => 'home#getsearchresults'
  get '/getnewgames' => 'home#getnewgames'

end
