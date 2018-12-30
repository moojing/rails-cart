Rails.application.routes.draw do
  
  root :to => 'pages#home'

  
    get '/products/categories/:id', :to => 'products_categories#show'
    get '/products/:id', :to => 'products#show'
  

    get '/news/categories/:id', :to => 'news_categories#show'
    get '/news/:id', :to => 'news#show'
  

    get '/account/edit' , :to=>'account#edit'
    get '/account/password' , :to=>'account#password'
    get '/account/address' , :to=>'account#address'
  
  
    get '/cart' , :to=> 'cart#show'
    
    get '/admins' , :to => 'admins/dashboards#show' ,:as=>'admin_root'
    
    authenticated :admin do
      root :to => "dashboard#show"
    end 
    
    
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations' 
    }
    
    
    devise_for :admins, controllers: {
      sessions: 'admins/sessions', 
      registrations: 'admins/registrations'
    }
    
end
