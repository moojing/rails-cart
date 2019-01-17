Rails.application.routes.draw do
   

  namespace :admins do
    resources 'users'
    resources 'products'
    resources 'categories'
    resources 'coupons'
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
     
    get 'orders/new'
    post 'orders/create' ,:to=> 'orders#create'
 

    post '/upload' , :to=> 'upload#create'
    get '/upload/products/:id' , :to=> 'upload#show'
    delete '/upload/delete/:image_id' , :to=> 'upload#delete'
    
    post '/contacts' , :to=> 'contacts#create'
    
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
    }
    devise_scope :user do 
      get 'users/success' ,:to=>'users/registrations#success'
    end
    
    
    

    get '/admins' , :to => 'admins/dashboard#index' ,:as=>'admin_root'
    
    namespace :admins do
      resources :users
    end

    devise_for :admins, controllers: {
      sessions: 'admins/sessions', 
      registrations: 'admins/registrations'
    }
    
end
