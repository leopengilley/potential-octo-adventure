Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index, :show] #what does this do

  resources :bags

  resources :pokemons

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/bags/show/:id' => 'bags#show'
  get '/bags/index' => 'bags#index'
  get '/bags/:id/edit' => 'bags#edit'

  get '/users/show/:id' => 'users#show'

end
