Rails.application.routes.draw do
   
 
 
 
  namespace :admins do
    resources 'users'
    resources 'products'
    resources 'categories'
    resources 'coupons'
    resources 'posts'
    resources 'post_categories'

  end
  root :to => 'pages#home'

  
    get '/products/categories/:slug', :to => 'products_categories#show'
    
    get '/products/:slug', :to => 'products#show'
  
    resources :product

  get '/posts/categories/:slug', :to => 'post_categories#show'
    get '/posts/:slug', :to => 'posts#show'
  
 
  
    get '/cart' , :to=> 'cart#show'
     
    get '/orders/new'
    get '/orders/success'
    post '/orders' ,:to=> 'orders#create'
    post '/coupons/check', :to => 'coupons#check'

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
