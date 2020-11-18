Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles      #now it will expose all the routes after the command "rails routes --expanded" [:show, :index, :new, :create, :edit, :update]
  get 'signup', to: 'users#new' #when in the URL the "/signup" will be requested it will be routed to the "users" controller and it will use the action/method called "new"
  resources :users, except: [:new]  #in this way we will get all of our routes for users but we already defined the new route as 'signup', the execept will ensure that we will get all the routes for users execpt for the 'new' that we already redifined
                                    #all the routes are given because the word "resources"  is used
end

