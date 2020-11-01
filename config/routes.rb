Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles      #now it will expose all the routes after the command "rails routes --expanded" [:show, :index, :new, :create, :edit, :update]
end

