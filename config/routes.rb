Rails.application.routes.draw do
  
  namespace :admins do
    get 'users/index'
    get 'users/new'
    get 'users/create'
    get 'users/edit'
    get 'users/destroy'
  end
  root :to => 'pages#home'

  
    get '/products/categories/:id', :to => 'products_categories#show'
    get '/products/:id', :to => 'products#show'
  

    get '/news/categories/:id', :to => 'news_categories#show'
    get '/news/:id', :to => 'news#show'
  

    get '/account/login' , :to=>'account#login'
    get '/account/edit' , :to=>'account#edit'
    get '/account/password' , :to=>'account#password'
    get '/account/address' , :to=>'account#address'
  
    get '/cart' , :to=> 'cart#show'
    
    post '/contacts' , :to=> 'contacts#create'
    
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations' 
    }

    get '/admins' , :to => 'admins/dashboard#index' ,:as=>'admin_root'
    
    namespace :admins do
      resources :users
    end

    devise_for :admins, controllers: {
      sessions: 'admins/sessions', 
      registrations: 'admins/registrations'
    }
    
end
