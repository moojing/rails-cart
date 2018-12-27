Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => 'pages#home'
  get 'products/categories/:id', :to => 'products_categories#show'
  get 'products/:id', :to => 'products#show'

  get 'news/categories/:id', :to => 'news_categories#show'
  get 'news/:id', :to => 'news#show'
  
  get 'cart' , :to=> 'cart#show'

  get '/users/edit' , :to=>'users#edit'
  get '/users/password' , :to=>'users#password'
  get '/users/address' , :to=>'users#address'
  
  
end
