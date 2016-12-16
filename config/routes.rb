Rails.application.routes.draw do
    
  get 'pages/home'

    root 'prayers#index'
    
    resources :prayers 
    
    devise_for :users
    
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
