Rails.application.routes.draw do
  
  root :to => 'pages#home'

  namespace :products do
    get '/categories/:id', :to => 'products_categories#show'
    get '/:id', :to => 'products#show'
  end

  namespace :news do
    get '/categories/:id', :to => 'news_categories#show'
    get '/:id', :to => 'news#show'
  end

  namespace :account do
    get '/edit' , :to=>'account#edit'
    get '/password' , :to=>'account#password'
    get '/address' , :to=>'account#address'
  end
  
  get 'cart' , :to=> 'cart#show'
  
  scope :my do 
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end 

 
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
end
